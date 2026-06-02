# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: junit_reporter.py

Description:
Test reporter in JUnit file format for harness of Cangjie language
'''

from datetime import datetime
import logging
from os.path import sep
from xml.dom import minidom

from core.config import VerbosityLevel
from drivers.test.base_test import TestResult
from utils.utils import clear_message


class JUnitReporter:
  '''Class JUnitReporter for creating test reports in JUnit file format'''

  def __init__(self, cfg: dict, testing_cfg: dict, tests: list, write_line: callable):
    self._logger = logging.getLogger(__name__)
    self._tcfg = testing_cfg
    self._tests = tests
    self._write_line = write_line
    self.total_time = 0
    if 'total_time' in cfg and cfg['total_time'] is not None:
      self.total_time = cfg['total_time']

    if 'creation_date' in cfg:
      self._time_stamp = datetime.fromtimestamp(cfg['creation_date']).isoformat()
    else:
      self._logger.warning('Creation date wasn\'t set for JUnit report. Current date and time will be used for it.')
      self._time_stamp = datetime.now().isoformat()

    if 'verbosity' in cfg:
      if VerbosityLevel(cfg['verbosity']) != VerbosityLevel.DETAILED:
        self._logger.warning('Reporting verbosity level option was skipped for JUnit report')

    show_sorting_warn = False
    if 'sort_by' in cfg and cfg['sort_by'] != 'test_path':
      show_sorting_warn = True
    if 'sort_rev' in cfg and cfg['sort_rev']:
      show_sorting_warn = True
    if show_sorting_warn:
      self._logger.warning('Sorting options were skipped for JUnit report')

    if 'is_colored' in cfg and not cfg['is_colored']:
      self._logger.warning('No coloring option was skipped for JUnit report')

  def create_report(self):
    '''Generate report in JUnit test results format'''
    root = minidom.Document()
    testsuites = root.createElement('testsuites')
    root.appendChild(testsuites)
    testsuite = root.createElement('testsuite')
    testsuite.setAttribute('tests', str(len(self._tests)))
    testsuite.setAttribute('time', str(self.total_time))
    testsuite.setAttribute('timestamp', str(self._time_stamp))
    testsuite.setAttribute('name', self._tcfg['cjc_version'])
    testsuites.appendChild(testsuite)
    errors = 0
    failures = 0
    skipped = 0
    for item in self._tests:
      testcase = root.createElement('testcase')
      testcase.setAttribute('name', item['name'])
      name_from_path = item['test_path'].replace(self._tcfg['tests_root_path'], '').replace(sep, '.').strip('.')
      testcase.setAttribute('classname', name_from_path)
      overall_time = 0
      if not item['compile_time'] is None and item['compile_time'] > 0:
        overall_time += item['compile_time']
      if not item['execute_time'] is None and item['execute_time'] > 0:
        overall_time += item['execute_time']

      testcase.setAttribute('time', str(overall_time))
      testsuite.appendChild(testcase)
      if TestResult(item['result']) == TestResult.FAILED:
        failures += 1
        failure = root.createElement('failure')
        failure.setAttribute('message', 'Test failed')
        text = root.createTextNode(f'{item["compile_log"]}')
        failure.appendChild(text)
        testcase.appendChild(failure)
      elif TestResult(item['result']) == TestResult.ERRORED:
        errors += 1
        error = root.createElement('error')
        error.setAttribute('message', 'Test errored')
        text = root.createTextNode(f'{item["execute_log"]}')
        error.appendChild(text)
        testcase.appendChild(error)
      elif TestResult(item['result']) != TestResult.PASSED:
        skipped += 1
        skip = root.createElement('skipped')
        skip.setAttribute('message', f'Test status {item["result"]}')
        testcase.appendChild(skip)

      system_out = root.createElement('system-out')
      std_out_text = ''
      if len(item['compile_log']) > 0:
        std_out_text += f'Compilation log:\n{item["compile_log"]}\n'

      if len(item['execute_log']) > 0:
        std_out_text += f'Execute log:\n{item["execute_log"]}\n'

      std_out = root.createTextNode(std_out_text)
      system_out.appendChild(std_out)
      testcase.appendChild(system_out)

    # Add overall statistics
    testsuite.setAttribute('errors', str(errors))
    testsuite.setAttribute('failures', str(failures))
    testsuite.setAttribute('skipped', str(skipped))

    xml_str = root.toprettyxml(indent='\t')
    cleared_xml_str = clear_message(xml_str)
    self._write_line(cleared_xml_str)
