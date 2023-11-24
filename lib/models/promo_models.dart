class promoModels {
  String? title;
  String? image;
  String? desc;

  promoModels({this.title, this.image, this.desc});

  List<promoModels> getPromo() {
    return [
      promoModels(
          title: "Get your greens for less",
          image: 'assets/images/banner1.png',
          desc:
              "Enjoy exclusive discounts at Ranch Market, your go-to veggie supermarket"),
      promoModels(
          title: "Level up your gaming experience",
          image: 'assets/images/banner2.png',
          desc: "Get exciting cashback offers on topping up your game balance")
    ];
  }
}
