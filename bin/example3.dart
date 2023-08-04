void main(List<String> args) {
  print(add());
  print(add(1, null));
  print(add(null, 2));
  print(add(1, 2));
  print(add(2, 9));
}

int add([
  int? a,
  int? b,
]) {
  return a + b;
}

extension NullableAdd<T extends num> on T? {
  T operator +(T? other) {
    if (this != null && other == null) {
      return this as T;
    } else if (this == null && other != null) {
      return other;
    } else if (this == null && other == null) {
      return 0 as T;
    } else {
      return this!.abs() + other! as T;
    }
  }
}
