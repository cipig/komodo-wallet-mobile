import urllib.request
import json
import os
import shutil
from typing import Any
import concurrent.futures
import argparse


COINS_URL = "https://raw.githubusercontent.com/KomodoPlatform/coins"
COINS_CI_PATH = "./coins_ci.json"
COINS_PATH = "./assets/coins.json"
COINS_CONFIG_PATH = "./assets/coins_config.json"
COIN_ICONS_PATH = "./assets/coin-icons"
ICON_DOWNLOAD_TIMEOUT_SECONDS = 10
CONCURRENCY_LIMIT = 4


def main() -> None:
    parser = init_argparse()
    args = parser.parse_args()

    if args.force:
        clean_coin_assets()

    coin_configs_exist = os.path.exists(COINS_PATH) and os.path.exists(
        COINS_CONFIG_PATH
    )
    coin_icons_exist = os.path.exists(COIN_ICONS_PATH)
    if coin_configs_exist and coin_icons_exist:
        print("Coin configs and icons already exist. Skipping download.")
        return

    coins_repo_commit = load_coins_commit()
    download_coin_configs(coins_repo_commit)
    coin_names = load_coin_names()

    if not os.path.exists(COIN_ICONS_PATH):
        os.mkdir(COIN_ICONS_PATH)

    download_coin_icons(coins_repo_commit, coin_names)


def download_coin_configs(coins_repo_commit: str) -> None:
    """
    Download the coins.json and coins_config.json files from the coins repo
    :param coins_repo_commit: commit id of the coins repo
    :return: None
    """
    coins_json_url = COINS_URL + f"/{coins_repo_commit}/coins"
    coins_config_url = COINS_URL + f"/{coins_repo_commit}/utils/coins_config.json"

    coins_json = urllib.request.urlopen(coins_json_url).read().decode("utf-8")
    coins_config = urllib.request.urlopen(coins_config_url).read().decode("utf-8")

    with open(COINS_PATH, "w") as f:
        f.write(coins_json)

    with open(COINS_CONFIG_PATH, "w") as f:
        f.write(coins_config)


def download_icon(coins_repo_commit: str, coin_name: str) -> None:
    """
    Download the icon for a single coin from the coins repo
    :param coins_repo_commit: commit id of the coins repo
    :param coin_name: name of the coin
    :return: None
    """
    try:
        icon_url = COINS_URL + f"/{coins_repo_commit}/icons/{coin_name}.png"
        icon = urllib.request.urlopen(icon_url).read()

        with open(f"{COIN_ICONS_PATH}/{coin_name}.png", "wb") as f:
            f.write(icon)
    except Exception as e:
        print(f"Failed to download icon for {coin_name}: {e}")
        raise e


def download_coin_icons(
    coins_repo_commit: str,
    coin_names: list[str],
    max_concurrency: int = CONCURRENCY_LIMIT,
    timeout: int = ICON_DOWNLOAD_TIMEOUT_SECONDS,
) -> None:
    """
    Download the coin icons from the coins repo in parallel
    :param coins_repo_commit: commit id of the coins repo
    :param coin_names: list of coin names
    :param max_concurrency: maximum number of concurrent downloads
    :param timeout: timeout for each download in seconds
    :return: None
    """
    with concurrent.futures.ThreadPoolExecutor(max_workers=max_concurrency) as executor:
        futures = {
            executor.submit(download_icon, coins_repo_commit, coin_name)
            for coin_name in coin_names
        }
        for future in concurrent.futures.as_completed(futures):
            # Exceptions that occur in the threads are allowed to propagate
            # to the main thread, so that the program can exit with a non-zero
            # exit code. This is useful for CI/CD pipelines.
            future.result(timeout=timeout)


def load_coin_names(
    coins_path: str = COINS_PATH, coins_config_path: str = COINS_CONFIG_PATH
) -> list[str]:
    """
    Load the coin names from the coins.json file
    by taking the first part of the `coin` field in each coin object
    :param coins_path: path to the coins.json file
    :return: list of coin names
    """
    coins: list[dict[str, Any]] = []
    with open(coins_path, "r") as f:
        coins = json.load(f)

    with open(coins_config_path, "r") as f:
        coins_config = json.load(f)
        coins += [coins_config[key] for key in coins_config.keys()]

    if len(coins) == 0:
        raise Exception("No coins found in coins.json")

    coin_names = [str(coin["coin"].split("-")[0]).lower() for coin in coins]

    return coin_names


def load_coins_commit(ci_path: str = COINS_CI_PATH) -> str:
    """
    Load the commit id from the coins_ci.json file
    :param ci_path: path to the coins_ci.json file
    :return: commit id
    """
    with open(ci_path, "r") as f:
        ci = json.load(f)

    if "coins_repo_commit" not in ci:
        raise Exception("coins_repo_commit not found in coins_ci.json")

    return ci["coins_repo_commit"]


def init_argparse() -> argparse.ArgumentParser:
    """Initialize argparse

    Returns:
        argparse.ArgumentParser: parser
    """
    parser = argparse.ArgumentParser(
        usage="%(prog)s [OPTION]...",
        description="Download the latest coin configs and icons.",
    )
    parser.add_argument(
        "-f",
        "--force",
        action="store_true",
        help="Force download the latest coin configs and icons. NOTE: This will delete the existing files.",
    )
    return parser


def clean_coin_assets() -> None:
    """Remove existing coin config files and icons."""
    if os.path.exists(COINS_PATH):
        os.remove(COINS_PATH)

    if os.path.exists(COINS_CONFIG_PATH):
        os.remove(COINS_CONFIG_PATH)

    if os.path.exists(COIN_ICONS_PATH):
        shutil.rmtree(COIN_ICONS_PATH, ignore_errors=True)


if __name__ == "__main__":
    main()
