class TrackingEntryModel<T> {
  final int id;
  final DateTime time;
  final T value;

  const TrackingEntryModel({
    required this.time,
    required this.value,
    required this.id,
  });
}
