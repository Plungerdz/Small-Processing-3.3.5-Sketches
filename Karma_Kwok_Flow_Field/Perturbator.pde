class Perturbator {
  ArrayList<PVector> knownMoves;
  PVector pos;
  int iteratingOver=0;
  final int interpolations=10;
  int interpolatingOver=10;
  int quantization;
  
  Perturbator(int moveCount, PVector position) {
    knownMoves = new ArrayList<PVector>();
    float turnAngle = TWO_PI/moveCount;
    for (float i=0; i<=TWO_PI; i+=turnAngle) {
      knownMoves.add(new PVector(sin(i)*jitterMagnitude, cos(i)*jitterMagnitude));
    }
    knownMoves = shuffle(knownMoves);
    quantization=moveCount;
    pos=position;
  }
  
  void update() {
    pos.add(knownMoves.get(iteratingOver));
    //TODO: Figure a way to proportion the vectors such that it interpolates smoothly
    /*if (interpolatingOver==0) {*/
      iteratingOver++;
      iteratingOver%=quantization;
    /*  interpolatingOver=interpolations;
    } else {
    
    }*/
    
  }
  
}
