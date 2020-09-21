import 'package:flutter/material.dart';
import '../widgets/Beneficiary_List_item.dart';

class FundTransferScreen extends StatelessWidget {
  static const routeName = '/beneficiarylist';
  final favouritePayment = [
    {
      'name': 'Amila Senewirathne',
      'account': '056-856-0-9458625',
      'branch': 'People\'s bank - Matara',
      'image':
          'https://ui-avatars.com/api/?size=128&rounded=true&background=4caf50&color=fff&name=Am+Se'
    },
    {
      'name': 'Thamal Dilanka',
      'account': '021-976-2-8668642',
      'branch': 'Sampath Bank - Koswatta',
      'image':
          'https://ui-avatars.com/api/?size=128&rounded=true&background=00bcd4&color=fff&name=Th+Dil',
    },
    {
      'name': 'Kavindu Tharaka',
      'account': '235-346-0-8458688',
      'branch': 'People\'s bank - Weeraketiya',
      'image':
          'https://ui-avatars.com/api/?size=128&rounded=true&background=f44336&color=fff&name=Ka+Th'
    },
    {
      'name': 'Chamod Rathnayake',
      'account': '845-323-4-67834567',
      'branch': 'Bank of Ceylon - Chilaw',
      'image':
          'https://ui-avatars.com/api/?size=128&rounded=true&background=607d8b&color=fff&name=Ch+Ra',
    },
    {
      'name': 'Dinuka Perera',
      'account': '321-976-2-8668642',
      'branch': 'Bank of Ceylon - Makola',
      'image':
          'https://ui-avatars.com/api/?size=128&rounded=true&background=8bc34a&color=fff&name=Di+Pe',
    },
    {
      'name': 'Isuru Lakshan',
      'account': '912-236-1-5558683',
      'branch': 'Nations Trust Bank - Sooriyawewa',
      'image':
          'https://ui-avatars.com/api/?size=128&rounded=true&background=8d64d7&color=fff&name=Is+Lak'
    },
    {
      'name': 'Charitha Attalage',
      'account': '732-724-6-1356245',
      'branch': 'Commercial Bank - Tangalle',
      'image':
          'https://ui-avatars.com/api/?size=128&rounded=true&background=00bcd4&color=fff&name=Ch+Att',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: favouritePayment
            .map((payment) => BeneficiaryListItem(payment['name'],
                payment['account'], payment['branch'], payment['image']))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Color(0xFFFFFFFF),),
        onPressed: () {},
        backgroundColor: Color(0xFFC8262C),
      ),
    );
  }
}
