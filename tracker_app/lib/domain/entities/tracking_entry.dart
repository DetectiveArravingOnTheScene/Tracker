class TrackingEntry<T> {
  final int id;
  final T value;
  final DateTime time;

  const TrackingEntry({
    required this.id,
    required this.time,
    required this.value,
  });
}
