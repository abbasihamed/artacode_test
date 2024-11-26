class SvgAsset {
  SvgAsset._();

  static final SvgAsset _instance = SvgAsset._();

  static SvgAsset get i => _instance;

  final String logo = 'assets/icons/logo.svg';
  final String loguot = 'assets/icons/logout.svg';
  final String arrowUp = 'assets/icons/arrow_up.svg';
}
