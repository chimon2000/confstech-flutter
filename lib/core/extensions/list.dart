extension ImmutableList<T> on List<T> {
  List<T> concat(T item) => List<T>.from(<T>[...this, item]);
  List<T> deleteWhere(bool test(T element)) => this.skipWhile(test);
}
