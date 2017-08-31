import java.lang.reflect.Method;

void setup() {
  new ReflectionTester(this, "testFunction");
  exit();

}

void testFunction() {
  println("I'm called!");
}

class ReflectionTester {
  
  ReflectionTester(PApplet p, String method) {
    p.method(method);
  }

}
