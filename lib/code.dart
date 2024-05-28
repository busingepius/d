void main() {


  String commaSeparatedPriceBuffer(String price) {
    StringBuffer buffer = new StringBuffer(price);
    int length = buffer.length;
    int indexPosition = length - 3;

    while(indexPosition>0){
      length = buffer.length;
      String bufferString = buffer.toString();



      String valueToInsert = ",";
      String part1 = bufferString.substring(0, indexPosition);  // "Hello "
      String part2 = bufferString.substring(indexPosition);
      String result = part1 + valueToInsert + part2;

      buffer.clear();
      buffer.write(result);
      //buffer.write("!");
      indexPosition = indexPosition-3 ;


    }
    return buffer.toString();
  }


 /* String commaSeparatedPrice(String price) {
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
*/
  print(commaSeparatedPriceBuffer("112345X6789"));
}
