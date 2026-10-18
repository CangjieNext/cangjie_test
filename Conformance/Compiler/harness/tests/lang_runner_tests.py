# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: lang_runner_tests.py

Description:
Unit tests for LangRunner class from drivers
'''

import unittest
import os
from subprocess import CompletedProcess
from threading import Lock

from core.config import Config
from drivers.test.base_test import TestResult
from drivers.test import test
from drivers.runner.lang_runner import LangRunner

# It's disabled to get default values from Test class
# pylint: disable=protected-access


class LangRunnerTests(unittest.TestCase):
  '''Tests for LangRunner class from drivers'''

  def setUp(self) -> None:
    Config._DEFAULT_TEST_ROOT_PATH = os.path.join('.', 'tests', 'resources')
    self.cfg = Config()
    self.runner = LangRunner(self.cfg, Lock(), {})
    self.output_dir = os.path.join('.', 'tests', 'resources', 'deps_output')
    return super().setUp()

  def tearDown(self) -> None:
    return super().tearDown()

  def _failed_dependency_in_registry(self, test_obj: test.Test) -> None:
    '''Pretend the shared registry already holds a failed compile of the dependency,
    so _prepare_dependencies skips the real compilation and reaches the failure branch'''
    aux = test_obj.dependencies[0]
    lib_file = os.path.join(self.output_dir, f'lib{aux.module}_{aux.package}.a')
    self.runner.dependency_registry[lib_file] = CompletedProcess(args='', returncode=1, stderr=b'')

  def test_negative_compileonly_keeps_passed_on_dependency_failure(self):
    '''Dependency compile failure is the expected outcome for a negative compile-only test'''
    test_obj = test.Test(os.path.join('.', 'tests', 'resources', 'test_stub_deps_negative.cj'))
    self._failed_dependency_in_registry(test_obj)

    self.runner._prepare_dependencies(test_obj, self.output_dir)

    self.assertEqual(test_obj.result, TestResult.PASSED,
                     'Negative compile-only test must stay PASSED when its dependency fails to compile')
    self.assertIsNone(test_obj.execute_res,
                      'execute_res must not be set for a negative compile-only test')

  def test_non_negative_test_marked_errored_on_dependency_failure(self):
    '''A non-negative test must be marked ERRORED when its dependency fails to compile'''
    test_obj = test.Test(os.path.join('.', 'tests', 'resources', 'test_stub_deps_positive.cj'))
    self._failed_dependency_in_registry(test_obj)

    self.runner._prepare_dependencies(test_obj, self.output_dir)

    self.assertEqual(test_obj.result, TestResult.ERRORED,
                     'Dependency compile failure must mark a non-negative test as ERRORED')
    self.assertEqual(test_obj.execute_res.returncode, 2,
                     'execute_res must carry the failure return code')

  def test_run_mode_test_marked_errored_on_dependency_failure(self):
    '''A run-mode test must be marked ERRORED when its dependency fails to compile'''
    test_obj = test.Test(os.path.join('.', 'tests', 'resources', 'test_stub_deps_positive.cj'))
    test_obj._mode = test.TestRunMode.run
    self._failed_dependency_in_registry(test_obj)

    self.runner._prepare_dependencies(test_obj, self.output_dir)

    self.assertEqual(test_obj.result, TestResult.ERRORED,
                     'Dependency compile failure must mark a run-mode test as ERRORED')
    self.assertEqual(test_obj.execute_res.returncode, 2,
                     'execute_res must carry the failure return code')
