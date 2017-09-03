class Stack<T> {
  ArrayList<T> tray;

  Stack() {
    tray = new ArrayList<T>();
  }

  void push(T a) {
    tray.add(a);
  }

  boolean isEmpty() {
    if (tray.size()==0) return true;
    else return false;
  }

  void pop() {
    if (!isEmpty())
      tray.remove(tray.size()-1);
  }

  T peek() {
    return tray.get(tray.size()-1);
  }
}