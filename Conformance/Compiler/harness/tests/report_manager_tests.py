# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: report_manager_tests.py

Description:
Unit tests for ReportManager class
'''

import subprocess
import unittest
from types import SimpleNamespace
from unittest.mock import Mock

from core.config import VerbosityLevel
from core.report_manager import ReportManager


class ReportManagerTests(unittest.TestCase):
  '''Tests for ReportManager class'''

  def setUp(self):
    self.manager = ReportManager.__new__(ReportManager)
    self.manager.cfg = SimpleNamespace(log_mode=VerbosityLevel.SHORT)
    self.manager.write_message = Mock()
    self.manager._write_process_output = Mock()
    self.manager.log_file = Mock()
    self.manager.log_file_json = Mock()

  @staticmethod
  def _compilation_result(returncode):
    return subprocess.CompletedProcess(
        args='cjc test.cj', returncode=returncode, stdout='', stderr='')

  def _messages(self):
    return [call.args[0] for call in self.manager.write_message.call_args_list]

  def test_write_utils_comp_result_success(self):
    '''Check successful default library compilation is reported'''
    self.manager.write_utils_comp_result([self._compilation_result(0)])

    self.assertTrue(any('compiled successfully' in message for message in self._messages()))
    self.assertFalse(any('compilation of default libraries failed' in message.lower()
                         for message in self._messages()))

  def test_write_utils_comp_result_failure(self):
    '''Check failed default library compilation is reported'''
    self.manager.write_utils_comp_result([self._compilation_result(1)])

    self.assertTrue(any('compilation of default libraries failed' in message.lower()
                        for message in self._messages()))
    self.assertFalse(any('compiled successfully' in message for message in self._messages()))

  def test_write_utils_comp_result_mixed_results(self):
    '''Check one failure makes the overall default library result failed'''
    results = [self._compilation_result(0), self._compilation_result(1)]

    self.manager.write_utils_comp_result(results)

    self.assertTrue(any('compilation of default libraries failed' in message.lower()
                        for message in self._messages()))
    self.assertFalse(any('compiled successfully' in message for message in self._messages()))


if __name__ == '__main__':
  unittest.main()
