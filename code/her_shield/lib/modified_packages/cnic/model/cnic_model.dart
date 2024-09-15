/// this class is used to store data from package and display data on user screen

class CnicModel {
  String cnicNumber = "";
  String cnicHolderName = "";
  String cnicHolderGivenName = "";
  String cnicHolderSex = "";
  String cnicExpiryDate = "";
  String cnicHolderDateOfBirth = "";

  @override
  String toString() {
    var string = '';
    string += cnicNumber.isEmpty ? "" : ' Number = $cnicNumber\n';
    string += cnicHolderSex.isEmpty ? "" : ' Holder Sex = $cnicHolderSex\n';
    string +=
        cnicExpiryDate.isEmpty ? "" : ' Expiry Date = $cnicExpiryDate\n';
    string +=
        cnicHolderName.isEmpty ? "" : ' Holder Name = $cnicHolderName\n';
    string += cnicHolderGivenName.isEmpty ? "" : ' Holder Given Name = $cnicHolderGivenName\n';
    string += cnicHolderDateOfBirth.isEmpty
        ? ""
        : ' Holder DoB = $cnicHolderDateOfBirth\n';
    return string;
  }
}
