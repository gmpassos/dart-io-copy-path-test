import 'dart:io';

import 'package:path/path.dart' as p;

void main(List<String> args) {
  var srcDir = Directory(args[0]).absolute;
  var dstDir1 = Directory(args[1]).absolute;
  var dstDir2 = Directory(args[2]).absolute;

  print('** Copy path: ${srcDir.path} -> ${dstDir1.path} [followLinks: false]');
  _copyPathSync2(srcDir.path, dstDir1.path, followLinks: false);

  print('** Copy path: ${srcDir.path} -> ${dstDir2.path} [followLinks: true]');
  _copyPathSync2(srcDir.path, dstDir2.path, followLinks: true);
}

void _copyPathSync2(String from, String to, {bool followLinks = true}) {
  if (_doNothing(from, to)) {
    return;
  }

  Directory(to).createSync(recursive: true);
  for (final file
      in Directory(from).listSync(recursive: true, followLinks: followLinks)) {
    final copyTo = p.join(to, p.relative(file.path, from: from));
    if (file is Directory) {
      Directory(copyTo).createSync(recursive: true);
    } else if (file is File) {
      File(file.path).copySync(copyTo);
    } else if (file is Link) {
      Link(copyTo).createSync(file.targetSync(), recursive: true);
    }
  }
}

bool _doNothing(String from, String to) {
  if (p.canonicalize(from) == p.canonicalize(to)) {
    return true;
  }
  if (p.isWithin(from, to)) {
    throw ArgumentError('Cannot copy from $from to $to');
  }
  return false;
}
