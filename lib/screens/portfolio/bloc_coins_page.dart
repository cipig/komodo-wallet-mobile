import 'dart:async';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:komodo_dex/blocs/coins_bloc.dart';
import 'package:komodo_dex/blocs/main_bloc.dart';
import 'package:komodo_dex/blocs/swap_bloc.dart';
import 'package:komodo_dex/blocs/swap_history_bloc.dart';
import 'package:komodo_dex/localizations.dart';
import 'package:komodo_dex/model/balance.dart';
import 'package:komodo_dex/model/coin.dart';
import 'package:komodo_dex/model/coin_balance.dart';
import 'package:komodo_dex/screens/portfolio/coin_detail.dart';
import 'package:komodo_dex/screens/portfolio/select_coins_page.dart';
import 'package:komodo_dex/services/market_maker_service.dart';
import 'package:komodo_dex/widgets/photo_widget.dart';

class BlocCoinsPage extends StatefulWidget {
  @override
  _BlocCoinsPageState createState() => _BlocCoinsPageState();
}

class _BlocCoinsPageState extends State<BlocCoinsPage> {
  ScrollController _scrollController;
  double _heightFactor = 7;
  BuildContext contextMain;
  NumberFormat f = new NumberFormat("###,##0.0#");

  _scrollListener() {
    setState(() {
      _heightFactor = (exp(-_scrollController.offset / 60) * 6) + 1;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    if (mm2.ismm2Running) {
      coinsBloc.loadCoin(false);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _heightScreen = MediaQuery.of(context).size.height;
    double _widthScreen = MediaQuery.of(context).size.width;
    contextMain = context;

    return Scaffold(
        body: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Theme.of(context).backgroundColor,
                  expandedHeight: _heightScreen * 0.25,
                  pinned: true,
                  flexibleSpace: Builder(
                    builder: (context) {
                      return FlexibleSpaceBar(
                          collapseMode: CollapseMode.parallax,
                          centerTitle: true,
                          title: Container(
                            width: _widthScreen * 0.5,
                            child: Center(
                              heightFactor: _heightFactor,
                              child: StreamBuilder<List<CoinBalance>>(
                                  initialData: coinsBloc.coinBalance,
                                  stream: coinsBloc.outCoins,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      double totalBalanceUSD = 0;
                                      snapshot.data.forEach((coinBalance) {
                                        totalBalanceUSD +=
                                            coinBalance.balanceUSD;
                                      });
                                      return AutoSizeText(
                                        "\$${f.format(totalBalanceUSD)} USD",
                                        maxFontSize: 18,
                                        minFontSize: 12,
                                        style:
                                            Theme.of(context).textTheme.title,
                                        maxLines: 1,
                                      );
                                    } else {
                                      return Center(
                                          child: Container(
                                        child: CircularProgressIndicator(),
                                      ));
                                    }
                                  }),
                            ),
                          ),
                          background: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  LoadAsset(),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  BarGraph()
                                ],
                              ),
                            ),
                            height: _heightScreen * 0.35,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              stops: [0.01, 1],
                              colors: [
                                Color.fromRGBO(39, 71, 110, 1),
                                Theme.of(context).accentColor,
                              ],
                            )),
                          ));
                    },
                  ),
                ),
              ];
            },
            body: Container(
                color: Theme.of(context).backgroundColor, child: ListCoins())));
  }
}

class BarGraph extends StatefulWidget {
  @override
  BarGraphState createState() {
    return new BarGraphState();
  }
}

class BarGraphState extends State<BarGraph> {
  @override
  Widget build(BuildContext context) {
    double _widthScreen = MediaQuery.of(context).size.width;
    double _widthBar = _widthScreen - 32;

    return StreamBuilder<List<CoinBalance>>(
      initialData: coinsBloc.coinBalance,
      stream: coinsBloc.outCoins,
      builder: (context, snapshot) {
        bool _isVisible = true;

        if (snapshot.hasData) {
          _isVisible = true;
        } else {
          _isVisible = false;
        }

        List<Container> barItem = List<Container>();

        if (snapshot.hasData) {
          double sumOfAllBalances = 0;

          snapshot.data.forEach((coinBalance) {
            sumOfAllBalances += coinBalance.balanceUSD;
          });

          snapshot.data.forEach((coinBalance) {
            if (coinBalance.balanceUSD > 0) {
              barItem.add(Container(
                color: Color(int.parse(coinBalance.coin.colorCoin)),
                width: _widthBar *
                    (((coinBalance.balanceUSD * 100) / sumOfAllBalances) / 100),
              ));
            }
          });
        }

        return AnimatedOpacity(
          opacity: _isVisible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 300),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            child: Container(
              width: _widthBar,
              height: 16,
              child: Row(
                children: barItem,
              ),
            ),
          ),
        );
      },
    );
  }
}

class LoadAsset extends StatefulWidget {
  const LoadAsset({
    Key key,
  }) : super(key: key);

  @override
  LoadAssetState createState() {
    return new LoadAssetState();
  }
}

class LoadAssetState extends State<LoadAsset> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CoinBalance>>(
      initialData: coinsBloc.coinBalance,
      stream: coinsBloc.outCoins,
      builder: (context, snapshot) {
        List<Widget> listRet = List<Widget>();
        if (snapshot.hasData) {
          int assetNumber = 0;

          snapshot.data.forEach((coinBalance) {
            if (double.parse(coinBalance.balance.balance) > 0) {
              assetNumber++;
            }
          });

          listRet.add(Icon(
            Icons.show_chart,
            color: Colors.white.withOpacity(0.8),
          ));
          listRet.add(Text(
            AppLocalizations.of(context).numberAssets(assetNumber.toString()),
            style: Theme.of(context).textTheme.caption,
          ));
          listRet.add(Icon(
            Icons.chevron_right,
            color: Colors.white.withOpacity(0.8),
          ));
        } else {
          listRet.add(Container(
              height: 10,
              width: 10,
              child: CircularProgressIndicator(
                strokeWidth: 1.0,
              )));
        }
        return Container(
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: listRet,
          ),
        );
      },
    );
  }
}

class ListCoins extends StatefulWidget {
  const ListCoins({
    Key key,
  }) : super(key: key);

  @override
  ListCoinsState createState() {
    return new ListCoinsState();
  }
}

class ListCoinsState extends State<ListCoins> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  final SlidableController slidableController = SlidableController();

  @override
  void initState() {
    if (mm2.ismm2Running) {
      coinsBloc.loadCoin(false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CoinBalance>>(
      initialData: coinsBloc.coinBalance,
      stream: coinsBloc.outCoins,
      builder: (context, snapshot) {
        return RefreshIndicator(
            backgroundColor: Theme.of(context).backgroundColor,
            key: _refreshIndicatorKey,
            onRefresh: () => coinsBloc.loadCoin(true),
            child: Builder(builder: (context) {
              print(snapshot.connectionState);
              if (snapshot.hasData && snapshot.data.length > 0) {
                List<dynamic> datas = new List<dynamic>();
                datas.addAll(snapshot.data);
                datas.add(true);
                return ListView(
                  padding: EdgeInsets.all(0),
                  children: datas
                      .map((data) => ItemCoin(
                            mContext: context,
                            coinBalance: data,
                            slidableController: slidableController,
                          ))
                      .toList(),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingCoin();
              } else if (snapshot.data.length == 0){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AddCoinButton(),
                    Text("Please Add A Coin"),
                  ],
                );
              }
            }));
      },
    );
  }
}

class ItemCoin extends StatefulWidget {
  const ItemCoin(
      {Key key,
      @required this.mContext,
      @required this.coinBalance,
      this.slidableController})
      : super(key: key);

  final dynamic coinBalance;
  final BuildContext mContext;
  final SlidableController slidableController;

  @override
  _ItemCoinState createState() => _ItemCoinState();
}

class _ItemCoinState extends State<ItemCoin> {
  @override
  Widget build(BuildContext context) {
    double _heightScreen = MediaQuery.of(context).size.height;

    if (widget.coinBalance is bool) {
      return AddCoinButton();
    } else {
      Coin coin = widget.coinBalance.coin;
      Balance balance = widget.coinBalance.balance;
      NumberFormat f = new NumberFormat("###,##0.########");
      List<Widget> actions = new List<Widget>();
      if (double.parse(balance.balance) > 0) {
        actions.add(IconSlideAction(
          caption: AppLocalizations.of(context).send,
          color: Colors.white,
          icon: Icons.arrow_upward,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CoinDetail(
                        coinBalance: widget.coinBalance,
                        isSendIsActive: true,
                      )),
            );
          },
        ));
      }
      actions.add(IconSlideAction(
        caption: AppLocalizations.of(context).receive,
        color: Theme.of(context).backgroundColor,
        icon: Icons.arrow_downward,
        onTap: () {
          showAddressDialog(context, balance.address);
        },
      ));
      if (double.parse(balance.balance) > 0) {
        actions.add(IconSlideAction(
          caption: AppLocalizations.of(context).swap.toUpperCase(),
          color: Theme.of(context).accentColor,
          icon: Icons.swap_vert,
          onTap: () {
            mainBloc.setCurrentIndexTab(1);
            swapHistoryBloc.isSwapsOnGoing = false;
            Future.delayed(const Duration(milliseconds: 100), () {
              swapBloc.updateSellCoin(widget.coinBalance);
              swapBloc.setFocusTextField(true);
            });
          },
        ));
      }

      return Column(
        children: <Widget>[
          Slidable(
            controller: widget.slidableController,
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            actions: actions,
            child: Builder(builder: (context) {
              return InkWell(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                onLongPress: () {
                  Slidable.of(context)
                      .open(actionType: SlideActionType.primary);
                },
                onTap: () {
                  if (widget.slidableController != null &&
                      widget.slidableController.activeState != null) {
                    widget.slidableController.activeState.close();
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CoinDetail(coinBalance: widget.coinBalance)),
                  );
                },
                child: Container(
                  height: 125,
                  color: Theme.of(context).primaryColor,
                  child: Row(
                    children: <Widget>[
                      Container(
                        color: Color(int.parse(coin.colorCoin)),
                        width: 8,
                      ),
                      SizedBox(width: 16),
                      Container(
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Builder(builder: (context) {
                              String coinStr = balance.coin.toLowerCase();
                              return PhotoHero(
                                radius: 28,
                                tag: "assets/${balance.coin.toLowerCase()}.png",
                              );
                            }),
                            SizedBox(height: 8),
                            Text(
                              coin.name.toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle
                                  .copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                child: AutoSizeText(
                                  "${f.format(double.parse(balance.balance))} ${coin.abbr}",
                                  maxLines: 1,
                                  style: Theme.of(context).textTheme.subtitle,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Builder(builder: (context) {
                                NumberFormat f = new NumberFormat("###,##0.##");
                                return Text(
                                  "\$${f.format(widget.coinBalance.balanceUSD)} USD",
                                  style: Theme.of(context).textTheme.body2,
                                );
                              }),
                              widget.coinBalance.coin.abbr == "KMD" &&
                                      double.parse(widget
                                              .coinBalance.balance.balance) >=
                                          10
                                  ? Padding(
                                      padding: EdgeInsets.only(top: 8),
                                      child: OutlineButton(
                                        borderSide: BorderSide(
                                            color:
                                                Theme.of(context).accentColor),
                                        highlightedBorderColor: Colors.white,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 6, horizontal: 16),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0)),
                                        onPressed: () {
                                          CoinDetail(
                                                  coinBalance:
                                                      widget.coinBalance)
                                              .showDialogClaim(context);
                                        },
                                        child: Text(
                                          "CLAIM YOUR REWARDS",
                                          style: Theme.of(context)
                                              .textTheme
                                              .body1
                                              .copyWith(fontSize: 12),
                                        ),
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          Divider(
            height: 0,
          ),
        ],
      );
    }
  }
}

class AddCoinButton extends StatefulWidget {
  @override
  _AddCoinButtonState createState() => _AddCoinButtonState();
}

class _AddCoinButtonState extends State<AddCoinButton> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _buildAddCoinButton(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                  child: FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Theme.of(context).accentColor,
                child: Icon(
                  Icons.add,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SelectCoinsPage()),
                  );
                },
              )),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Future<bool> _buildAddCoinButton() async {
    var allCoins =
        await mm2.loadJsonCoins(await mm2.loadElectrumServersAsset());
    var allCoinsActivate = await coinsBloc.readJsonCoin();

    return allCoins.length == allCoinsActivate.length ? false : true;
  }
}