# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: plain_text_reporter.py

Description:
Test reporter in plain text for harness of Cangjie language
'''

from datetime import datetime
import logging
from os.path import sep, relpath

from core.config import RunMode, VerbosityLevel
from drivers.test.base_test import BaseTest
from drivers.test.test import TestResult, TestRunMode
from reporter.tree_view import TreeNode, cut_leaves_from_tree, cut_tests_leaves_from_tree, write_tree
from utils.utils import PT_END_COLORING, PT_BOLD, PT_BOLD_RED, PT_BLUE, PT_GREEN, PT_RED, PT_YELLOW


class PlainTextReporter:
  '''Class PlainTextReporter for creating test reports'''

  def __init__(self, cfg: dict, testing_cfg: dict, tests: list, assertions: list, write_line: callable):
    self._logger = logging.getLogger(__name__)

    self._report_file = cfg['report_file']
    self._total_time = cfg['total_time']
    self._time_stamp = datetime.strftime(datetime.fromtimestamp(cfg['creation_date']), '%Y-%m-%d %H:%M:%S')
    self._verbosity: VerbosityLevel = cfg['verbosity']
    self._tcfg = testing_cfg
    self._tests = tests
    self._write_line = write_line

    self._test_root_path = self._tcfg['tests_root_path']
    self._cjc_version = self._tcfg['cjc_version']
    self._assertions = assertions

    self._tree_root: TreeNode = None
    self.max_width = 120
    self._base_test_keys = list(filter(lambda s: not s.startswith('_')
                                       and isinstance(vars(BaseTest)[s], property), vars(BaseTest)))

  def _write_used_resources(self):
    self._write_line(f'\nFor creating the report used test results file: {self._report_file}\n')

  def _write_asserts_text(self):
    self._write_line('\nAsserts text:')
    self._write_line(self._tree_root.assert_text)

  def _write_failed_tests_list(self, data: list):
    self._write_line(f'\n{PT_BOLD_RED}Failed tests list:{PT_END_COLORING}')
    failed_tests = [item for item in data if item['result'] == 'FAILED' or item['result'] == 'ERRORED']
    for test_item in failed_tests:
      rel_path = relpath(test_item['test_path'], self._test_root_path)
      self._write_line(f'{rel_path} #{test_item["name"]}')

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

  def _write_config(self):
    if self._verbosity == VerbosityLevel.SHORT:
      return
    result = ''
    longest_key = 0
    for key, value in self._tcfg.items():
      if len(key) > longest_key:
        longest_key = len(key)

    for key, value in self._tcfg.items():
      result += f'{PT_BOLD}{str(key).rjust(longest_key)}{PT_END_COLORING} : {str(value)}\n'

    self._write_header('Tests run configuration')
    self._write_line(result)

  def _write_additional_parameters(self, test_item: dict):
    if len(test_item.keys()) > len(self._base_test_keys):
      self._write_line(f'{PT_BOLD}Additional test parameters:{PT_END_COLORING}')
      for key in test_item.keys():
        if key not in self._base_test_keys:
          self._write_line(f'\t{PT_BOLD}{key}:{PT_END_COLORING} {test_item[key]}')

  def write_test_info(self, test_item: dict):
    '''Write info about one test'''
    if TestResult(test_item['result']) == TestResult.PASSED:
      status_color = f'{PT_GREEN}'
    elif TestResult(test_item['result']) == TestResult.FAILED or TestResult(test_item['result']) == TestResult.ERRORED:
      status_color = f'{PT_RED}'
    else:
      status_color = f'{PT_YELLOW}'

    is_comp_only_mode = RunMode(self._tcfg['run_mode']) == RunMode.compilationOnly
    is_exec_only_mode = RunMode(self._tcfg['run_mode']) == RunMode.executionOnly

    caption = f'{PT_END_COLORING} {PT_BOLD}{test_item["name"]}{PT_END_COLORING} {status_color}'
    name = f'{status_color}{caption.center(self.max_width + 17, "═")}{PT_END_COLORING}'  # 17 - is length of escape symbols
    self._write_line(name)

    self._write_line(f'{PT_BOLD}Assertion:{PT_END_COLORING} {test_item["assertion"]}')
    self._write_line(f'{PT_BOLD}Description:{PT_END_COLORING} {test_item["description"]}')
    if test_item['comment'] is not None and len(test_item['comment']) > 0:
      self._write_line(f'{PT_BOLD}Comment:{PT_END_COLORING} {test_item["comment"]}')
    if test_item['issue'] is not None and len(test_item['issue']) > 0:
      self._write_line(f'{PT_BOLD}Issue:{PT_END_COLORING} {test_item["issue"]}')

    self._write_line('')
    rel_path = test_item['test_path'].replace(self._test_root_path, '')
    self._write_line(f'{PT_BOLD}Test path:{PT_END_COLORING} {rel_path}')

    stats = f'{PT_BOLD}Status:{PT_END_COLORING}'
    stats += f' {status_color}' + str(test_item['result']).capitalize().ljust(12) + f'{PT_END_COLORING}'
    stats += f'{PT_BOLD}Test type:{PT_END_COLORING}'
    if test_item['mode'] is None:
      stats += ' not set'.ljust(23)
    elif TestRunMode(test_item['mode']) == TestRunMode.compilationOnly:
      stats += ' compile only'.ljust(23)
    else:
      stats += ' compile and execute'.ljust(23)
    stats += f'{PT_BOLD}Is negative:{PT_END_COLORING}'
    stats += f' {test_item["is_negative"]}'.ljust(9)
    stats += f'{PT_BOLD}Is replayed:{PT_END_COLORING}'
    stats += f' {test_item["is_replayed"]}'
    self._write_line(stats)

    stats2 = f'{PT_BOLD}Compile time:{PT_END_COLORING}'
    if test_item['compile_time'] is None:
      stats2 += ' -'.ljust(13)
    else:
      stats2 += f' {test_item["compile_time"]:.3f}s'.ljust(13)
    stats2 += f'{PT_BOLD}Execution time:{PT_END_COLORING}'
    if test_item['execute_time'] is None:
      stats2 += ' -'.ljust(13)
    else:
      stats2 += f' {test_item["execute_time"]:.3f}s'.ljust(13)
    stats2 += f'{PT_BOLD}Timeout value:{PT_END_COLORING}'
    timeout_value = test_item['timeout_factor']*self._tcfg['base_timeout']
    stats2 += f' {timeout_value:.1f}s'.ljust(10)
    stats2 += f'{PT_BOLD}Expect timeout:{PT_END_COLORING}'
    stats2 += f' {test_item["expect_timeout"]}'
    self._write_line(stats2)

    stats3 = f'{PT_BOLD}Expect compile warnings:{PT_END_COLORING}'
    stats3 += f' {test_item["compile_warning"]}'
    self._write_line(stats3)

    is_failed = TestResult(test_item['result']) == TestResult.FAILED
    is_error = TestResult(test_item['result']) == TestResult.ERRORED
    is_comp_only_test = test_item['mode'] is not None and TestRunMode(test_item['mode']) == TestRunMode.compilationOnly

    if self._verbosity == VerbosityLevel.DETAILED:
      if is_failed or is_error:  # Log failure
        self._write_line('')
        if not is_exec_only_mode:  # Log compilation error
          if len(test_item['compile_log']) == 0:
            self._write_line(f'{PT_BOLD}Compilation log:{PT_END_COLORING} None')
          else:
            self._write_line(f'{PT_BOLD}Compilation log:{PT_END_COLORING}\n{test_item["compile_log"]}')
        if not is_comp_only_test and not is_comp_only_mode:  # Log execution error
          if len(test_item['execute_log']) == 0:
            self._write_line(f'{PT_BOLD}Execution log:{PT_END_COLORING} None')
          else:
            self._write_line(f'{PT_BOLD}Execution log:{PT_END_COLORING}\n{test_item["execute_log"]}')
        self._write_additional_parameters(test_item)

    elif self._verbosity == VerbosityLevel.VERBOSE:
      self._write_line('')
      if not is_exec_only_mode:  # Log compilation error
        self._write_line(f'{PT_BOLD}Compilation log:{PT_END_COLORING}\n{test_item["compile_log"]}')
      if not is_comp_only_test and not is_comp_only_mode:  # Log execution error
        if len(test_item['execute_log']) == 0:
          self._write_line(f'{PT_BOLD}Execution log:{PT_END_COLORING} None')
        else:
          self._write_line(f'{PT_BOLD}Execution log:{PT_END_COLORING}\n{test_item["execute_log"]}')
      self._write_additional_parameters(test_item)

    separator = status_color + ''.center(self.max_width, '─') + f'{PT_END_COLORING}\n'
    self._write_line(separator)

  def create_report(self):
    '''Create testing report'''
    # Header
    header = f'Testing results of {self._cjc_version}'
    self._write_header(header, level=0)

    tests_suites = list(set([item[4].replace(self._test_root_path, '') for item in self._assertions]))
    tests_suites = [{'path': item, 'branch': None} for item in tests_suites]

    top_level = str(self._test_root_path).split(sep)[-1]
    self._tree_root = TreeNode(top_level, None)
    for item in self._tests:
      splitted_path = item['test_path'].replace(self._test_root_path, '').split(sep)
      splitted_path.remove('')
      current_node = self._tree_root
      for i in range(len(splitted_path)):
        child = current_node.get_child_by_name(splitted_path[i])
        if child is None:
          child = TreeNode(splitted_path[i], current_node)
          for ts in tests_suites:
            if ts['branch'] is None:
              if i+1 <= len(splitted_path) and ts['path'] == sep + sep.join(splitted_path[:i+1]):
                ts['branch'] = child
          a = None
          for a in self._assertions:
            if a[3] in splitted_path[i] and a[4] in item['test_path']:
              child.num_exp_asserts = a[2]
              break
          if a:
            self._assertions.remove(a)
          if i == len(splitted_path) - 1:
            child.value = item
          current_node.children.append(child)
        current_node = child

    # When tree is ready we can propagate stats from leaves to root
    self._tree_root.update_children_stats()

    self._write_header('Overview')
    total_tests = len(self._tests)
    num_pass = self._tree_root.num_passed
    num_fail = self._tree_root.num_failed
    num_error = self._tree_root.num_errors
    num_skip = self._tree_root.num_skipped
    num_incomplete = self._tree_root.num_incomplete

    if self._total_time is None:
      comp_time = self._tree_root.time_comp
      exec_time = self._tree_root.time_exec
      time = comp_time + exec_time
    else:
      time = self._total_time

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

    num_tests_comp_only = len([item['name'] for item in self._tests if item['mode'] is not None and TestRunMode(item['mode']) == TestRunMode.compilationOnly])
    num_negative_tests = len([item['name'] for item in self._tests if item['is_negative']])

    self._write_line(f'{PT_BOLD}           Tests run date:{PT_END_COLORING} {self._time_stamp}')
    self._write_line(f'{PT_BOLD}    Total number of tests:{PT_END_COLORING} {total_tests}')

    for ts in tests_suites:
      if ts['branch'] is not None:
        num_assertions = ts['branch'].num_asserts
        num_expected_assertions = ts['branch'].num_exp_asserts
        percent_coverage = num_assertions/num_expected_assertions * 100
        self._write_line(f'{PT_BOLD}Tests suite relative path:{PT_END_COLORING} {ts["path"]}')
        self._write_line(f'{PT_BOLD}     Number of assertions:{PT_END_COLORING} {num_assertions}/{num_expected_assertions} (covered/expected)')
        self._write_line(f'{PT_BOLD}      Assertions coverage:{PT_END_COLORING} {percent_coverage:.2f}%')

    self._write_line('')
    self._write_line(f'Tests: {PT_GREEN}Passed {num_pass}{PT_END_COLORING}, {PT_RED}Failed {num_fail}{PT_END_COLORING}, {PT_RED}Errored {num_error}{PT_END_COLORING},'
                     f' {PT_YELLOW}Skipped {num_skip}{PT_END_COLORING}, {PT_YELLOW}Incomplete {num_incomplete}{PT_END_COLORING}')
    self._write_line(f'Compile only tests: {num_tests_comp_only}')
    self._write_line(f'Compile and execute tests: {total_tests - num_tests_comp_only}')
    self._write_line(f'Negative tests: {num_negative_tests}')
    self._write_line(f'Testing time: {PT_BLUE}{time:.3f}s{PT_END_COLORING}')
    self._write_line('')
    if longest_comp_test:
      self._write_line(f'Longest compilation test: {longest_comp_test[0]} ({PT_BLUE}{max_comp_time:.3f}s{PT_END_COLORING})')
    if longest_exec_test:
      self._write_line(f'Longest execution test: {longest_exec_test[0]} ({PT_BLUE}{max_exec_time:.3f}s{PT_END_COLORING})')
    self._write_line('')

    # Prepare the Tree
    self._write_header('Tree view')

    if self._verbosity == VerbosityLevel.SHORT:
      cut_tests_leaves_from_tree(self._tree_root)
      cut_leaves_from_tree(self._tree_root)
    else:
      cut_tests_leaves_from_tree(self._tree_root)

    write_tree(self._tree_root, '    ', self._write_line)
    self._write_line(
        f'\n[ A - assertions covered/expected, T - tests ({PT_GREEN}P - passed{PT_END_COLORING}, '
        f'{PT_RED}F - failed{PT_END_COLORING}, {PT_RED}E - errored{PT_END_COLORING}, '
        f'{PT_YELLOW}S - skipped{PT_END_COLORING}, {PT_YELLOW}I - incomplete{PT_END_COLORING}) ]')

    self._write_line('')
    self._write_config()

    if self._verbosity == VerbosityLevel.SHORT:
      self._write_failed_tests_list(self._tests)
    elif self._verbosity == VerbosityLevel.DETAILED:
      # create list with all tests and add more info for failed tests (similar detailed log)
      passed_tests = [item for item in self._tests if item['result'] == 'PASSED']
      failed_tests = [item for item in self._tests if item['result'] == 'FAILED' or item['result'] == 'ERRORED']
      skipped_tests = [item for item in self._tests if item['result'] == 'SKIPPED' or item['result'] == 'INCOMPLETE']

      self._write_header('Passed tests')
      for item in passed_tests:
        self.write_test_info(item)

      self._write_header('Skipped and incomplete tests')
      for item in skipped_tests:
        self.write_test_info(item)

      self._write_line('')
      self._write_header('Failed and errored tests')
      for item in failed_tests:
        self.write_test_info(item)

    else:  # verbose mode
      # create list with all data related to each test
      self._write_header('Tests list')
      for item in self._tests:
        self.write_test_info(item)

    self._write_used_resources()
