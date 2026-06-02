#!/usr/bin/env python3
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: diff_runs.py

Description:
Differential comparator of two test reports from harness of Cangjie language
'''

import argparse
import difflib
import enum
import json
import logging
from os.path import exists, isfile

from utils.utils import clear_message, unify_tests
from utils.version import PROG_VERSION, PROG_VERSION_DATE
from diff.html_diff import HTMLDiff
from diff.plain_text_diff import PlainTextDiff

class DiffType(str, enum.Enum):
  '''Diff type enum'''
  PLAIN = 'plain'
  HTML = 'html'

class DiffReporter:
  '''Class DiffReporter for comparing difference of test reports'''

  def __init__(self):
    self.report_file = None
    arg_parser = self._create_parser()
    args = arg_parser.parse_args()

    self._logger = logging.getLogger(__name__)
    self._debug = args.debug
    if args.debug:
      logging.basicConfig(format='%(asctime)s:[%(levelname)s]:(%(filename)s) - %(message)s')
      logging.getLogger().setLevel(logging.DEBUG)
    else:
      logging.basicConfig(format='%(asctime)s:[%(levelname)s]: %(message)s')
      logging.getLogger().setLevel(logging.INFO)
    self._logger.debug('Args: %s\n', args)

    self.first = None
    self.second = None
    self.tests1 = None
    self.tests2 = None
    self.test_name: str = None
    self.skip_same = None
    self.comp_commands = None
    self.unify_paths = None
    self.write_message = None
    self.hide_overview = None
    self.hide_diff_sets = None
    self.hide_diff_res = None
    self.hide_diff_logs = None
    self._is_colored = True
    # Parse cmd agrs
    self._process_args(args)
    self._exclude_utils = False

  def __del__(self):
    if self.report_file is not None:
      self.report_file.close()

  def _create_parser(self):
    '''Reporter arguments parser'''
    parser = argparse.ArgumentParser(description='Diff for Cangjie Harness reports', add_help=False,
                                     formatter_class=argparse.RawTextHelpFormatter)
    general = parser.add_argument_group('general arguments')
    formating = parser.add_argument_group('format arguments')
    log_diff = parser.add_argument_group('log diffs turning arguments')
    other = parser.add_argument_group('other arguments')
    general.add_argument('first', help='First json report file for comparing')
    general.add_argument('second', help='Second json report file for comparing')
    general.add_argument('-o', '--output-file', action='store', dest='report_file',
                        help='Path to the file to save the comparsion result. If it was not set, then print to console')
    general.add_argument('-t', '--report-type', action='store', dest='report_type',
                        help='Test report type (default: plain) **html type is not supported yet**', choices=['plain', 'html'], default='plain')

    general.add_argument('--test', action='store', dest='test', default=None,
                        help='Show only test(s) details by name or path')

    formating.add_argument('-ho', '--hide-overview', action='store_true', dest='hide_overview', default=False,
                        help='Hide overview section in the plain text report')
    formating.add_argument('-hds', '--hide-diff-sets', action='store_true', dest='hide_diff_sets', default=False,
                        help='Hide tests sets difference section in the plain text report')
    formating.add_argument('-hdr', '--hide-diff-res', action='store_true', dest='hide_diff_res', default=False,
                        help='Hide tests result difference section in the plain text report')
    formating.add_argument('-hdl', '--hide-diff-logs', action='store_true', dest='hide_diff_logs', default=False,
                        help='Hide logs difference section in the plain text report')

    log_diff.add_argument('--include-same', action='store_true', dest='not_skip_same', default=False,
                        help='Don\'t skip tests with same logs in log difference report')
    log_diff.add_argument('--compare-commands', action='store_true', dest='comp_commands', default=False,
                        help='Add compile and execute commands in the logs comparsion')
    log_diff.add_argument('--unify-paths', action='store_true', dest='unify_paths', default=False,
                        help='Replace \'\\\' to \'/\' in logs (useful to check results from different OSes)')

    other.add_argument('--no-color', action='store_true', dest='log_no_color',
                        help='Disable output log coloring for the plain text report')
    other.add_argument('--debug', action='store_true',
                        dest='debug', help='Enable debug mode')
    other.add_argument('-h', '--help', action='help', help='Show this help message and exit')
    other.add_argument('-v', '--version', action='version', help='Show program\'s version number and exit',
                        version=f'Cangjie Harness Difference Reporter: {PROG_VERSION} ({PROG_VERSION_DATE})')
    return parser

  def _process_args(self, args):
    # input data
    if exists(args.first) and isfile(args.first) and exists(args.second) and isfile(args.second):
      self.first = args.first
      self._logger.debug('First data file: %s', self.first)
      self.second = args.second
      self._logger.debug('Second data file: %s', self.second)
    else:
      if exists(args.first) and isfile(args.first):
        self._logger.error('Path to the first data file is wrong: %s', args.first)
      if exists(args.second) and isfile(args.second) :
        self._logger.error('Path to the second data file is wrong: %s', args.second)

    # output file
    if args.report_file is None:
      self.report_file = None
      self.write_message = self.write_message_to_console
      self._logger.debug('Report file was not set')
    else:
      self.report_file = open(args.report_file, 'w+', encoding='utf-8')
      self.write_message = self.write_message_to_file
      self._logger.debug('Report file: %s', self.report_file.name)

    # report type
    if args.report_type is None:
      self.report_type = DiffType.PLAIN
    else:
      value = args.report_type
      try:
        self.report_type = DiffType(value)
        self._logger.debug('Report type: %s', self.report_type.value)
      except ValueError:
        self._logger.error('Value of the report type property is wrong: %s', value)
        self._logger.info('The report type property set to default value: %s', DiffType.PLAIN)
        self.report_type = DiffType.PLAIN

    # test name
    if args.test is not None:
      self.test_name = args.test
      self._logger.debug('Test name: %s', self.test_name)

    # should we skip same tests
    self.skip_same = not args.not_skip_same
    self._logger.debug('Skip same value: %s', self.skip_same)
    # should we skip compile and run commands in diff logs
    self.comp_commands = args.comp_commands
    self._logger.debug('Compare commands value: %s', self.comp_commands)
    # should we replace \\ to / in logs
    self.unify_paths = args.unify_paths
    self._logger.debug('Unify paths value: %s', self.unify_paths)

    self.hide_overview = args.hide_overview
    self._logger.debug('Hide overview value: %s', self.hide_overview)
    self.hide_diff_sets = args.hide_diff_sets
    self._logger.debug('Hide diff tests sets value: %s', self.hide_diff_sets)
    self.hide_diff_res = args.hide_diff_res
    self._logger.debug('Hide diff results value: %s', self.hide_diff_res)
    self.hide_diff_logs = args.hide_diff_logs
    self._logger.debug('Hide diff logs value: %s', self.hide_diff_logs)

    # is colored
    self._is_colored = not args.log_no_color
    self._logger.debug('Is colored: %s', self._is_colored)


  def _read_data(self, data_file: str) -> tuple:
    try:
      with open(data_file, 'r', encoding='utf-8') as read_file:
        data = json.load(read_file)
    except json.decoder.JSONDecodeError:
      self._logger.warning('Metadata file is corrupted. Trying to recover data from it.')
      with open(data_file, 'r', encoding='utf-8') as read_file:
        plain_data = read_file.readlines()
        for i in range(1, 5):
          if '},' in plain_data[-i]:
            plain_data[-i] = plain_data[-i].replace(',', '')
            break
        try:
          data = json.loads('\n'.join(plain_data))
        except json.decoder.JSONDecodeError:
          self._logger.error('Recovering data from metadata file was failed.')
          exit(1)
    tests: list = data[2:-1]  # We skips tests run config and drivers meta-information
    cfg = data[0]
    return (tests, cfg)

  def _skip_commands(self, log: list):
    res = []
    for line in log:
      if 'compilation command:' not in line and 'run command:' not in line:
        res.append(line)
    return res

  def _diff_two_tests(self, test1, test2):
    '''Check difference of two tests run'''
    compile_log1 = test1['compile_log'].splitlines(keepends=True)
    compile_log2 = test2['compile_log'].splitlines(keepends=True)

    execute_log1 = test1['execute_log'].splitlines(keepends=True)
    execute_log2 = test2['execute_log'].splitlines(keepends=True)

    if not self.comp_commands:
      compile_log1 = self._skip_commands(compile_log1)
      compile_log2 = self._skip_commands(compile_log2)
      execute_log1 = self._skip_commands(execute_log1)
      execute_log2 = self._skip_commands(execute_log2)

    compile_log_diff = '\t'.join(difflib.unified_diff(compile_log1, compile_log2))
    execute_log_diff = '\t'.join(difflib.unified_diff(execute_log1, execute_log2))

    same_logs = 0
    compile_diff = 0
    execute_diff = 0
    both_diff = 0
    is_same_results = test1['result'] == test2['result']

    info = {
      'p': test1["test_path"], # test path
      'n': test1["name"],      # test name
      'r1': test1["result"], # test1 result
      'r2': test2["result"], # test2 result
      'c_d': compile_log_diff, # diff compilation logs
      'e_d': execute_log_diff, # diff execution logs
      'eq': len(compile_log_diff) == 0 and len(execute_log_diff) == 0 # have same logs
    }

    if len(compile_log_diff) == 0 and len(execute_log_diff) == 0:
      same_logs = 1
    else:
      if len(compile_log_diff) != 0:
        compile_diff = 1
      if len(execute_log_diff) != 0:
        execute_diff = 1
      if len(compile_log_diff) != 0 and len(execute_log_diff) != 0:
        both_diff = 1
    return (is_same_results, (test1['result'], test2['result']),
            same_logs, compile_diff, execute_diff, both_diff, info)

  def write_message_to_console(self, message: str):
    '''Write message to log file or print to display'''
    message = message.replace('\\x1b', '\x1b')  # To correctly process stdout from CompletedProcess
    if self._is_colored:
      print(message)
    else:
      cleared_message = clear_message(message)
      print(cleared_message)

  def write_message_to_file(self, message: str):
    '''Write message to log file or print to display'''
    message = message.replace('\\x1b', '\x1b')  # To correctly process stdout from CompletedProcess
    if self._is_colored:
      self.report_file.write(f'{message}\n')
    else:
      cleared_message = clear_message(message)
      self.report_file.write(f'{cleared_message}\n')

  def create_report(self):
    '''Create report'''
    if self.report_file is None:
      write_message = self.write_message_to_console
    else:
      write_message = self.write_message_to_file

    # Loading data
    self._logger.debug('Start loading data')
    (self.tests1, cfg1) = self._read_data(self.first)
    (self.tests2, cfg2) = self._read_data(self.second)
    # Filter tests by name or by path
    if self.test_name is not None:
      if self.test_name.startswith('./') or self.test_name.startswith('.\\'):
        self.test_name = self.test_name[2:] # Cut leading ./ or .\ symbols because they doesn't present in paths
      self.test_name = self.test_name.lower()
      filtered_tests = [item for item in self.tests1 if self.test_name in str(item['name']).lower()]
      if len(filtered_tests) == 0:
        self._logger.debug('No one test was found with name: %s', self.test_name)
        self._logger.debug('Trying to find by path...')
        filtered_tests = [item for item in self.tests1 if self.test_name in str(item['test_path']).lower()]
      if len(filtered_tests) == 0:
        self._logger.error('No one test was found for creating difference report. Try to change test name or select another metadata file.')
        return
      self.tests1 = filtered_tests
      filtered_tests = [item for item in self.tests2 if self.test_name in str(item['name']).lower()]
      if len(filtered_tests) == 0:
        self._logger.debug('No one test was found with name: %s', self.test_name)
        self._logger.debug('Trying to find by path...')
        filtered_tests = [item for item in self.tests2 if self.test_name in str(item['test_path']).lower()]
      if len(filtered_tests) == 0:
        self._logger.error('No one test was found for creating difference report. Try to change test name or select another metadata file.')
        return
      self.tests2 = filtered_tests

    self.tests1 = unify_tests(self.tests1, cfg1, self.unify_paths)
    self.tests1.sort(key=lambda item: item['id'])

    self.tests2 = unify_tests(self.tests2, cfg2, self.unify_paths)
    self.tests2.sort(key=lambda item: item['id'])

    len1 = len(self.tests1)
    len2 = len(self.tests2)
    self._logger.debug('Length tests1: %s, length tests2: %s', len1, len2)
    if len1 <= len2:
      ts1 = self.tests1
      ts2 = self.tests2
    else:
      ts1 = self.tests2
      ts2 = self.tests1

    same_counter = 0
    differ_counter = 0
    same_results = 0
    differ_results = 0

    last_index = 0
    results_stats = {}
    log_diffs = []
    for i in range(len(ts1)): # pylint: disable=consider-using-enumerate
      for j in range(last_index, len(ts2)):
        if ts1[i]['id'] == ts2[j]['id']:
          last_index = j
          if len1 <= len2:
            (is_same_results, (res1, res2),
              same_logs, _, _, _, log_diff_info) = self._diff_two_tests(ts1[i], ts2[j])
          else:
            (is_same_results, (res1, res2),
              same_logs, _, _, _, log_diff_info) = self._diff_two_tests(ts2[j], ts1[i])
          if self.skip_same:
            if not log_diff_info['eq']:
              log_diffs.append(log_diff_info)
          else:
            log_diffs.append(log_diff_info)
          same_counter += same_logs
          differ_counter += 1 - same_logs
          if is_same_results:
            same_results += 1
          else:
            differ_results += 1
          if res1 != res2:
            key = f'{res1} -> {res2}'
            if key in results_stats:
              results_stats[key].append(ts1[i]['test_path'])
            else:
              results_stats[key] = [ts1[i]['test_path']]
          break

    tests1_set = set([item['id'] for item in self.tests1])
    tests2_set = set([item['id'] for item in self.tests2])
    tmp_removed_tests = tests1_set.difference(tests2_set)
    removed_tests = []
    for item in self.tests1:
      if item['id'] in tmp_removed_tests:
        removed_tests.append({
          'p': item['test_path'],
          'r': item['result']
        })
    tmp_added_tests = tests2_set.difference(tests1_set)
    added_tests = []
    for item in self.tests2:
      if item['id'] in tmp_added_tests:
        added_tests.append({
          'p': item['test_path'],
          'r': item['result']
        })

    if self.report_type == DiffType.PLAIN:
      metadata = {
        'first': self.first,
        'second': self.second,
        'firstLen': len1,
        'secondLen': len2,
        'numDiffRes': differ_results,
        'numSameRes': same_results,
        'numDiffLogs': differ_counter,
        'numSameLogs': same_counter,
        'hide_overview': self.hide_overview,
        'hide_diff_sets': self.hide_diff_sets,
        'hide_diff_res':self.hide_diff_res,
        'hide_diff_logs': self.hide_diff_logs
      }
      pt_diff = PlainTextDiff(metadata, added_tests, removed_tests, results_stats, log_diffs, write_message, self._debug)
      pt_diff.create_report()

    elif self.report_type == DiffType.HTML:
      self._is_colored = False
      diff_res_stats = {}
      for key, value in results_stats.items():
        diff_res_stats[key] = len(value)
      stats = {
        'first': self.first,
        'second': self.second,
        'firstLen': len1,
        'secondLen': len2,
        'numAdded': len(added_tests),
        'numRemoved': len(removed_tests),
        'numDiffRes': differ_results,
        'numSameRes': same_results,
        'diffResStats': diff_res_stats,
        'numDiffLogs': differ_counter,
        'numSameLogs': same_counter,
        'sameSkipped': self.skip_same
      }
      html_diff = HTMLDiff(stats, added_tests, removed_tests, log_diffs, write_message, self._debug)
      html_diff.create_report()
    else:
      self._logger.error('Something went wrong and report type property is wrong: %s', self.report_type)

def main():
  '''Initialization of diff generator and generate diff report'''
  reporter = DiffReporter()
  reporter.create_report()


if __name__ == '__main__':
  main()
