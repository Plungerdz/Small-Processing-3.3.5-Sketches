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
    new Reflect(deep, "forCard"+id);
  }

  void display(String trans) {
    pushMatrix();
    new Reflect(deep, trans);
    fill(255);
    rect(0, 0, cardWidth, cardHeight, 60);
    fill(0);
    boolean fits=!(titleSize*name.length()>cardWidth);
    if (title!=null) {
      textFont(title, titleSize);
      if (fits)
        text(this.name, -cardWidth/2+20, -cardHeight/2+50);
      else {
        int cut=0;
        for (int i=0; i<name.length(); i++) {
          if (name.charAt(i)==' ') {
            cut=i;
            break;
          }
        }
        String first=name.substring(0, cut);
        String last=name.substring(cut+1);

        text(first, -cardWidth/2+20, -cardHeight/2+50);
        text(last, -cardWidth/2+20, -cardHeight/2+100);
      }
    }
    if (rules!=null) {
      textFont(ruletext, ruleSize);
      text(this.rules, -cardWidth/2+20, 0);
    }
    popMatrix();
  }
}