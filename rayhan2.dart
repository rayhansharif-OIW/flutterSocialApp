void main(List<String> args) {
  String? nullableString;

// Using the non-null assertion operator to tell the compiler
// that you are sure nullableString is not null.
  String nonNullableString = nullableString!;

  print(nonNullableString); // This is safe because you asserted non-null.
}
