class FromAccountNumberService {
  static final List<String> accNumbers = [
    '783522398924',
    '212522398845',
    '655522398523',
    '823212398533',
    '912322398545',
    '725522398512',
    '655522398514',
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = List();
    matches.addAll(accNumbers);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}

class PaymentOptionsService {
  static final List<String> paymentOptions = [
    'LANKAPAY - ONLINE',
    'LANKAPAY - SLIPS'
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = List();
    matches.addAll(paymentOptions);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}

class IdentityTypeService {
  static final List<String> identityOptions = [
    'National ID Number',
    'Driving License Number',
    'Passport Number',
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = List();
    matches.addAll(identityOptions);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}

class BankNamesService {
  static final List<String> bankNames = [
    'Amana Bank',
    'Bank of Ceylon',
    'Commercial Bank',
    'DFCC Bank PLC',
    'Hatton National Bank',
    'HSBC Bank',
    'National Development Bank',
    'Nations Trust Bank PLC',
    'Pan Asia Banking Corporation',
    'Sampath Bank PLC',
    'Seylan Bank PLC',
    'Union Bank of Colombo PLC',
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = List();
    matches.addAll(bankNames);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}

class BankBranchNameService {
  static final List<String> branchNames = [
    'Akkaraipattu',
    'Ambalangoda',
    'Ampara',
    'Anuradhapura',
    'Badulla',
    'Balangoda',
    'Bandarawela',
    'Batticaloa',
    'Beruwala',
    'Boralesgamuwa',
    'Chavakachcheri',
    'Chilaw',
    'Colombo',
    'Dambulla',
    'Dehiwala-Mount Lavinia',
    'Embilipitiya',
    'Eravur',
    'Galle',
    'Gampaha',
    'Gampola',
    'Hambantota',
    'Haputale',
    'Hatton-Dickoya',
    'Hikkaduwa',
    'Horana',
    'Ja-Ela',
    'Jaffna',
    'Kadugannawa',
    'Kaduwela',
    'Kalmunai',
    'Kalutara',
    'Kandy',
    'Kattankudy (Kathankudi)',
    'Katunayake (Seeduwa)',
    'Kegalle',
    'Kilinochchi',
    'Kinniya',
    'Kolonnawa',
    'Kuliyapitiya',
    'Kurunegala',
    'Maharagama',
    'Mannar',
    'Matara',
    'Minuwangoda',
    'Moneragala',
    'Moratuwa',
    'Mullaitivu',
    'Nawalapitiya',
    'Negombo',
    'Nuwara Eliya',
    'Panadura',
    'Peliyagoda',
    'Point Pedro',
    'Polonnaruwa',
    'Puttalam',
    'Ratnapura',
    'Seethawakapura (Avissawella)',
    'Sri Jayawardenepura (Kotte)',
    'Tangalle',
    'Thalawakele-Lindula',
    'Trincomalee',
    'Valvettithurai',
    'Vavuniya',
    'Wattala-Mabole',
    'Wattegama',
    'Weligama'
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = List();
    matches.addAll(branchNames);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}
