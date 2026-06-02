# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: html_reporter.py

Description:
Test reporter in HTML for harness of Cangjie language
'''

from datetime import datetime
import json
import logging
from os.path import abspath, dirname, join

from core.config import VerbosityLevel
from drivers.test.base_test import TestResult, TestRunMode
from utils.utils import unify_tests


class HTMLReporter:
  '''Class HTMLReporter for creating test reports in html format'''

  def __init__(self, cfg: dict, testing_cfg: dict, tests: list, assertions: list, write_line: callable, debug = False):
    self._logger = logging.getLogger(__name__)
    self._debug = debug
    self._html_template = join(dirname(abspath(__file__)), 'report_template', 'report_template.html')
    self._tcfg = testing_cfg
    self._tests = tests
    self._write_line = write_line
    assertions_mod = {}
    for item in assertions:
      suite_path = item[4]
      item = item[:-1]
      if suite_path in assertions_mod:
        assertions_mod[suite_path].append(item)
      else:
        assertions_mod[suite_path] = [item]
    self._assertions = assertions_mod
    self._total_time = ''
    if 'total_time' in cfg and cfg['total_time'] is not None:
      self._total_time = f'{cfg["total_time"]:.3f}s'

    if 'creation_date' in cfg:
      self._time_stamp = datetime.fromtimestamp(cfg['creation_date']).isoformat()
    else:
      self._logger.warning('Creation date wasn\'t set for HTML report. Current date and time will be used for it.')
      self._time_stamp = datetime.now().isoformat()

    if 'verbosity' in cfg:
      if VerbosityLevel(cfg['verbosity']) != VerbosityLevel.DETAILED:
        self._logger.warning('Reporting verbosity level option was skipped for HTML report')

    show_sorting_warn = False
    if 'sort_by' in cfg and cfg['sort_by'] != 'test_path':
      show_sorting_warn = True
    if 'sort_rev' in cfg and cfg['sort_rev']:
      show_sorting_warn = True
    if show_sorting_warn:
      self._logger.warning('Sorting options were skipped for HTML report')

    if 'is_colored' in cfg and not cfg['is_colored']:
      self._logger.warning('No coloring option was skipped for HTML report')

  def minify_fields_names(self):
    '''Minify test data fields names'''
    for item in self._tests:
      item['n'] = item.pop('name')
      item['p'] = item.pop('test_path')
      item['a'] = item.pop('assertion')
      item['d'] = item.pop('description')
      item['m'] = item.pop('mode')
      item['neg'] = item.pop('is_negative')
      item['warn'] = item.pop('compile_warning')
      item['repl'] = item.pop('is_replayed')
      item['e_t'] = item.pop('expect_timeout')
      item['t_f'] = item.pop('timeout_factor')
      item['c'] = item.pop('comment')
      item['c_l'] = item.pop('compile_log')
      item['e_l'] = item.pop('execute_log')
      item['b_p'] = item.pop('binary_path')
      item['r'] = item.pop('result')
      item['c_time'] = item.pop('compile_time')
      item['e_time'] = item.pop('execute_time')
      item['i'] = item.pop('issue')
      if 'macrolib' in item:
        item['ml'] = item.pop('macrolib')
      if 'autodiff' in item:
        item['ad'] = item.pop('autodiff')
      if 'structure' in item:
        item['s'] = item.pop('structure')
      if 'dependencies' in item:
        item['dep'] = item.pop('dependencies')
      if 'package' in item:
        item['pac'] = item.pop('package')

  def create_report(self):
    '''Create testing report'''
    # get html template and replace placeholder by metadata
    template = None
    with open(self._html_template, 'r', encoding='utf-8') as read_file:
      template = read_file.read()
    self._tests = unify_tests(self._tests, self._tcfg)

    # Preparing stats info
    tests_with_comp_time = [item['compile_time'] for item in self._tests if item['compile_time'] is not None]
    max_comp_time = None
    longest_comp_test = None
    if len(tests_with_comp_time) > 0:
      max_comp_time = max(tests_with_comp_time)
      longest_comp_test = [item['name'] for item in self._tests if item['compile_time'] == max_comp_time]

    tests_with_exec_time = [item['execute_time'] for item in self._tests if item['execute_time'] is not None]
    max_exec_time = None
    longest_exec_test = None
    if len(tests_with_exec_time) > 0:
      max_exec_time = max(tests_with_exec_time)
      longest_exec_test = [item['name'] for item in self._tests if item['execute_time'] == max_exec_time]

    stats = {
      'runDate': self._time_stamp,
      'totalNum': len(self._tests),
      'passed': len([item['name'] for item in self._tests if TestResult(item['result']) == TestResult.PASSED]),
      'failed': len([item['name'] for item in self._tests if TestResult(item['result']) == TestResult.FAILED]),
      'errored': len([item['name'] for item in self._tests if TestResult(item['result']) == TestResult.ERRORED]),
      'incomplete': len([item['name'] for item in self._tests if TestResult(item['result']) == TestResult.INCOMPLETE]),
      'skipped': len([item['name'] for item in self._tests if TestResult(item['result']) == TestResult.SKIPPED]),
      'compOnly': len([item['name'] for item in self._tests if item['mode'] == TestRunMode.compilationOnly.value]),
      'exec': len([item['name'] for item in self._tests if item['mode'] == TestRunMode.run.value]),
      'negative': len([item['name'] for item in self._tests if item['is_negative']]),
      'testTime': self._total_time,
      'longCompTest': None if longest_comp_test is None else longest_comp_test[0],
      'longCompTestTime': max_comp_time,
      'longExecTest': None if longest_exec_test is None else longest_exec_test[0],
      'longExecTestTime': max_exec_time
    }
    self.minify_fields_names()
    if self._debug:
      plain_text_cfg = json.dumps(self._tcfg, indent=2)
      plain_text_stats = json.dumps(stats, indent=2)
      plain_text_tests = json.dumps(self._tests, indent=2)
      plain_text_assertions = json.dumps(self._assertions, indent=2)
    else:
      plain_text_cfg = json.dumps(self._tcfg)
      plain_text_stats = json.dumps(stats)
      plain_text_tests = json.dumps(self._tests)
      plain_text_assertions = json.dumps(self._assertions)

    template = template.replace('PLACEHOLDER_FOR_CFG', plain_text_cfg)
    template = template.replace('PLACEHOLDER_FOR_STATS', plain_text_stats)
    template = template.replace('PLACEHOLDER_FOR_DATA', plain_text_tests)
    result = template.replace('PLACEHOLDER_FOR_SUITE', plain_text_assertions)
    self._write_line(result)
