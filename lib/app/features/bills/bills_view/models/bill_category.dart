class BillCategory {
  final String _id;
  final String _name;

  BillCategory({required id, required name})
      : _id = id,
        _name = name;

  get id => _id;
  get name => _name;
}
