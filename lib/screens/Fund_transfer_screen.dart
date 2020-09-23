import 'package:flutter/material.dart';
import '../widgets/Beneficiary_List_item.dart';

class FundTransferScreen extends StatelessWidget {
  static const routeName = '/beneficiarylist';
  var _favouriteBeneficiary = [
    {
      'name': 'Amila Senewirathne',
      'account': '05685609458625',
      'branch': 'People\'s bank - Matara',
      'image':
          'https://ui-avatars.com/api/?size=128&rounded=true&background=4caf50&color=fff&name=Am+Se',
      'intraORinter': 'intra',
      'contact': '0712343546'
    },
    {
      'name': 'Thamal Dilanka',
      'account': '02197628668642',
      'branch': 'Sampath Bank - Koswatta',
      'image':
          'https://ui-avatars.com/api/?size=128&rounded=true&background=00bcd4&color=fff&name=Th+Dil',
      'intraORinter': 'inter',
      'contact': '0717676876'
    },
    {
      'name': 'Kavindu Tharaka',
      'account': '23534608458688',
      'branch': 'People\'s bank - Weeraketiya',
      'image':
          'https://ui-avatars.com/api/?size=128&rounded=true&background=f44336&color=fff&name=Ka+Th',
      'intraORinter': 'intra',
      'contact': '0767362543'
    },
    {
      'name': 'Chamod Rathnayake',
      'account': '845323467834567',
      'branch': 'Bank of Ceylon - Chilaw',
      'image':
          'https://ui-avatars.com/api/?size=128&rounded=true&background=607d8b&color=fff&name=Ch+Ra',
      'intraORinter': 'inter',
      'contact': '0756873214'
    },
    {
      'name': 'Isuru Lakshan',
      'account': '32197628668642',
      'branch': 'Bank of Ceylon - Sooriyawewa',
      'image':
          'https://ui-avatars.com/api/?size=128&rounded=true&background=8d64d7&color=fff&name=Is+Lak',
      'intraORinter': 'inter',
      'contact': '0778989744'
    },
    {
      'name': 'Dinuka Perera',
      'account': '91223675558683',
      'branch': 'Nations Trust Bank - Makola',
      'image':
          'https://ui-avatars.com/api/?size=128&rounded=true&background=8bc34a&color=fff&name=Di+Pe',
      'intraORinter': 'inter',
      'contact': '0711122341'
    },
    {
      'name': 'Charitha Attalage',
      'account': '73272461356245',
      'branch': 'Commercial Bank - Tangalle',
      'image':
          'https://ui-avatars.com/api/?size=128&rounded=true&background=00bcd4&color=fff&name=Ch+Att',
      'intraORinter': 'inter',
      'contact': '0723423456'
    }
  ];

  get favouriteBeneficiary => _favouriteBeneficiary;

  set favouriteBeneficiary(favouriteBeneficiary) {
    _favouriteBeneficiary = favouriteBeneficiary;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: _favouriteBeneficiary
            .map((beneficiary) => BeneficiaryListItem(
                beneficiary['name'],
                beneficiary['account'],
                beneficiary['branch'],
                beneficiary['image'],
                beneficiary['intraORinter'],
                beneficiary['contact']))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Color(0xFFFFFFFF),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/addBeneficiary');
        },
        backgroundColor: Color(0xFFC8262C),
      ),
    );
  }
}
