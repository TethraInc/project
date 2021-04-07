import 'package:flutter/material.dart';
import 'package:sixthapp/screens/payment-service.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  PaymentGateway createState() => PaymentGateway();
}

class PaymentGateway extends State<HomePage> {
  onItemPress(BuildContext context, int index) {
    switch (index) {
      case 0:
        var resposne = StripeService.payViaExistingCard(
          amount: '150',
          currency: 'USD',
        );
        if (resposne.success == true) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(resposne.message),
            duration: new Duration(milliseconds: 1200),
          ));
        }
        break;
      case 1:
        Navigator.pushNamed(context, '/existing-cards');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.separated(
            itemBuilder: (context, index) {
              Icon icon;
              Text text;

              switch (index) {
                case 0:
                  icon = Icon(Icons.add_circle, color: theme.primaryColor);
                  text = Text('Pay via new card');
                  break;
                case 1:
                  icon = Icon(Icons.credit_card, color: theme.primaryColor);
                  text = Text('Pay via existing card');
                  break;
              }

              return InkWell(
                onTap: () {
                  onItemPress(context, index);
                },
                child: ListTile(
                  title: text,
                  leading: icon,
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
                  color: theme.primaryColor,
                ),
            itemCount: 2),
      ),
    );
    ;
  }
}
