import 'package:disk_space/disk_space.dart';

Future<bool> spaceAvailable() async {
  bool available = (await (DiskSpace.getFreeDiskSpace) / 1024) >= 2;
  return available;
}
