class Card {
  String name;
  String rules;
  String type;
  int attack;
  int health;
  int id;


  Card(String name_, String rules_, String type_) {
    name=name_;
    rules=rules_;
    type=type_;
    globalId++;
    id=globalId;
  }

  Card(String name_, String rules_, String type_, int attack_, int health_) {
    this.name=name_;
    this.rules=rules_;
    this.type=type_;
    this.attack=attack_;
    this.health=health_;
    globalId++;
    id=globalId;
  }

  void effect() {
    new ReflectionTester(deep,"forCard"+id);
  }
  
  void display(float x, float y) {
    fill(255);
    rect(x,y,cardWidth,cardHeight,60);
    fill(0);
    textFont(title,60);
    text(this.name,x-cardWidth/2+20,y-cardHeight/2+50);
    textFont(ruletext,40);
    text(this.rules,x-cardWidth/2+20,y);
  }
}