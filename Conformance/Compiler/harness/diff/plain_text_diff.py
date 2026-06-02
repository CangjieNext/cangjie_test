# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: plain_text_diff.py

Description:
Runs diff of two test reports in plain text format
'''

import logging

from utils.utils import PT_BOLD, PT_END_COLORING, PT_GREEN, PT_RED

class PlainTextDiff:
  '''Class PlainTextDiff for creating diff in plain text format'''

  def __init__(self, metadata: dict, tests_added: list, tests_removed: list,
              results_stats: dict, diff_logs: list, write_line: callable, debug = False):
    self._logger = logging.getLogger(__name__)
    if debug:
      self._logger.debug('Metadata value: %s', str(metadata))
      self._logger.debug('Amount of added tests: %s', str(len(tests_added)))
      if len(tests_added) > 0:
        self._logger.debug('First added test value: %s', str(tests_added[0]))
        self._logger.debug('Amount of removed tests: %s', str(len(tests_removed)))
      if len(tests_removed) > 0:
        self._logger.debug('First removed test value: %s', str(tests_removed[0]))
      self._logger.debug('Results stats keys value: %s', str(results_stats.keys()))
      self._logger.debug('Amount of diffs of logs: %s', str(len(diff_logs)))
    self._metadata = metadata
    self._tests_added = tests_added
    self._tests_removed = tests_removed
    self._results_stats = results_stats
    self._diff_logs = diff_logs
    self._write_line = write_line
    self.max_width = 120

  def _write_header(self, header: str, level=1):
    if level == 0:
      header_ch = '═'
    elif level == 1:
      header_ch = '─'
    else:
      self._write_line('')
      self._write_line(header)
      self._write_line('')
      return
    self._write_line('')
    self._write_line(header)
    header_splitter = ''.ljust(len(header), header_ch)
    self._write_line(header_splitter)
    self._write_line('')

  def _write_diff_test_sets(self, added_tests: list, removed_tests: list):
    self._write_header('Difference in tests sets:')
    if len(added_tests) > 0:
      self._write_line(f'{PT_BOLD}Added {len(added_tests)} test(s):{PT_END_COLORING}')
      added_tests.sort(key=lambda item: item['p'])
      for item in added_tests:
        self._write_line(f'\t{PT_GREEN}{item["p"]}{PT_END_COLORING}')
    else:
      self._write_line('No one new test was added.')
    if len(removed_tests) > 0:
      self._write_line(f'{PT_BOLD}Removed {len(removed_tests)} test(s):{PT_END_COLORING}')
      removed_tests.sort(key=lambda item: item['p'])
      for item in removed_tests:
        self._write_line(f'\t{PT_RED}{item["p"]}{PT_END_COLORING}')
    else:
      self._write_line('No one test was removed.')

  def _write_diff_results(self, results_stats: dict):
    self._write_header('Tests result difference:')
    for key, value in results_stats.items():
      self._write_line(f'{key} ({len(value)} test(s))')
      for path in value:
        self._write_line(f'\t{path}')

  def _write_diff_logs(self, logs_diff: list):
    self._write_header('Logs difference for each test')
    for diff_info in logs_diff:
      self._write_line(self._format_logs_diff(diff_info))

  def _format_logs_diff(self, info: dict) -> str:
    message = ''
    if info['eq']:
      message += f'The tests have the same logs: {info["p"]}'
    else:
      caption = f'{PT_END_COLORING} {PT_BOLD}{info["n"]} {PT_END_COLORING}'
      name = f'{caption.center(self.max_width + 11, "═")}{PT_END_COLORING}'  # 17 - is length of escape symbols
      message += f'{name}\n'
      message += f'{PT_BOLD}Path:{PT_END_COLORING} {info["p"]}\n'
      if info['r1'] == info['r2']:
        message += f'{PT_BOLD}Test results are same:{PT_END_COLORING} {info["r1"]}\n'
      else:
        message += f'{PT_BOLD}Test result changed:{PT_END_COLORING} {info["r1"]} -> {info["r2"]}\n'
      if len(info['c_d']) != 0:
        message += f'{PT_BOLD}Compilation log diff:{PT_END_COLORING}\n'
        for line in f'\t{info["c_d"]}'.splitlines():
          if line.startswith('\t-'):
            message += f'{PT_RED}{line}{PT_END_COLORING}\n'
          elif line.startswith('\t+'):
            message += f'{PT_GREEN}{line}{PT_END_COLORING}\n'
          else:
            message += f'{line}\n'
      if len(info['e_d']) != 0:
        message += f'{PT_BOLD}Execution log diff:{PT_END_COLORING}\n'
        for line in f'\t{info["e_d"]}'.splitlines():
          if line.startswith('\t-'):
            message += f'{PT_RED}{line}{PT_END_COLORING}\n'
          elif line.startswith('\t+'):
            message += f'{PT_GREEN}{line}{PT_END_COLORING}\n'
          else:
            message += f'{line}\n'
      message += ''.center(self.max_width - 1, '─') + '\n'
    return message

  def create_report(self):
    '''Create testing report'''
    self._write_header('Difference report', 0)

    if not self._metadata['hide_overview']:
      self._write_header('Overview')
      self._write_line('Compared reports:')
      self._write_line(f'\t{self._metadata["first"]} ({self._metadata["firstLen"]} tests)')
      self._write_line(f'\t{self._metadata["second"]} ({self._metadata["secondLen"]} tests)')
      self._write_line('')
      self._write_line(f'Number of tests added/removed: {len(self._tests_added)}/{len(self._tests_removed)}')
      self._write_line('')
      self._write_line(f'Number of different/same results: {self._metadata["numDiffRes"]}/{self._metadata["numSameRes"]}')
      for key, value in self._results_stats.items():
        self._write_line(f'\t{key}: {len(value)} test(s)')
      self._write_line('')
      self._write_line(f'Number of different/same logs: {self._metadata["numDiffLogs"]}/{self._metadata["numSameLogs"]}')

    if not self._metadata['hide_diff_sets']:
      self._write_diff_test_sets(self._tests_added, self._tests_removed)

    if not self._metadata['hide_diff_res']:
      self._write_diff_results(self._results_stats)

    if not self._metadata['hide_diff_logs']:
      self._write_diff_logs(self._diff_logs)
