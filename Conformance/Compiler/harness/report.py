#!/usr/bin/env python3
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: report.py

Description:
Test report manager for harness of Cangjie language
'''

import argparse
import enum
import json
import logging
import re
from datetime import datetime
from os.path import exists, isfile, getmtime

from core.config import VerbosityLevel
from reporter.plain_text_reporter import PlainTextReporter
from reporter.html_reporter import HTMLReporter
from reporter.junit_reporter import JUnitReporter
from utils.utils import process_assertions
from utils.version import PROG_VERSION, PROG_VERSION_DATE


class ReportType(str, enum.Enum):
  '''Report type enum'''
  PLAIN = 'plain'
  HTML = 'html'
  JUNIT = 'junit'


class Reporter:
  '''Class Reporter for creating test reports'''

  def __init__(self):
    self._sort_by_choises = ['path', 'name', 'status', 'assertion', 'mode', 'structure',
                             'timeout', 'compile_time', 'execute_time']
    self._filter_by_choises = ['path', 'name', 'status', 'assertion', 'mode', 'structure',
                               'timeout', 'compile_time', 'execute_time', 'output']

    self.report_file = None
    arg_parser = self._create_parser()
    args = arg_parser.parse_args()

    self._logger = logging.getLogger(__name__)
    self.debug = args.debug
    if args.debug:
      logging.basicConfig(format='%(asctime)s:[%(levelname)s]:(%(filename)s) - %(message)s')
      logging.getLogger().setLevel(logging.DEBUG)
    else:
      logging.basicConfig(format='%(asctime)s:[%(levelname)s]: %(message)s')
      logging.getLogger().setLevel(logging.INFO)
    self._logger.debug('Args: %s\n', args)

    self.verbosity = None
    self.test_name: str = None
    self.sort_by = None
    self.sort_rev = False
    self.filter_by = None
    self.filter_pattern: str = None
    self.filter_inv = False
    # Parse cmd agrs
    self._process_args(args)

    self.max_width = 120
    self._exclude_utils = False

  def __del__(self):
    if self.report_file is not None:
      self.report_file.close()

  def _create_parser(self):
    '''Reporter arguments parser'''
    parser = argparse.ArgumentParser(description='Reporter for Cangjie Harness', add_help=False,
                                     formatter_class=argparse.RawTextHelpFormatter)
    parser.add_argument('--data-file', '-i', action='store', dest='data_file', required=True,
                        help='Path to file with test run data')
    parser.add_argument('--report-file', '-o', action='store', dest='report_file',
                        help='Path to the file to save the report. If it was not set, then print to console')
    parser.add_argument('--report-type', '-t', action='store', dest='report_type',
                        help='Test report type (default: plain)', choices=['plain', 'junit', 'html'], default='plain')
    parser.add_argument('--verbosity', '-l', action='store', dest='verbosity', default='detailed',
                        help='Reporting verbosity level for plain text report (default: detailed)',
                        choices=['short', 'detailed', 'verbose'])
    parser.add_argument('--test', action='store', dest='test', default=None,
                        help='Show only test(s) details by name or path')

    parser.add_argument('--sort-by', action='store', dest='sort_by',
                        help='Tests list sorting parameter for plain text report (default: path)', default='path',
                        choices=self._sort_by_choises)
    parser.add_argument('--sort-reverse', action='store_true', dest='sort_rev',
                        help='Reverse sorting of tests list for plain text report')
    parser.add_argument('--filter-by', action='store', dest='filter_by',
                        help='Parameter which will be used for filtering', default=None,
                        choices=self._filter_by_choises)
    parser.add_argument('--filter-pattern', action='store', dest='filter_pattern',
                        help='Tests filtering pattern', default=None)
    parser.add_argument('--filter-invert', action='store_true', dest='filter_inv',
                        help='Use tests not matched to filtering pattern for report')

    parser.add_argument('--no-color', action='store_true', dest='log_no_color',
                        help='Disable output log coloring for plain text report')
    parser.add_argument('--debug', action='store_true',
                        dest='debug', help='Enable debug mode')
    parser.add_argument('--help', '-h', action='help', help='Show this help message and exit')
    parser.add_argument('--version', '-v', action='version', help='Show program\'s version number and exit',
                        version=f'Cangjie Harness Reporter: {PROG_VERSION} ({PROG_VERSION_DATE})')
    return parser

  def _process_args(self, args):
    # input data
    if exists(args.data_file) and isfile(args.data_file):
      self.data_file = args.data_file
      self._logger.debug('Data file: %s', self.data_file)
    else:
      self._logger.error('Path to the data file is wrong: %s', args.data_file)

    # output file
    if args.report_file is None:
      self.report_file = None
      self._logger.debug('Report file was not set')
    else:
      self.report_file = open(args.report_file, 'w+', encoding='utf-8')
      self._logger.debug('Report file: %s', self.report_file.name)

    # report type
    if args.report_type is None:
      self.report_type = ReportType.PLAIN
    else:
      value = args.report_type
      try:
        self.report_type = ReportType(value)
        self._logger.debug('Report type: %s', self.report_type.value)
      except ValueError:
        self._logger.error('Value of the report type property is wrong: %s', value)
        self._logger.info('The report type property set to default value: %s', ReportType.PLAIN)
        self.report_type = ReportType.PLAIN

    # verbosity level
    if args.verbosity is None:
      self.verbosity = VerbosityLevel.SHORT
    else:
      try:
        self.verbosity = VerbosityLevel(args.verbosity)
        self._logger.debug('Verbosity level: %s', self.verbosity.value)
      except ValueError:
        self._logger.error('Value of the verbosity level property is wrong: %s', args.verbosity)
        self._logger.info('The verbosity level property set to default value: %s', VerbosityLevel.SHORT)
        self.verbosity = VerbosityLevel.SHORT

    # test name
    if args.test is not None:
      self.test_name = args.test
      self._logger.debug('Test name: %s', self.test_name)

    # sort by
    if args.sort_by in self._sort_by_choises:
      # convert from command line options to stored parameter's names
      if args.sort_by == 'path':
        self.sort_by = 'test_path'
      elif args.sort_by == 'timeout':
        self.sort_by = 'timeout factor'
      elif args.sort_by == 'status':
        self.sort_by = 'result'
      else:
        self.sort_by = args.sort_by
      self._logger.debug('Sort by: %s', self.sort_by)
    elif args.sort_by is not None:
      self._logger.error('Value of the sort_by property is wrong: %s', value)
      self._logger.info('The sort_by property was skiped')
      self.sort_by = None

    # filter by
    if args.filter_by in self._filter_by_choises:
      # convert from command line options to stored parameter's names
      if args.filter_by == 'path':
        self.filter_by = 'test_path'
      elif args.filter_by == 'timeout':
        self.filter_by = 'timeout factor'
      elif args.filter_by == 'status':
        self.filter_by = 'result'
      else:
        self.filter_by = args.filter_by
      self._logger.debug('Filter by: %s', self.filter_by)
    elif args.filter_by is not None:
      self._logger.error('Value of the filter_by property is wrong: %s', value)
      self._logger.info('The filter_by property was skiped')
      self.filter_by = None

    if self.filter_by is None and args.filter_pattern is not None:
      self._logger.error('Value of the filter_by property was not set')
      self._logger.info('The filter_pattern property was skiped')
      args.filter_pattern = None
    elif self.filter_by is not None and args.filter_pattern is None:
      self._logger.error('Value of the filter_by property was not set')
      self._logger.info('The filter_pattern property was skiped')
      self.filter_by = None
    elif args.filter_pattern is not None:
      self.filter_pattern = str(args.filter_pattern).lower()
      self._logger.debug('Filter pattern: %s', self.filter_pattern)

    # is reversed sorting
    self.sort_rev = args.sort_rev
    self._logger.debug('Reverse sort value: %s', self.sort_rev)
    # is inverted filtering
    self.filter_inv = args.filter_inv
    self._logger.debug('Filter invertion value: %s', self.filter_inv)
    # is colored
    self._is_colored = not args.log_no_color
    self._logger.debug('Is colored: %s', self._is_colored)

  def write_message_to_console(self, message: str):
    '''Write message to log file or print to display'''
    message = message.replace('\\x1b', '\x1b')  # To correctly process stdout from CompletedProcess
    cleared_message = re.sub(r'\x1b\[[0-9;]+m', '', message)
    if self._is_colored:
      print(message)
    else:
      print(cleared_message)

  def write_message_to_file(self, message: str):
    '''Write message to log file or print to display'''
    message = message.replace('\\x1b', '\x1b')  # To correctly process stdout from CompletedProcess
    cleared_message = re.sub(r'\x1b\[[0-9;]+m', '', message)
    if self._is_colored:
      self.report_file.write(f'{message}\n')
    else:
      self.report_file.write(f'{cleared_message}\n')

  def _process_assertions_children(self, assertions):
    for i in range(1, len(assertions)):
      if assertions[i-1][0] in assertions[i][0]:  # Chapter has children
        child_index = 0
        is_the_end = i + child_index == len(assertions)
        while not is_the_end and assertions[i-1][0] in assertions[i+child_index][0]:  # go through childrens
          assertions[i-1][2] += assertions[i+child_index][2]
          child_index += 1
          is_the_end = i + child_index == len(assertions)
    return assertions

  def create_report(self):
    '''Create report'''
    creation_date = getmtime(self.data_file)
    time_stamp = datetime.strftime(datetime.fromtimestamp(creation_date), '%Y-%m-%d %H:%M:%S')
    self._logger.debug('Date of creation the metadata file: %s', time_stamp)
    report_cfg = {
        'report_file': self.data_file,
        'verbosity': self.verbosity,
        'creation_date': creation_date,
        'sort_by': self.sort_by,
        'sort_rev': self.sort_rev,
        'filter_by': self.filter_by,
        'filter_pattern': self.filter_pattern,
        'filter_inv':  self.filter_inv,
        'is_colored': self._is_colored,
        'total_time': None
    }
    if self.report_file is None:
      write_message = self.write_message_to_console
    else:
      write_message = self.write_message_to_file

    # Loading data
    self._logger.debug('Start loading data')
    try:
      with open(self.data_file, 'r', encoding='utf-8') as read_file:
        data = json.load(read_file)
    except json.decoder.JSONDecodeError:
      self._logger.warning('Metadata file is corrupted. Trying to recover data from it.')
      with open(self.data_file, 'r', encoding='utf-8') as read_file:
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
    testing_cfg = data[0]
    if 'total_time' in data[-1]:
      report_cfg['total_time'] = data[-1]['total_time']
      tests: list = data[2:-1]
    else:
      self._logger.warning('Total tests run time was not found in metadata file.')
      tests: list = data[2:]
    self._logger.debug('Test config from loaded metadata: %s', testing_cfg)
    self._logger.debug('Tests count in metadata: %s', len(tests))
    assertions: list = process_assertions(testing_cfg['tests_root_path'])

    if self.test_name is None:
      # Filtering tests
      if self.filter_by is not None:
        self._logger.debug('Start filtering data')
        if self.filter_by == 'output':
          tests_with_comp_log = [item for item in tests if item['compile_log'] is not None]
          filtered_comp_log_tests = [item['test_path'] for item in tests_with_comp_log if self.filter_pattern in str(item['compile_log']).lower()]
          self._logger.debug('Length of filtered_comp_log_tests: %s', len(filtered_comp_log_tests))
          tests_with_exec_log = [item for item in tests if item['execute_log'] is not None]
          filtered_exec_log_tests = [item['test_path'] for item in tests_with_exec_log if self.filter_pattern in str(item['execute_log']).lower()]
          self._logger.debug('Length of filtered_exec_log_tests: %s', len(filtered_exec_log_tests))
          filtered_tests_paths = list(set(filtered_comp_log_tests) | set(filtered_exec_log_tests))
          self._logger.debug('Length of filtered_tests_paths: %s', len(filtered_tests_paths))
          filtered_tests = [item for item in tests if item['test_path'] in filtered_tests_paths]
        else:
          filtered_tests = [item for item in tests if self.filter_pattern in str(item[self.filter_by]).lower()]
        if self.filter_inv:
          tests = [item for item in tests if item not in filtered_tests]
        else:
          tests = filtered_tests
        self._logger.debug('Tests count after filtering: %s', len(tests))
      if len(tests) == 0:
        self._logger.error('No one test was found for creating report. Try to change filter or select another metadata file.')
        return

      if self.report_type == ReportType.PLAIN:
        # Sorting tests
        if self.sort_by is not None:
          self._logger.debug('Start sorting data')
          tests_with_nones = [item for item in tests if item[self.sort_by] is None]
          tests_without_nones = [item for item in tests if item[self.sort_by] is not None]
          tests_without_nones.sort(key=lambda item: item[self.sort_by], reverse=self.sort_rev)
          if self.sort_rev:
            tests_without_nones.extend(tests_with_nones)
            tests = tests_without_nones
          else:
            tests_with_nones.extend(tests_without_nones)
            tests = tests_with_nones
          self._logger.debug('End sorting data')

      if self.report_type == ReportType.PLAIN:
        self._logger.debug('Create plain text report')
        ptr = PlainTextReporter(report_cfg, testing_cfg, tests, assertions, write_message)
        ptr.create_report()
      elif self.report_type == ReportType.HTML:
        self._logger.debug('Create HTML report')
        html_reporter = HTMLReporter(report_cfg, testing_cfg, tests, assertions, write_message, self.debug)
        html_reporter.create_report()
      elif self.report_type == ReportType.JUNIT:
        self._logger.debug('Create JUnit report')
        junit_reporter = JUnitReporter(report_cfg, testing_cfg, tests, write_message)
        junit_reporter.create_report()
      else:
        self._logger.error('Something went wrong and report type property is wrong: %s', self.report_type)
    else:
      filtered_tests = [item for item in tests if self.test_name in str(item['name']).lower()]
      if len(filtered_tests) == 0:
        self._logger.debug('No one test was found with name: %s', self.test_name)
        self._logger.debug('Trying to find by path...')
        filtered_tests = [item for item in tests if self.test_name in str(item['test_path']).lower()]
      if len(filtered_tests) == 0:
        self._logger.error('No one test was found for creating report. Try to change test name or select another metadata file.')
        return
      report_cfg['verbosity'] = VerbosityLevel.VERBOSE
      ptr = PlainTextReporter(report_cfg, testing_cfg, tests, [], write_message)
      for item in filtered_tests:
        ptr.write_test_info(item)


def main():
  '''Initialization of reporter and generate report'''
  reporter = Reporter()
  reporter.create_report()


if __name__ == '__main__':
  main()
