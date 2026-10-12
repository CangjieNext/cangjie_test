# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: lang_runner_tests.py

Description:
Unit tests for LangRunner class from drivers.runner
'''

import unittest
from os import remove
from os.path import join
from subprocess import CompletedProcess
from threading import Lock

from core.config import Config
from drivers.runner.lang_runner import LangRunner
from drivers.test.test import Test, TestResult


class LangRunnerTests(unittest.TestCase):
  '''Tests for LangRunner dependency handling'''
  correctly_test_path = './tests/resources/correctly_test.cj'
  output_dir = './tests/resources'

  def setUp(self) -> None:
    self.cfg = Config()
    self.cfg.tests_root_path = './tests/'
    return super().setUp()

  def _runner_with_failed_dependency(self, lib_file: str) -> LangRunner:
    registry = {lib_file: CompletedProcess([], stderr=b'error', returncode=1)}
    return LangRunner(self.cfg, Lock(), registry)

  def test_negative_test_passes_when_dependency_compile_fails(self):
    '''A negative compile-only test must PASS when its dependency fails to compile'''
    test = Test(self.correctly_test_path)
    lib_file = join(self.output_dir, 'libdefault_correctly')
    runner = self._runner_with_failed_dependency(lib_file)
    runner._prepare_dependencies(test, self.output_dir)
    self.assertEqual(test.result, TestResult.PASSED,
                     'Negative test with failed dependency must be PASSED')

  def test_prepare_build_list_builds_dependencies_before_dependents(self):
    '''Dependency packages must be built before their dependents (topological order)'''
    main_path = join(self.output_dir, 'order_main.cj')
    aux1_path = join(self.output_dir, 'order_aux1.cj')
    aux2_path = join(self.output_dir, 'order_aux2.cj')
    with open(main_path, 'w', encoding='utf-8') as f:
      f.write('''/*
  @Structure: complex-main
  @Dependencies: order_aux1.cj order_aux2.cj
*/
package m
main(): Unit {}
''')
    with open(aux1_path, 'w', encoding='utf-8') as f:
      f.write('''/*
  @Structure: complex-aux
*/
package p1
public class A1 {}
''')
    with open(aux2_path, 'w', encoding='utf-8') as f:
      f.write('''/*
  @Structure: complex-aux
  @Dependencies: order_aux1.cj
*/
package p2
import p1.*
public class A2 {}
''')
    try:
      runner = LangRunner(self.cfg, Lock(), {})
      build_list = runner._prepare_build_list(Test(main_path))
      self.assertEqual([t.package for t in build_list[0]], ['p1'], 'pkg1 must be built first')
      self.assertEqual([t.package for t in build_list[1]], ['p2'], 'pkg2 must be built after pkg1')
      self.assertEqual(build_list[-1], [], 'Main test itself must be removed from the last group')
    finally:
      remove(main_path)
      remove(aux1_path)
      remove(aux2_path)

  def test_positive_test_errored_when_dependency_compile_fails(self):
    '''A positive test must be ERRORED when its dependency fails to compile'''
    main_path = join(self.output_dir, 'positive_main.cj')
    aux_path = join(self.output_dir, 'positive_aux.cj')
    with open(main_path, 'w', encoding='utf-8') as f:
      f.write('''/*
  @Negative: no
  @Structure: complex-main
  @Dependencies: positive_aux.cj
*/
package mainpkg
main(): Unit {}
''')
    with open(aux_path, 'w', encoding='utf-8') as f:
      f.write('''/*
  @Structure: complex-aux
*/
package auxpkg
func foo() {}
''')
    try:
      test = Test(main_path)
      lib_file = join(self.output_dir, 'libdefault_auxpkg')
      runner = self._runner_with_failed_dependency(lib_file)
      runner._prepare_dependencies(test, self.output_dir)
      self.assertEqual(test.result, TestResult.ERRORED,
                       'Positive test with failed dependency must be ERRORED')
    finally:
      remove(main_path)
      remove(aux_path)
