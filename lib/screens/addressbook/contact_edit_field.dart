import 'package:flutter/material.dart';
import 'package:komodo_dex/utils/utils.dart';
import 'package:komodo_dex/widgets/round_button.dart';
import 'package:komodo_dex/services/lock_service.dart';

class ContactEditField extends StatefulWidget {
  const ContactEditField({
    Key key,
    this.name,
    this.label,
    this.value,
    this.removable = false,
    this.autofocus = false,
    this.onChange,
    this.onRemove,
    this.color,
    this.padding,
    this.icon,
    this.invalid = false,
  }) : super(key: key);

  final String name;
  final bool autofocus;
  final bool removable;
  final String label;
  final String value;
  final Color color;
  final Function(String) onChange;
  final Function onRemove;
  final EdgeInsets padding;
  final Widget icon;
  final bool invalid;

  @override
  _ContactEditFieldState createState() => _ContactEditFieldState();
}

class _ContactEditFieldState extends State<ContactEditField> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    if (widget.value != null) {
      controller.text = widget.value;
    }
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.autofocus) focusNode.requestFocus();
    });

    return Row(
      children: <Widget>[
        Expanded(
            child: Card(
                margin: const EdgeInsets.only(top: 12, left: 12, right: 12),
                child: Padding(
                  padding: widget.padding ?? const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          if (widget.icon != null) ...[
                            widget.icon,
                            const SizedBox(width: 8),
                          ],
                          Text('${widget.label}:'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: <Widget>[
                          if (widget.name != 'name') ...[
                            IconButton(
                              onPressed: () => _scan(),
                              icon: Icon(Icons.add_a_photo),
                              splashRadius: 24,
                            ),
                          ],
                          Expanded(
                            child: TextField(
                              controller: controller,
                              focusNode: focusNode,
                              textCapitalization: TextCapitalization.words,
                              maxLength: 100,
                              onChanged: (String value) {
                                if (widget.onChange == null) return;
                                widget.onChange(value);
                              },
                              autocorrect: false,
                              enableInteractiveSelection: true,
                            ),
                          ),
                          if (widget.removable)
                            Padding(
                              padding: const EdgeInsets.only(left: 4, right: 4),
                              child: RoundButton(
                                  size: 24,
                                  onPressed: () {
                                    if (widget.onRemove != null)
                                      widget.onRemove();
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    size: 16,
                                  )),
                            ),
                        ],
                      ),
                    ],
                  ),
                ))),
      ],
    );
  }

  Future<void> _scan() async {
    final int lockCookie = lockService.enteringQrScanner();

    final result = await scanQr();

    if (result != null) {
      setState(() {
        controller.text = result;
      });
    }
    widget.onChange(result);

    lockService.qrScannerReturned(lockCookie);
  }
}
