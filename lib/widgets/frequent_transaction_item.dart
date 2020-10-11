import 'package:flutter/material.dart';
import 'package:peoples_bank/widgets/Beneficiary_List_item.dart';
import '../custom_icons_icons.dart';

class FrequentTransactionItem extends StatelessWidget {
  final String name;
  final String account;
  final String branch;
  final IconData trailing;
  final String image;
  final String id;
  final String intraORinter;
  final String contact;

  FrequentTransactionItem(this.name, this.account, this.branch, this.trailing,
      this.image, this.id, this.intraORinter, this.contact);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (this.intraORinter == 'intra') {
          Navigator.pushNamed(context, "/favoriteIntraBankBeneficiary",
              arguments: BeneficiaryListItem(
                  this.id,
                  this.name,
                  this.account,
                  this.branch,
                  this.image,
                  this.intraORinter,
                  this.contact,
                  null,
                  null));
        } else if (this.intraORinter == 'inter') {
          Navigator.pushNamed(context, "/favoriteInterBankBeneficiary",
              arguments: BeneficiaryListItem(
                  this.id,
                  this.name,
                  this.account,
                  this.branch,
                  this.image,
                  this.intraORinter,
                  this.contact,
                  null,
                  null));
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Card(
          margin: EdgeInsets.all(5.0),
          child: ListTile(
            contentPadding: EdgeInsets.all(10),
            leading: CircleAvatar(
              child: Image.network(image),
            ),
            title: Text(
              name,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF616161),
                  fontSize: 16),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  account,
                  style: TextStyle(fontSize: 13),
                ),
                Text(
                  branch,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            trailing: Icon(
              trailing,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
