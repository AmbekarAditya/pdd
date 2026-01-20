// ignore_for_file: constant_identifier_names
enum LocoType {
  wap7_5_wag9('WAP-7 / WAP-5 / WAG-9'),
  wdm_wdp('WDM / WDP'),
  emu_memu('EMU / MEMU'),
  other('Other');

  final String label;
  const LocoType(this.label);
}
