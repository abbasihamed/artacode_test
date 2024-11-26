class PngAsset {
  PngAsset._();

  static final PngAsset _instanse = PngAsset._();

  static PngAsset get i => _instanse;

  final String welcome = 'assets/images/welcome.png';
  final String joyStick = 'assets/images/joy_stick.png';
  final String login = 'assets/images/login.png';
  final String phones = 'assets/images/phones.png';
  final String tv = 'assets/images/tv.png';
  final String watch = 'assets/images/watch.png';
}
