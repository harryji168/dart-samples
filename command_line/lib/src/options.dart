// Copyright (c) 2019, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:build_cli_annotations/build_cli_annotations.dart';

part 'options.g.dart';

/// The command line argument parser generated by the `build_cli_annotations`
/// package.
ArgParser get parser => _$populateOptionsParser(ArgParser(usageLineLength: 80));

/// The command line options for this app
@CliOptions()
class Options {
  @CliOption(abbr: 'u', help: 'Required. The GitHub user')
  final String? user;

  @CliOption(
    abbr: 'i',
    help: 'The time interval to filter events.',
    allowed: ['day', 'week', 'month'],
    defaultsTo: Interval.week,
  )
  Interval interval;

  @CliOption(abbr: 'v', defaultsTo: false, help: 'Print additional event types')
  final bool? verbose;

  @CliOption(
      abbr: 'f',
      help: 'The format to display. Defaults to '
          '"Friday, October 18 at 13:55 PM: <User> opened <URL>"',
      allowed: ['default', 'markdown'])
  final String? format;

  @CliOption(abbr: 'h', negatable: false, help: 'Prints usage information.')
  final bool help;

  Options(this.user, this.interval, this.verbose, this.format, this.help);
}

/// The time interval used to filter events.
enum Interval {
  day,
  week,
  month,
}
