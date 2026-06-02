# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: report_manager.py

Description:
Generator reports & file logs
'''
import json
import logging

from datetime import datetime
from os import rename, system
from os.path import relpath, exists, getmtime, basename

from core.config import Config, VerbosityLevel, RunMode, ReportMode
from drivers.test.test import Test
from drivers.test.base_test import TestResult, TestRunMode, BaseTest
from reporter.junit_reporter import JUnitReporter
from reporter.html_reporter import HTMLReporter
from utils.utils import clear_message, process_assertions, PT_END_COLORING, PT_BOLD, PT_BOLD_GREEN, PT_BOLD_RED, PT_BOLD_YELLOW, PT_BLUE, PT_GREEN, PT_RED, PT_YELLOW


class ReportManager:
  '''Report manager for logging testing process and preparing various reports.'''
  log_file = None

  def __init__(self, cfg: Config):
    self.cfg = cfg
    self.log_file = open(cfg.log_file, 'w+', encoding='utf-8')
    metadata_json_filename = f'{cfg.log_file}.json'
    if exists(metadata_json_filename):
      creation_date = getmtime(metadata_json_filename)
      time_stamp = datetime.strftime(datetime.fromtimestamp(creation_date), '%Y-%m-%d_%H.%M.%S')
      timestamped_filename = f'{cfg.log_file}_{time_stamp}.json'
      rename(metadata_json_filename, timestamped_filename)
      logging.info('File with old metadata %s was renamed to %s', basename(metadata_json_filename), basename(timestamped_filename))
    self.log_file_json = open(metadata_json_filename, 'w+', encoding='utf-8')
    self._is_colored = not cfg.log_no_color
    self._max_message_len = 0
    self._buffer = ''
    self._total_tests = 0
    self._counter_tests = 0
    self._all_tests = []
    self._copy_log_to_file = True
    if cfg.test_report_mode != ReportMode.plain:
      self._copy_log_to_file = False

    system('')  # workaround for Windows to support colored output.
    result = ''
    for key, value in cfg.to_dict().items():
      result += '\t' + key + ' : ' + str(value) + '\n'
    if self.cfg.log_mode != VerbosityLevel.SHORT and self.cfg.log_mode != VerbosityLevel.PROGRESS:
      self.write_message(f'Config:\n{result}')
    else:
      if cfg.test_report_mode == ReportMode.plain:
        self.log_file.write(f'{datetime.now()}: Config:\n{result}\n')

    self.log_file_json.write('[\n')
    self.log_file_json.write(json.dumps(cfg.to_dict(), indent=2))
    self.log_file_json.write(',\n')

    self._base_test_keys = list(filter(lambda s: not s.startswith('_')
                                       and isinstance(vars(BaseTest)[s], property), vars(BaseTest)))

  def __del__(self):
    self.write_message(f'Metadata about test run saved at {self.log_file_json.name} file.')
    self.log_file.close()
    self.log_file_json.close()

  def _generate_junit_report(self, total_time: float):
    '''Generate report in JUnit test results format'''
    tests = [item.to_dict() for item in self._all_tests]
    reporter = JUnitReporter({'creation_date': datetime.now().timestamp()}, self.cfg.to_dict(), tests, self.log_file.write)
    reporter.total_time = total_time
    reporter.create_report()

  def _generate_html_report(self, total_time: float):
    '''Generate report in HTML test results format'''
    tests = [item.to_dict() for item in self._all_tests]
    assertions = process_assertions(self.cfg.tests_root_path)
    reporter = HTMLReporter({'creation_date': datetime.now().timestamp(), 'total_time': total_time},
                            self.cfg.to_dict(), tests, assertions, self.log_file.write)
    reporter.create_report()

  def _write_process_output(self, name, output, prefix='-'):
    if output is None:
      self.write_message(f'{prefix} {name}: None')
    else:
      self.write_message(f'{prefix} {name}:')
      split_output = output.splitlines()
      for line in split_output:
        self.write_message(f'\t{line}')

  def _write_output(self, output: str):
    if output is None:
      self.write_message('None')
    else:
      split_output = output.splitlines()
      for line in split_output:
        self.write_message(f'{line}')

  def _write_additional_parameters(self, test: Test):
    td = test.to_dict()
    if len(td.keys()) > len(self._base_test_keys):
      self.write_message(f'{PT_BOLD}- additional test parameters:{PT_END_COLORING}')
      for key in td.keys():
        if key not in self._base_test_keys:
          self.write_message(f'\t{PT_BOLD}{key}:{PT_END_COLORING} {td[key]}')

  def _write_test_result_to_metadata(self, test: Test):
    test_dict = test.to_dict()
    if not self.cfg.profile:  # remove unnecessary data from metadata
      if 'compile_start' in test_dict:
        del test_dict['compile_start']
      if 'compile_stop' in test_dict:
        del test_dict['compile_stop']
      if 'comp_worker_pid' in test_dict:
        del test_dict['comp_worker_pid']
      if 'execute_start' in test_dict:
        del test_dict['execute_start']
      if 'execute_stop' in test_dict:
        del test_dict['execute_stop']
      if 'exec_worker_pid' in test_dict:
        del test_dict['exec_worker_pid']
    self.log_file_json.write(json.dumps(test_dict, indent=2))
    self.log_file_json.write(',\n')

  def _write_tests_list(self, caption:str, tests: list):
    message = f'{PT_BOLD_RED}{caption}{PT_END_COLORING}\n'
    for test in tests:
      relative_test_path = relpath(test.test_path, self.cfg.tests_root_path)
      message += f'\t{relative_test_path} //{test.name}\n'
    self.write_message(message)


  def write_test_result(self, test: Test, is_write_to_json=True):
    '''Write one test result to log file'''
    self._all_tests.append(test)
    self._counter_tests += 1
    if is_write_to_json:
      self._write_test_result_to_metadata(test)

    if test.result == TestResult.PASSED:
      result_value = f'{PT_BOLD_GREEN}[Passed]{PT_END_COLORING} '
    elif test.result == TestResult.FAILED:
      result_value = f'{PT_BOLD_RED}[Failed]{PT_END_COLORING} '
    elif test.result == TestResult.ERRORED:
      result_value = f'{PT_BOLD_RED}[Errored]{PT_END_COLORING}  '
    elif test.result == TestResult.INCOMPLETE:
      result_value = f'{PT_BOLD_YELLOW}[Incomplete]{PT_END_COLORING}  '
    else:
      result_value = test.result

    is_failed = test.result == TestResult.FAILED
    is_error = test.result == TestResult.ERRORED
    is_comp_only_test = test.mode == TestRunMode.compilationOnly
    is_comp_only_mode = self.cfg.run_mode == RunMode.compilationOnly
    is_exec_only_mode = self.cfg.run_mode == RunMode.executionOnly

    relative_test_path = relpath(test.test_path, self.cfg.tests_root_path)
    if test.compile_time >= 0:
      comp_time = f'{PT_BLUE}{test.compile_time:.3f}{PT_END_COLORING}s'
    else:
      comp_time = f'{PT_BLUE}-{PT_END_COLORING}'
    if test.execute_time >= 0:
      exec_time = f'{PT_BLUE}{test.execute_time:.3f}{PT_END_COLORING}s'
    else:
      exec_time = f'{PT_BLUE}-{PT_END_COLORING}'
    if self.cfg.log_mode == VerbosityLevel.PROGRESS:
      message = f'({self._counter_tests}/{self._total_tests}) {result_value} {PT_BOLD_YELLOW}{test.name}{PT_END_COLORING} [{comp_time}/{exec_time}]'
      self.write_progress_bar(message)
      if self._counter_tests == self._total_tests:
        self.write_progress_bar('')
        self.write_message('Testing finished')
    elif self.cfg.log_mode == VerbosityLevel.SHORT:
      self.write_message(
          f'({self._counter_tests}/{self._total_tests}) {result_value} {PT_BOLD_YELLOW}{test.name}{PT_END_COLORING} [{comp_time}/{exec_time}]')
    elif self.cfg.log_mode == VerbosityLevel.DETAILED:
      self.write_message(f'({self._counter_tests}/{self._total_tests}) {result_value} {PT_BOLD_YELLOW}{test.name}{PT_END_COLORING}')
      self.write_message(f'Test path: {relative_test_path}')
      self.write_message(f'Compilation time: {comp_time}, Execution time: {exec_time}')
      if is_failed or is_error:  # Log failure
        self.write_message(f'- run mode: {test.mode.value}')
        if test.is_negative:
          self.write_message('- test is negative')
        else:
          self.write_message('- test is positive')
        self.write_message(f'- expect compile warning: {test.compile_warning.value}')
        if test.expect_timeout:
          self.write_message('- expect timeout: yes')
        else:
          self.write_message('- expect timeout: no')
        if not is_exec_only_mode:
          if len(test.compile_log) == 0:
            self.write_message('- compilation log: None')
          else:
            self.write_message('- compilation log:')
            self._write_output(test.compile_log)
        if not is_comp_only_test and not is_comp_only_mode:
          if len(test.execute_log) == 0:
            self.write_message('- run log: None')
          else:
            self.write_message('- run log:')
            self._write_output(test.execute_log)
        self._write_additional_parameters(test)

    else:  # Verbose log
      self.write_message(f'({self._counter_tests}/{self._total_tests}) {result_value} {PT_BOLD_YELLOW}{test.name}{PT_END_COLORING}')
      self.write_message(f'Test path: {relative_test_path}')
      self.write_message(f'Compilation time: {comp_time}, Execution time: {exec_time}')
      self.write_message(f'- run mode: {test.mode.value}')
      if test.is_negative:
        self.write_message('- test is negative')
      else:
        self.write_message('- test is positive')
      self.write_message(f'- expect compile warning: {test.compile_warning.value}')
      if test.expect_timeout:
        self.write_message('- expect timeout: yes')
      else:
        self.write_message('- expect timeout: no')
      if not is_exec_only_mode:
        if len(test.compile_log) == 0:
          self.write_message('- compilation log: None')
        else:
          self.write_message('- compilation log:')
          self._write_output(test.compile_log)
      if not is_comp_only_test and not is_comp_only_mode:
        if len(test.execute_log) == 0:
          self.write_message('- run log: None')
        else:
          self.write_message('- run log:')
          self._write_output(test.execute_log)
      self._write_additional_parameters(test)

  def write_total_discovered_tests(self, total: int, failed_tests: list):
    '''Write number of discovered tests'''
    self._total_tests = total + len(failed_tests)
    self._all_tests.extend(failed_tests)
    self.write_message(f'Discovered {total} tests in {self.cfg.tests_root_path}')
    list(map(self._write_test_result_to_metadata, failed_tests))

  def write_total_result(self, total_time: float):
    '''Write overall testing result to log file'''
    passed = [item for item in self._all_tests if item.result == TestResult.PASSED]
    num_pass = len(passed)
    failed = [item for item in self._all_tests if item.result == TestResult.FAILED]
    num_fail = len(failed)
    errored = [item for item in self._all_tests if item.result == TestResult.ERRORED]
    num_error = len(errored)
    has_failed = num_fail != 0 or num_error != 0
    skipped = [item for item in self._all_tests if item.result == TestResult.SKIPPED]
    num_skip = len(skipped)
    incomleted = [item for item in self._all_tests if item.result == TestResult.INCOMPLETE]
    num_incomplete = len(incomleted)
    num_total = len(self._all_tests)
    if has_failed:
      if self.cfg.log_mode == VerbosityLevel.DETAILED:
        tmp_func = self.write_message
        self.write_message = self._write_to_buffer
        message = f'{PT_BOLD_RED}Failed and errored tests detailed list:{PT_END_COLORING}\n'
        self.write_message(message)
        self._total_tests = len(failed)
        self._counter_tests = 0
        for test in failed:
          self.write_test_result(test, is_write_to_json=False)
        for test in errored:
          self.write_test_result(test, is_write_to_json=False)
        self.write_message = tmp_func
        self.write_message(self._buffer)
      self._write_tests_list('Failed tests list:', failed)
      self._write_tests_list('Errored tests list:', errored)

    self.write_message(f'Test results: {PT_BOLD}Total: {num_total}{PT_END_COLORING}, {PT_GREEN}Passed {num_pass}{PT_END_COLORING},'
                       f' {PT_RED}Failed {num_fail}{PT_END_COLORING}, {PT_RED}Errored {num_error}{PT_END_COLORING},'
                       f' {PT_YELLOW}Skipped {num_skip}{PT_END_COLORING}, {PT_YELLOW}Incomplete {num_incomplete}{PT_END_COLORING}'
                       f' ({PT_BLUE}{total_time:.3f}s{PT_END_COLORING})')
    overall_stats = {
        'total_time': total_time
    }
    self.log_file_json.write(json.dumps(overall_stats, indent=2))
    self.log_file_json.write('\n]\n')
    self._generate_report(total_time)

  def _write_to_buffer(self, message):
    self._buffer += message + '\n'

  def write_utils_comp_result(self, results: list):
    '''Write info about compilation of default libraries'''
    if results is None or len(results) == 0:
      return
    is_passed = True
    for result in results:
      if self.cfg.log_mode == VerbosityLevel.VERBOSE or result.returncode != 0:
        self.write_message('- compilation command:')
        self.write_message(f'\t{result.args}')
        self._write_process_output('stdout', result.stdout)
        self._write_process_output('stderr', result.stderr)

    if is_passed:
      self.write_message(f'{PT_GREEN}Default libraries compiled successfully{PT_END_COLORING}')
    else:
      self.write_message(f'{PT_RED}Compilation of default libraries failed{PT_END_COLORING}')

  def _generate_report(self, total_time: float):
    '''Generate report based on testing results'''
    if self.cfg.test_report_mode == ReportMode.junit:
      self._generate_junit_report(total_time)
    elif self.cfg.test_report_mode == ReportMode.html:
      self._generate_html_report(total_time)

  def write_message(self, message: str):
    '''Write message to log file and print to log'''
    cleared_message = clear_message(message)
    if self._copy_log_to_file:
      self.log_file.write(f'{datetime.now()}: {cleared_message}\n')
    if self._is_colored:
      logging.info(message)
    else:
      logging.info(cleared_message)

  def write_progress_bar(self, message: str):
    '''Write message to log file and print progress bar to log'''
    cleared_message = clear_message(message)
    if self._copy_log_to_file:
      self.log_file.write(f'{datetime.now()}: {cleared_message}\n')
    printEnd = '\r'
    if self._is_colored:
      size = self._get_max_message_length(message)
      print(message.ljust(size), end=printEnd)
    else:
      size = self._get_max_message_length(cleared_message)
      print(cleared_message.ljust(size), end=printEnd)

  def _get_max_message_length(self, message: str) -> int:
    if (len(message) > self._max_message_len):
      self._max_message_len = len(message)
    return self._max_message_len

  def dump_drivers(self, drivers: dict):
    '''Dump drivers dict to metadata'''
    self.log_file_json.write(json.dumps(drivers.to_dict(), indent=2))
    self.log_file_json.write(',\n')
