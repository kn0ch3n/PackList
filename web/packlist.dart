import 'dart:html';

main() {
  document.body.children.add(new Element.html('<h1>PackList</h1>'));
  
  InputElement input = new InputElement();
  input.id = "input";
  input.placeholder = "Item name";
  document.body.children.add(input);
  
  ButtonElement button = new ButtonElement();
  button.id = "add";
  button.text = "Add";
  document.body.children.add(button);
  
  DivElement items = new DivElement();
  items.id = "items";
  items.style.width = "300px";
  items.style.border = "1px solid black";
  document.body.children.add(items);
  
  button.onClick.listen((event) => addItem());
  
  input.onKeyUp.listen((event) {
    if(event.keyCode == 13) {
      addItem();
    }
  });
}

addItem() {
  InputElement input = query("#input");
  DivElement items = query("#items");
  if(input.value.trim() != "") {
    PackItem item = new PackItem(input.value);
    items.children.add(item.uiElement);
    input.value = "";
    print("there are now ${items.children.length} items.");
  }
}

class PackItem {
  var name;
  var _isPacked = false;
  var _uiElement;
  
  PackItem(this.name){
    _uiElement = new DivElement();
    _uiElement.text = name;
    _uiElement.classes.add("item");
    
    _uiElement.onClick.listen((event) => isPacked = !isPacked);
  }
  
  DivElement get uiElement => _uiElement;
  
  bool get isPacked => _isPacked;
  
  set isPacked(bool value) {
    _isPacked = value;
    if(_isPacked) {
      uiElement.classes.add("packed");
    }
    else {
      uiElement.classes.remove("packed");
    }
  }
}