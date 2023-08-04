// ignore_for_file: public_member_api_docs, sort_constructors_first
void main(List<String> args) {
  final mom = Person(name: 'Jane');
  final dad = Person(name: 'John');
  final son = Person(name: 'Jack');
  final daughter = Person(name: 'Jill');

  final whiskers = Pet(name: 'Whiskers');

  final family = mom + dad;
  print('Mom + Dad = $family');

  final withWhiskers = family & whiskers;
  print('Mom + Dad + Whiskers = $withWhiskers');

  final withSon = withWhiskers + son;
  print('Mom + Dad + Whiskers + Son = $withSon');

  final withDaughter = withWhiskers + daughter;
  print('Mom + Dad + Whiskers + Son + Daughter= $withDaughter');
}

class Person {
  final String name;

  Person({required this.name});

  @override
  String toString() => 'Person(name: $name)';
}

class Pet {
  final String name;

  Pet({required this.name});

  @override
  String toString() => 'Person(name: $name)';
}

class Family {
  final List<Person> members;
  final List<Pet> pets;

  const Family({required this.members, required this.pets});

  @override
  String toString() => 'Family(members: $members, pets: $pets)';
}

extension on Person {
  Family operator +(Person other) => Family(
        members: [this, other],
        pets: [],
      );

  Family operator &(Pet other) => Family(
        members: [this],
        pets: [other],
      );
}

extension on Family {
  Family operator &(Pet other) => Family(
        members: members,
        pets: [
          ...pets,
          other,
        ],
      );
  Family operator +(Person other) => Family(
        members: [
          ...members,
          other,
        ],
        pets: pets,
      );

  Family operator ^(Family other) => Family(
        members: [
          ...members,
          ...other.members,
        ],
        pets: [
          ...pets,
          ...other.pets,
        ],
      );
}
