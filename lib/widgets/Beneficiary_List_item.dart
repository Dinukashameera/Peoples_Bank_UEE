import 'package:flutter/material.dart';

class BeneficiaryListItem extends StatelessWidget {
  // final String username;
  final String account;
  final String branch;
  final String name;
  final String image;
  final String intraORinter;
  final String contact;

  BeneficiaryListItem(this.name, this.account, this.branch, this.image,
      this.intraORinter, this.contact);

  @override
  Widget build(BuildContext context) {
    Column _buildBottomNavigationMenu() {
      return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(
                    0,
                    MediaQuery.of(context).size.height * 0.02,
                    0,
                    MediaQuery.of(context).size.height * 0.01),
                child: IconButton(
                  icon: Icon(
                    Icons.error,
                    color: Color(0xFFC8262C),
                  ),
                  onPressed: null,
                  iconSize: MediaQuery.of(context).size.height * 0.1,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(
                    0, 0, 0, MediaQuery.of(context).size.height * 0.02),
                child: Text(
                  'Are you sure to delete the Beneficiary?',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.05),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                this.name,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    color: Colors.grey[700]),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                this.account,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    color: Colors.grey[600]),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                0, MediaQuery.of(context).size.height * 0.04, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.01),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                fontWeight: FontWeight.w300),
                          ),
                        )
                      ],
                    ),
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.32,
                    decoration: BoxDecoration(
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);

                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Beneficiary Deleted!')));
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.01),
                          child: Text(
                            'Confirm',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                fontWeight: FontWeight.w300),
                          ),
                        )
                      ],
                    ),
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.32,
                    decoration: BoxDecoration(
                        color: Color(0xFFC8262C),
                        // color: Color(0xFFC8262C),
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    void _onButtonPressed() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              color: Color(0xFF737373),
              height: MediaQuery.of(context).size.height * 0.38,
              child: Container(
                child: _buildBottomNavigationMenu(),
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(40),
                    topRight: const Radius.circular(40),
                  ),
                ),
              ),
            );
          });
    }

    return GestureDetector(
      onTap: () {
        if (this.intraORinter == 'intra') {
          Navigator.pushNamed(context, "/favoriteIntraBankBeneficiary",
              arguments: BeneficiaryListItem(this.name, this.account,
                  this.branch, this.image, this.intraORinter, this.contact));
        } else if (this.intraORinter == 'inter') {
          Navigator.pushNamed(context, "/favoriteInterBankBeneficiary",
              arguments: BeneficiaryListItem(this.name, this.account,
                  this.branch, this.image, this.intraORinter, this.contact));
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.network(image),
          ),
          title: Text(
            name,
            style: TextStyle(color: Color(0xFF212121)),
          ),
          subtitle: Column(
            children: <Widget>[
              Row(
                children: [
                  Text(account),
                ],
              ),
              Row(
                children: [
                  Text(
                    branch,
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            ],
          ),
          trailing: PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                  child: GestureDetector(
                child: Text('Update'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/updateBeneficiary",
                      arguments: BeneficiaryListItem(
                          this.name,
                          this.account,
                          this.branch,
                          this.image,
                          this.intraORinter,
                          this.contact));
                },
              )),
              PopupMenuItem(
                  child: GestureDetector(
                child: Text('Delete'),
                onTap: () {
                  Navigator.pop(context);
                  _onButtonPressed();
                },
              )),
            ],
          ),
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
