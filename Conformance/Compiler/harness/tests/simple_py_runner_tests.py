# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: simple_py_runner_tests.py

Description:
Unit tests for SimplePyRunner class from drivers
'''

import unittest
import os

from core.config import Config
from drivers.test.base_test import BaseTest, TestRunMode
from drivers.runner.simple_py_runner import SimplePyRunner, BaseRunner

# It's disabled to get dafault values from Test class
# pylint: disable=protected-access


class SimplePyRunnerTests(unittest.TestCase):
  '''Tests for SimplePyRunner class from drivers'''
  custom_test = BaseTest
  custom_runner = SimplePyRunner

  def setUp(self) -> None:
    Config._DEFAULT_TEST_ROOT_PATH = os.path.join('.','tests','resources')
    self.cfg = Config()
    self.test = self.custom_test(os.path.join('.', 'tests', 'resources', 'test_stub_simple.cj'))
    self.runner = self.custom_runner(self.cfg)
    return super().setUp()

  def tearDown(self) -> None:
    return super().tearDown()

  def test_runner_inherited_from_base_runner(self):
    '''Check the SimplePyRunner is inherited from a BaseRunner'''
    self.assertTrue(issubclass(self.custom_runner, BaseRunner), 'SimplePyRunner not inherited from a BaseRunner')

  def test_runner_do_compile_call_on_compile(self):
    '''Check that the do_compile function calls the on_compile function from the test script'''
    default_log = self.test.compile_log
    compiled_log = self.runner.do_compile(self.test).compile_log
    self.assertNotEqual(compiled_log, default_log)
    self.assertIn('hello from on_compile simplePyRunner unittest', compiled_log)

  def test_runner_do_compile_dont_call_on_execute(self):
    '''Check that the do_compile function don`t calls the on_execute function from the test script'''
    compiled_test = self.runner.do_compile(self.test)
    self.assertNotIn('hello from on_execute simplePyRunner unittest', [compiled_test.compile_log, compiled_test.execute_log])

  def test_runner_do_execute_call_on_execute(self):
    '''Check that the do_execute function calls the on_execute function from the test script'''
    default_log = self.test.compile_log
    executed_log = self.runner.do_execute(self.test).execute_log
    self.assertNotEqual(executed_log, default_log)
    self.assertIn('hello from on_compile simplePyRunner unittest', executed_log)

  def test_runner_do_execute_dont_call_on_compile(self):
    '''Check that the do_execute function don`t calls the on_compile function from the test script'''
    executed_test = self.runner.do_execute(self.test)
    self.assertNotIn('hello from on_compile simplePyRunner unittest', [executed_test.compile_log, executed_test.execute_log])

  def test_runner_use_output_contains(self):
    '''Check that the do_execute function calls the on_execute function with check outputs from the test script'''
    compiled_test = self.runner.do_compile(self.test)
    self.assertEqual('FAILED', compiled_test.result)

  def test_runner_use_custom_handler(self):
    '''Check that the do_execute function calls the on_execute function with my_handler from the test script'''
    executed_test = self.runner.do_execute(self.test)
    self.assertIn('Output is wrong', executed_test.execute_log)
    self.assertEqual('FAILED', executed_test.result)

  def test_runner_in_execute_only_mode_for_compile_only_tests(self):
    '''Check compile-only tests sets result SKIPPED in execute-only mode'''
    self.runner.cfg.run_mode = 'execute'
    tmp_test = self.test
    tmp_test._mode = TestRunMode.compilationOnly
    executed_test = self.runner.do_execute(tmp_test)
    self.assertEqual('SKIPPED', executed_test.result)
