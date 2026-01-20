enum MovementType {
  originating('Originating'),
  through('Through'),
  terminating('Terminating'),
  turnaround('Turnaround');

  final String label;
  const MovementType(this.label);
}
