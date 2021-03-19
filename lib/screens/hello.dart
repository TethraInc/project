import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:blurrycontainer/blurrycontainer.dart';

class PaymentDialog extends StatefulWidget {
  @override
  _PaymentDialogState createState() => _PaymentDialogState();
}

class _PaymentDialogState extends State<PaymentDialog> {
  // =========== DATE TIME PICKER =========== //
  //String _payment;
  //bool _showAmountError;
  TextEditingController _amountInputController = TextEditingController();

  // ========

  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  @override
  void initState() {
    super.initState();

    _showAmountError = false;
  }

  void addError({String error}) {
    if (!error.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kDefaultPadding),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(kDefaultPadding),
              boxShadow: [
                BoxShadow(
                    color: kMainColor.withOpacity(0.2),
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0)),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                      child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 5.0),
                      child: Text(
                        "Donate",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )),
                  SizedBox(height: kDefaultPadding),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: buildPaymentForm("Choose Amount"),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: kDefaultPadding * 5),
                          child: TextButton(
                            child: Text("Cancel",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        TextButton(
                          child: Text("Submit",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () {
                            // TODO: Submit Payment Function Here
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  TextFormField buildPaymentForm(String label) {
    return TextFormField(
      controller: _amountInputController,
      onSaved: (newValue) => _payment = newValue,
      onChanged: (value) {
        if (value.isNotEmpty || value.length <= 50) {
          removeError(
              error:
                  inputNullError); // inputNullError is our variable created in lib/config/constants.dart
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty || value.length > 50) {
          addError(error: inputNullError);
          return "";
        }
        return null;
      },
      // TODO: Payment Input Box Should be White background with no borders
      decoration: InputDecoration(
        labelText: label,
        hintText: label,
        alignLabelWithHint: true,
        helperMaxLines: 50,
        hintMaxLines: 50,
        errorMaxLines: 50,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 0.0,
          ),
        ),
      ),
    );
  }
}
