import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TextInputField extends StatefulWidget {
  TextInputField(
      {super.key,
      required this.label,
      required this.controller,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.obsecure = false,
      this.onTap,
      this.isMulti = false,
      this.readOnly = false,
      this.autofocus = false,
      this.errorText,
      this.contentPadding,
      this.onEditingCompleted,
      this.onChanged,
      required this.enabled,
      required this.showLabel,
      this.hint,
      this.suffix,
      this.prefix,
      this.inputFormatter,
      this.maxLength,
      this.autofillHints,
      this.enableMultiSelect = false,
      this.enableList = false});

  String label;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final bool obsecure;
  final bool readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onEditingCompleted;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final bool isMulti;
  final bool autofocus;
  final bool enabled;
  final bool showLabel;
  final String? hint;
  final String? errorText;
  EdgeInsets? contentPadding;
  @override
  State<TextInputField> createState() => _TextInputFieldState();
  final Widget? suffix;
  final Widget? prefix;
  final List<TextInputFormatter>? inputFormatter;
  final int? maxLength;
  final Iterable<String>? autofillHints;
  final bool enableMultiSelect;
  final bool enableList;
}

class _TextInputFieldState extends State<TextInputField> {
  onChanged(dynamic value) {
    if (widget.onChanged != null) widget.onChanged!(value);
  }

  bool hasError = false;
  String errorText = "";

  String? validate(String? string) {
    if (widget.validator == null) return null;
    String? err = widget.validator!(string);
    if (err == null) {
      setState(() {
        hasError = false;
        errorText = "";
      });
      return null;
    }
    setState(() {
      hasError = true;
      errorText = err;
    });
    return errorText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: widget.showLabel,
            child: Text(
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: .5,
                color: Colors.black,
              ),
              widget.label,
              maxLines: 1,
              overflow: TextOverflow.visible,
            ),
          ),
          SizedBox(height: widget.showLabel ? 8 : 0),
          TextFormField(
              toolbarOptions: const ToolbarOptions(
                copy: false,
                paste: false,
                cut: false,
                selectAll: true,
              ),
              cursorColor: Colors.black,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              onChanged: onChanged,
              onEditingComplete: widget.onEditingCompleted,
              autofocus: widget.autofocus,
              minLines: widget.isMulti ? 4 : 1,
              maxLines: widget.isMulti ? null : 1,
              onTap: widget.onTap,
              enabled: widget.enabled,
              readOnly: widget.enableList,
              obscureText: widget.obsecure,
              keyboardType: widget.keyboardType,
              controller: widget.controller,
              inputFormatters: widget.inputFormatter,
              maxLength: widget.maxLength,
              autofillHints: widget.autofillHints,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  filled: true,
                  border: hasError
                      ? OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                          borderSide:
                              BorderSide(color: Colors.red.shade800, width: 2))
                      : null,
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.black, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.black38, width: 1)),
                  // enabledBorder: enabledBorderStyle,
                  errorBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      borderSide:
                          BorderSide(color: Colors.red.shade800, width: 2)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      borderSide:
                          BorderSide(color: Colors.red.shade800, width: 2)),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.black38, width: 1)),
                  fillColor: Colors.white,
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF888888),
                  ),
                  hintText: widget.hint == null || widget.hint!.isEmpty
                      ? widget.label
                      : widget.hint,
                  contentPadding:
                      widget.contentPadding ?? const EdgeInsets.all(8.0),
                  // errorText: widget.errorText,
                  prefixIcon: widget.prefix,
                  suffixIcon: widget.suffix,
                  errorStyle: TextStyle(
                    fontSize: 0,
                    height: 0,
                  ),
                  counterText: "",
                  errorMaxLines: 1),
              validator: validate),
          hasError
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.red.shade800,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Text(
                          errorText.toString(),
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            backgroundColor: Colors.red.shade800,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(
                  height: 0,
                )
        ],
      ),
    );
  }
}
