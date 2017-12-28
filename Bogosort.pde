<T> T[] shuffle(T[] a) {
  T[] v;
  v=a;
  for (int i=v.length-1; i>0; i--) {
    int j=floor(random(i));
    T aux=v[j];
    v[j]=v[i];
    v[i]=aux;
  }
  return v;
}

boolean isSorted(Integer[] a) {
  for (int i=0; i<a.length-1; i++) {
    if (a[i]>a[i+1]) return false;
  }
  return true;
}

Integer[] bogosort(Integer[] a) {
  while (!isSorted(a)) a=shuffle(a);
  return a;
}

void setup() {
  size(displayWidth, displayHeight);
  Integer[] a={1, 9, 7, 10, 12, 3};
  a=bogosort(a);
  printArray(a);
  exit();
}

void draw() {
  
}
