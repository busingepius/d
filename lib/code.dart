void main() {
  String commaSeparatedPrice(String price) {
  String finalPrice = "";
    int position = 0;
    for (int i = price.length; i > 0; i--) {
      position++;
      finalPrice = price.substring(
            price.length - position,
            (price.length - position + 1),
          ) +
          finalPrice;
      if (position % 3 == 0) {
        finalPrice = ",$finalPrice";
      }
    }
    return finalPrice;
  }

  print(commaSeparatedPrice("12345X6789"));
}
