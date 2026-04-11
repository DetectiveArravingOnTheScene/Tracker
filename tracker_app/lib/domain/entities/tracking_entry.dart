class TrackingEntry<T> {
  final int? id;
  final int entityId;
  final T value;
  final DateTime time;

  const TrackingEntry({
    required this.id,
    required this.entityId,
    required this.time,
    required this.value,
  });
}
