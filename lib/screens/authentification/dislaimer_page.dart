import 'package:flutter/material.dart';
import 'package:komodo_dex/blocs/authenticate_bloc.dart';
import 'package:komodo_dex/blocs/coins_bloc.dart';
import 'package:komodo_dex/blocs/wallet_bloc.dart';
import 'package:komodo_dex/model/wallet.dart';
import 'package:komodo_dex/services/db/database.dart';
import 'package:komodo_dex/utils/encryption_tool.dart';
import 'package:komodo_dex/widgets/primary_button.dart';
import 'package:komodo_dex/localizations.dart';

class DislaimerPage extends StatefulWidget {

  const DislaimerPage(
      {Key key,
      this.password,
      this.isFastEncrypted,
      this.seed,
      this.onSuccess,
      this.readOnly = false})
      : super(key: key);
  final String password;
  final bool isFastEncrypted;
  final String seed;
  final Function onSuccess;
  final bool readOnly;


  @override
  _DislaimerPageState createState() => _DislaimerPageState();
}

class _DislaimerPageState extends State<DislaimerPage> {
  final ScrollController _scrollController =  ScrollController();
  bool isEndOfScroll = false;
  bool isLoading = false;
  bool _checkBoxEULA = false;
  bool _checkBoxTOC = false;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          isEndOfScroll = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<TextSpan> disclaimerToS = <TextSpan>[
      TextSpan(
          text: AppLocalizations.of(context).eulaTitle1,
          style: Theme.of(context).textTheme.title),
      TextSpan(
          text: AppLocalizations.of(context).eulaParagraphe1,
          style: Theme.of(context).textTheme.body1),
      TextSpan(
          text: AppLocalizations.of(context).eulaTitle2,
          style: Theme.of(context).textTheme.subtitle),
      TextSpan(
          text: AppLocalizations.of(context).eulaParagraphe2,
          style: Theme.of(context).textTheme.body1),
      TextSpan(
          text: AppLocalizations.of(context).eulaTitle3,
          style: Theme.of(context).textTheme.subtitle),
      TextSpan(
          text: AppLocalizations.of(context).eulaTitle4,
          style: Theme.of(context).textTheme.subtitle),
      TextSpan(
          text: AppLocalizations.of(context).eulaParagraphe3,
          style: Theme.of(context).textTheme.body1),
      TextSpan(
          text: AppLocalizations.of(context).eulaTitle5,
          style: Theme.of(context).textTheme.subtitle),
      TextSpan(
          text: AppLocalizations.of(context).eulaParagraphe4,
          style: Theme.of(context).textTheme.body1),
      TextSpan(
          text: AppLocalizations.of(context).eulaTitle6,
          style: Theme.of(context).textTheme.subtitle),
      TextSpan(
          text: AppLocalizations.of(context).eulaParagraphe5,
          style: Theme.of(context).textTheme.body1),
      TextSpan(
          text: AppLocalizations.of(context).eulaTitle7,
          style: Theme.of(context).textTheme.subtitle),
      TextSpan(
          text: AppLocalizations.of(context).eulaParagraphe6,
          style: Theme.of(context).textTheme.body1),
      TextSpan(
          text: AppLocalizations.of(context).eulaTitle8,
          style: Theme.of(context).textTheme.subtitle),
      TextSpan(
          text: AppLocalizations.of(context).eulaParagraphe7,
          style: Theme.of(context).textTheme.body1),
      TextSpan(
          text: AppLocalizations.of(context).eulaTitle9,
          style: Theme.of(context).textTheme.subtitle),
      TextSpan(
          text: AppLocalizations.of(context).eulaParagraphe8,
          style: Theme.of(context).textTheme.body1),
      TextSpan(
          text: AppLocalizations.of(context).eulaTitle10,
          style: Theme.of(context).textTheme.subtitle),
      TextSpan(
          text: AppLocalizations.of(context).eulaParagraphe9,
          style: Theme.of(context).textTheme.body1),
      TextSpan(
          text: AppLocalizations.of(context).eulaTitle11,
          style: Theme.of(context).textTheme.subtitle),
      TextSpan(
          text: AppLocalizations.of(context).eulaParagraphe10,
          style: Theme.of(context).textTheme.body1),
      TextSpan(
          text: AppLocalizations.of(context).eulaTitle12,
          style: Theme.of(context).textTheme.subtitle),
      TextSpan(
          text: AppLocalizations.of(context).eulaParagraphe11,
          style: Theme.of(context).textTheme.body1),
      TextSpan(
          text: AppLocalizations.of(context).eulaTitle13,
          style: Theme.of(context).textTheme.subtitle),
      TextSpan(
          text: AppLocalizations.of(context).eulaParagraphe12,
          style: Theme.of(context).textTheme.body1),
      TextSpan(
          text: AppLocalizations.of(context).eulaTitle14,
          style: Theme.of(context).textTheme.subtitle),
      TextSpan(
          text: AppLocalizations.of(context).eulaParagraphe13,
          style: Theme.of(context).textTheme.body1),
      TextSpan(
          text: AppLocalizations.of(context).eulaTitle15,
          style: Theme.of(context).textTheme.subtitle),
      TextSpan(
          text: AppLocalizations.of(context).eulaParagraphe14,
          style: Theme.of(context).textTheme.body1),
      TextSpan(
          text: AppLocalizations.of(context).eulaTitle16,
          style: Theme.of(context).textTheme.subtitle),
      TextSpan(
          text: AppLocalizations.of(context).eulaParagraphe15,
          style: Theme.of(context).textTheme.body1),
      TextSpan(
          text: AppLocalizations.of(context).eulaTitle17,
          style: Theme.of(context).textTheme.subtitle),
      TextSpan(
          text: AppLocalizations.of(context).eulaParagraphe16,
          style: Theme.of(context).textTheme.body1),
      TextSpan(
          text: AppLocalizations.of(context).eulaTitle18,
          style: Theme.of(context).textTheme.subtitle),
      TextSpan(
          text: AppLocalizations.of(context).eulaParagraphe17,
          style: Theme.of(context).textTheme.body1),
      TextSpan(
          text: AppLocalizations.of(context).eulaTitle19,
          style: Theme.of(context).textTheme.subtitle),
      TextSpan(
          text: AppLocalizations.of(context).eulaParagraphe18,
          style: Theme.of(context).textTheme.body1),
      TextSpan(
          text: AppLocalizations.of(context).eulaTitle20,
          style: Theme.of(context).textTheme.subtitle),
      TextSpan(
          text: AppLocalizations.of(context).eulaParagraphe19,
          style: Theme.of(context).textTheme.body1)
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).disclaimerAndTos,
            style: Theme.of(context).textTheme.title,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  controller: _scrollController,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.body1,
                          children: disclaimerToS,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    widget.readOnly
                        ? Container()
                        : Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    value: _checkBoxEULA,
                                    onChanged: (bool value) {
                                      setState(() {
                                        _checkBoxEULA = !_checkBoxEULA;
                                      });
                                    },
                                  ),
                                  Flexible(
                                      child: Text(AppLocalizations.of(context)
                                          .accepteula)),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    value: _checkBoxTOC,
                                    onChanged: (bool value) {
                                      setState(() {
                                        _checkBoxTOC = !_checkBoxTOC;
                                      });
                                    },
                                  ),
                                  Flexible(
                                      child: Text(
                                    AppLocalizations.of(context).accepttac,
                                  )),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 4),
                                child: Text(
                                  AppLocalizations.of(context).confirmeula,
                                  style: Theme.of(context).textTheme.body2,
                                ),
                              ),
                            ],
                          ),
                    PrimaryButton(
                      onPressed: (widget.readOnly
                              ? isEndOfScroll
                              : isEndOfScroll && _checkBoxEULA && _checkBoxTOC)
                          ? _nextPage
                          : null,
                      text: widget.readOnly
                          ? AppLocalizations.of(context).close
                          : AppLocalizations.of(context).next,
                      isLoading: isLoading,
                    ),
                    isLoading
                        ? const SizedBox(
                            height: 8,
                          )
                        : Container(),
                    isLoading
                        ? Text(
                            AppLocalizations.of(context).encryptingWallet,
                            style: Theme.of(context).textTheme.body1,
                          )
                        : Container()
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Future<void> _nextPage() async {
    if (widget.readOnly) {
      Navigator.of(context).pop();
    } else {
      setState(() {
        isLoading = true;
      });

      final EncryptionTool entryptionTool =  EncryptionTool();
      final Wallet wallet = walletBloc.currentWallet;
      wallet.isFastEncryption = widget.isFastEncrypted;
      walletBloc.currentWallet = wallet;

      await entryptionTool.writeData(
          KeyEncryption.SEED, wallet, widget.password, widget.seed);
      await DBProvider.db.saveWallet(wallet);
      await DBProvider.db.saveCurrentWallet(wallet);
      await coinsBloc.resetCoinDefault();

      await authBloc
          .loginUI(true, widget.seed, widget.password)
          .then((_) {
        setState(() {
          isLoading = false;
        });
        widget.onSuccess();
      });
    }
  }
}