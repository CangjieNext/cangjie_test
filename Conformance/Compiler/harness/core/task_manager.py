# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: task_manager.py

Description:
Discovery tests & launch drivers
'''

import logging
import os
import re
import fnmatch
import multiprocessing
import signal
import json
from re import match
from time import time

from core.config import Config, RunMode
from core.report_manager import ReportManager
from core.driver_manager import DriverManager, dl
from drivers.test.base_test import TestResult
from drivers.test.fake_test import FakeTest
from utils.utils import find_files_by_creation_date


class TaskManager:
  '''Task Manager which is preparing and then run tests '''

  def __init__(self, cfg: Config, reporter: ReportManager):
    self.reporter = reporter
    self.work_dir = cfg.work_directory
    self.run_mode = cfg.run_mode
    self.cfg = cfg
    self.drivers = DriverManager(self.cfg)
    if cfg.replay:
      self.test_list = self.load_replay_tests()
    else:
      self.test_list = self.discovery_tests()

  def discovery_tests(self) -> list:
    '''Search tests and appending in test_list'''
    self.reporter.write_message('Start discovering tests')
    result_list = []
    failed_list = []
    includes = []
    excludes = []

    if self.cfg.tests:
      includes = self.cfg.tests
    else:
      includes = self.cfg.included_tests
      excludes = self.cfg.excluded_tests

    includes = r'|'.join([fnmatch.translate(x) for x in includes])
    excludes = r'|'.join([fnmatch.translate(x) for x in excludes]) or r'$.'

    for root, dirs, files in os.walk(self.cfg.tests_root_path):
      # exclude dirs
      dirs[:] = [os.path.join(root, d) for d in dirs]
      dirs[:] = [d for d in dirs if not match(excludes, d)]

      custom = [os.path.join(root, f) for f in files if match(fnmatch.translate('custom.json'), f)]
      if custom:
        self.drivers.add_custom(custom.pop())

      # tests filename pattern
      files = [f for f in files if match(fnmatch.translate('test*.cj'), f)]
      files = [os.path.join(root, f) for f in files]
      # exclude files
      files = [f for f in files if not match(excludes, f)]
      # include files
      files = [f for f in files if match(includes, f)]
      for file in files:
        try:
          test = self.drivers.to_test(file)
          if test.is_valid() and ((self.cfg.level != '' and test.level != '' and test.level in self.cfg.level) or self.cfg.level == ''):
            result_list.append(test)
          elif self.cfg.level != '' and test.level != '' and test.level not in self.cfg.level:
            pass
          else:
            error_message = f'Not valid test by path {file}, please check it.'
            logging.error(error_message)
            test.result = TestResult.ERRORED
            test.compile_log += f'{error_message}\n'
            test.execute_log += f'{error_message}\n'
            failed_list.append(test)
        except (ValueError, RecursionError) as err:
          logging.error('%s in %s', err, file)
          fake_test = FakeTest(file)
          fake_test.result = TestResult.ERRORED
          fake_test.compile_log = f'{str(err)}\n'
          fake_test.execute_log = f'{str(err)}\n'
          failed_list.append(fake_test)

    self.reporter.dump_drivers(self.drivers)
    self.reporter.write_total_discovered_tests(len(result_list), failed_list)
    logging.debug('Test list: %s', '\n'.join([str(x) for x in result_list]))
    return result_list

  def load_replay_tests(self) -> list:
    '''Load @Repaly tests from metadata and appending in test_list'''
    # Possible improvement: Consider writing a driver for replay mode
    replay_param_registry = dict()
    result_list = []
    failed_list = []
    includes = []
    excludes = []

    if self.cfg.tests:
      includes = self.cfg.tests
    else:
      includes = self.cfg.included_tests
      excludes = self.cfg.excluded_tests

    includes = r'|'.join([fnmatch.translate(x) for x in includes])
    excludes = r'|'.join([fnmatch.translate(x) for x in excludes]) or r'$.'

    # Search previous metadata file
    metadata_files = find_files_by_creation_date(os.path.dirname(self.cfg.log_file), 'results.log_*_*.json')
    for m_file in metadata_files:
      with open(m_file, 'r', encoding='utf-8') as read_file:
        try:
          previous_metadata = json.load(read_file)
        except json.JSONDecodeError:
          continue
        # Init previous drivers
        temp_drivers = DriverManager.from_dict(self.cfg, previous_metadata[1])
        self.drivers.groups.update(temp_drivers.groups)
        self.drivers.customs.update(temp_drivers.customs)

        # Init previous tests (only @Replay tests)
        tests: list = previous_metadata[2:]
        if 'total_time' in previous_metadata[-1]:
          tests = previous_metadata[2:-1]
        # exclude files
        tests = [t for t in tests if not match(excludes, t['test_path'])]
        # include files
        tests = [t for t in tests if match(includes, t['test_path'])]

        for test in tests:
          if test.get('is_replayed'):
            try:
              replay_test = self.drivers.to_test(test['test_path'])
              match_param = re.search(r'@@Param\s+(.*?)@@', test['execute_log'])
              if match_param:
                replay_test.param = match_param.group(1)
              else:
                continue
              if replay_test.is_valid() and ((self.cfg.level != '' and replay_test.level != '' and replay_test.level in self.cfg.level) or self.cfg.level == ''):
                # Append only tests with unique params
                if not replay_param_registry.get(replay_test.test_path):
                  replay_param_registry[replay_test.test_path] = {replay_test.param: True}
                elif not replay_param_registry.get(replay_test.test_path).get(replay_test.param):
                  replay_param_registry[replay_test.test_path].update({replay_test.param: True})
                else:
                  continue
                # Change the test name to prevent recompiling the same binary
                replay_test.name += f'_r{len(replay_param_registry.get(replay_test.test_path))-1}'
                result_list.append(replay_test)
              elif self.cfg.level != '' and replay_test.level != '' and replay_test.level not in self.cfg.level:
                pass
              else:
                error_message = f'Not valid test by path {test["test_path"]}, please check it.'
                logging.error(error_message)
                replay_test = FakeTest(test['test_path'])
                replay_test.result = TestResult.ERRORED
                replay_test.compile_log += f'{error_message}\n'
                replay_test.execute_log += f'{error_message}\n'
                failed_list.append(replay_test)
            except (ValueError, RecursionError) as err:
              logging.error('%s in %s', err, test)
              fake_test = FakeTest(test['test_path'])
              fake_test.result = TestResult.ERRORED
              fake_test.compile_log = f'{str(err)}\n'
              fake_test.execute_log = f'{str(err)}\n'
              failed_list.append(fake_test)

    self.reporter.dump_drivers(self.drivers)
    self.reporter.write_total_discovered_tests(len(result_list), failed_list)
    logging.debug('Test list: %s', '\n'.join([str(x) for x in result_list]))
    return result_list

  def run(self):
    '''Run testing'''
    self.reporter.write_message('Testing started')
    start_time = time()
    try:
      mp_manager = multiprocessing.Manager()
      lock = mp_manager.RLock()
      shared_dict = mp_manager.dict()

      for driver in self.drivers.groups.values():
        driver.runner = driver.runner(self.cfg, lock, shared_dict)
        self.reporter.write_utils_comp_result(driver.runner.prepare_default_libraries())

      execute_list = []
      done_list = []
      signal.signal(signal.SIGINT, lambda signum, frame: (logging.warning('Receive KeyboardInterrupt signal. Stopping run.'),
                                                          mp_manager.shutdown()))
      # do compile, if necessary
      if self.run_mode != RunMode.executionOnly:
        compile_pool = mp_manager.Pool(processes=self.cfg.compilation_threads)
        execute_list = compile_pool.imap_unordered(self.drivers.do_compile, self.test_list)
        compile_pool.close()
      else:
        execute_list = self.test_list

      # do execute, if necessary
      if self.run_mode != RunMode.compilationOnly:
        execute_pool = mp_manager.Pool(processes=self.cfg.execution_threads)
        done_list = execute_pool.imap_unordered(self.drivers.do_execute, execute_list)
        execute_pool.close()
      else:
        done_list = execute_list

      for test in done_list:
        self.reporter.write_test_result(test)

    except (KeyboardInterrupt, EOFError, BrokenPipeError) as ex:
      logging.warning('Receive error: %s. Stopping run.', ex)

    end_time = time()
    total_time = end_time - start_time
    self.reporter.write_total_result(total_time)
