void main(List<String> args) {
  print('Foo Bar' - 'Bar');
  print('Bar' - 'Bar');
  print('Foo Bar' - 'Baz');
  print('Foo Bar Baz Baz Foo' - 'Foo');
}

extension Remove on String {
  String operator -(String other) => replaceAll(
        other,
        '',
      );
}
