enum TrainType {
  mailExpress('Mail / Express'),
  superfast('Superfast'),
  passenger('Passenger'),
  memuDemu('MEMU / DEMU'),
  vandeBharat('Vande Bharat'),
  rajdhaniShatabdiDuronto('Rajdhani / Shatabdi / Duronto'),
  special('Special');

  final String label;
  const TrainType(this.label);
}
