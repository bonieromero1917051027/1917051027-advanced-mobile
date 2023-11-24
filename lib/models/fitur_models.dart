class fiturModels {
  String? name;
  String? logo;

  fiturModels({this.name, this.logo});

  List<fiturModels> getFitur() {
    return [
      fiturModels(
          name: "Request", logo: 'assets/images/icon/call_received.png'),
      fiturModels(name: "Send", logo: 'assets/images/icon/call_made.png'),
      fiturModels(name: "Bills", logo: 'assets/images/icon/receipt_long.png'),
      fiturModels(name: "Top Up", logo: 'assets/images/icon/add.png'),
      fiturModels(name: "Withdraw", logo: 'assets/images/icon/payments.png'),
      fiturModels(
          name: "Games", logo: 'assets/images/icon/stadia_controller.png'),
      fiturModels(name: "Split", logo: 'assets/images/icon/splitscreen.png'),
      fiturModels(name: "Mobile", logo: 'assets/images/icon/phone_android.png')
    ];
  }
}
