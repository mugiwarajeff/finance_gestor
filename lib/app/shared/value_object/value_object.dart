abstract class ValueObject<T> {
  T value;

  ValueObject({required this.value});

  String? validate(String? toValidate);
}
