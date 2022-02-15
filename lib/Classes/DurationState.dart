class DurationState {
  const DurationState({required this.progress,  required this.buffered, required this.total});
  final Duration progress;
  final Duration buffered;
  final Duration total;
}