// anchor: protocols support

enum CoinType {
  utxo,
  smartChain,
  erc,
  bep,
  plg,
  ftm,
  qrc,
}

CoinType coinTypeFromString(String value) {
  return CoinType.values.firstWhere(
    (e) => e.name.toUpperCase() == value?.toUpperCase(),
    orElse: () => null,
  );
}