import "package:unittest/unittest.dart";

import "package:unittest/html_config.dart";

import "packlist.dart";

main() {
  useHtmlConfiguration();
  
  print("bla");
  test("packitem constructor", () {
    var item = new PackItem("Towel");
    expect(item, isNotNull);
  });
  
  test("packitem itemText propert", () {
    var item = new PackItem("Towel");
    expect(item.name, equals("Towel"));
  });
}