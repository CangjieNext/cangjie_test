# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: test_tests.py

Description:
Unit tests for Test class from core
'''

import unittest
from os import remove, path

from drivers.test import test
from drivers.test import base_test

# It's disabled to get dafault values from Test class
# pylint: disable=protected-access


class TestTests(unittest.TestCase):
  '''Tests for Test class from core.test'''
  correctly_test_path = './tests/resources/correctly_test.cj'
  wrongly_test_path = './tests/resources/wrongly_test.cj'

  # Custom values must be equal values in correctly test
  custom_name = 'correctly_test'
  custom_assertion = 'Correct test for unittest'
  custom_description = 'All tags correct'
  custom_mode = base_test.TestRunMode.compilationOnly
  custom_negative = True
  custom_structure = test.Structure.complexMain
  custom_dependencies = 'aux_source'
  custom_timeout_factor = '2.05'
  custom_comment = 'yes, i have a comment'
  custom_package = 'correctly'
  custom_module = 'M_CORRECT'
  custom_issue = '000123'

  def setUp(self) -> None:
    self.fake_test_path = './tests/resources/fake_test.cj'
    open(self.fake_test_path, 'a', encoding='utf-8').close()
    self.fake_test = test.Test(self.fake_test_path)
    self.correct_test = test.Test(self.correctly_test_path)
    self.wrong_test = test.Test(self.wrongly_test_path)
    return super().setUp()

  def tearDown(self) -> None:
    remove(self.fake_test_path)
    return super().tearDown()

# Check the default values of configuration will be set when they wasn't defined
  def test_default_value_name(self):
    '''Check the default values of name will be set if it hasn't been defined'''
    def_value = self.fake_test.name
    self.assertEqual(def_value, path.basename(self.fake_test.test_path).split('.')[0], 'Default value of name is wrong')

  def test_default_value_assertion(self):
    '''Check the default values of assertion will be set if it hasn't been defined'''
    def_value = self.fake_test.assertion
    self.assertEqual(def_value, test.Test._DEFAULT_ASSERTION, 'Default value of assertion is wrong')

  def test_default_value_description(self):
    '''Check the default values of description will be set if it hasn't been defined'''
    def_value = self.fake_test.description
    self.assertEqual(def_value, test.Test._DEFAULT_DESCRIPTION, 'Default value of description is wrong')

  def test_default_value_mode(self):
    '''Check the default values of mode will be set if it hasn't been defined'''
    def_value = self.fake_test.mode
    self.assertEqual(def_value, test.Test._DEFAULT_MODE, 'Default value of mode is wrong')

  def test_default_value_negative(self):
    '''Check the default values of negative will be set if it hasn't been defined'''
    def_value = self.fake_test.is_negative
    self.assertEqual(def_value, test.Test._DEFAULT_NEGATIVE, 'Default value of negative is wrong')

  def test_default_value_structure(self):
    '''Check the default values of structure will be set if it hasn't been defined'''
    def_value = self.fake_test.struct
    self.assertEqual(def_value, test.Test._DEFAULT_STRUCTURE, 'Default value of structure is wrong')

  def test_default_value_dependencies(self):
    '''Check the default values of dependencies will be set if it hasn't been defined'''
    def_value = self.fake_test.dependencies
    self.assertEqual(def_value, test.Test._DEFAULT_DEPENDENCIES, 'Default value of dependencies is wrong')

  def test_default_value_module(self):
    '''Check the default values of module will be set if it hasn't been defined'''
    def_value = self.fake_test.module
    self.assertEqual(def_value, test.Test._DEFAULT_MODULE, 'Default value of module is wrong')

  def test_default_value_timeout_factor(self):
    '''Check the default values of timeout factor will be set if it hasn't been defined'''
    def_value = self.fake_test.timeout_factor
    self.assertEqual(def_value, test.Test._DEFAULT_TIMEOUT_FACTOR, 'Default value of timeout factor is wrong')

  def test_default_value_comment(self):
    '''Check the default values of comment will be set if it hasn't been defined'''
    def_value = self.fake_test.comment
    self.assertEqual(def_value, test.Test._DEFAULT_COMMENT, 'Default value of comment is wrong')

  def test_default_value_package(self):
    '''Check the default values of package will be set if it hasn't been defined'''
    def_value = self.fake_test.package
    self.assertEqual(def_value, test.Test._DEFAULT_PACKAGE, 'Default value of package is wrong')

  def test_default_value_compile_time(self):
    '''Check the default values of compile time will be set if it hasn't been defined'''
    def_value = self.fake_test.compile_time
    self.assertEqual(def_value, test.Test._DEFAULT_COMPILE_TIME, 'Default value of compile time is wrong')

  def test_default_value_execute_time(self):
    '''Check the default values of execute time will be set if it hasn't been defined'''
    def_value = self.fake_test.execute_time
    self.assertEqual(def_value, test.Test._DEFAULT_EXECUTE_TIME, 'Default value of execute time is wrong')

  def test_default_value_issue(self):
    '''Check the default values of issue will be set if it hasn't been defined'''
    def_value = self.fake_test.issue
    self.assertEqual(def_value, test.Test._DEFAULT_ISSUE, 'Default value of issue is wrong')

# Make sure the custom values of configuration could be set and read
  def test_set_correctly_value_name(self):
    '''Make sure the custom value of name could be set and read from real test'''
    custom_value = self.custom_name
    value = self.correct_test.name
    self.assertEqual(value, custom_value, 'Custom value of name is wrong')

  def test_set_correctly_value_assertion(self):
    '''Make sure the custom value of assertion could be set and read from real test'''
    custom_value = self.custom_assertion
    value = self.correct_test.assertion
    self.assertEqual(value, custom_value, 'Custom value of assertion is wrong')

  def test_set_correctly_value_description(self):
    '''Make sure the custom value of description could be set and read from real test'''
    custom_value = self.custom_description
    value = self.correct_test.description
    self.assertEqual(value, custom_value, 'Custom value of description is wrong')

  def test_set_correctly_value_mode(self):
    '''Make sure the custom value of mode could be set and read from real test'''
    custom_value = self.custom_mode
    value = self.correct_test.mode
    self.assertEqual(value, custom_value, 'Custom value of mode is wrong')

  def test_set_wrongly_value_mode(self):
    '''Make sure the custom value of mode could be set and read from real test'''
    value = self.wrong_test.mode
    self.assertEqual(value, test.Test._DEFAULT_MODE, 'Custom value of mode is wrong')

  def test_set_correctly_value_negative(self):
    '''Make sure the custom value of negative could be set and read from real test'''
    custom_value = self.custom_negative
    value = self.correct_test.is_negative
    self.assertEqual(value, custom_value, 'Custom value of negative is wrong')

  def test_set_wrongly_value_negative(self):
    '''Make sure the custom value of negative could be set and read from real test'''
    value = self.wrong_test.is_negative
    self.assertEqual(value, test.Test._DEFAULT_NEGATIVE, 'Custom value of negative is wrong')

  def test_set_correctly_value_structure(self):
    '''Make sure the custom value of structure could be set and read from real test'''
    custom_value = self.custom_structure
    value = self.correct_test.struct
    self.assertEqual(value, custom_value, 'Custom value of structure is wrong')

  def test_set_wrongly_value_structure(self):
    '''Make sure the custom value of structure could be set and read from real test'''
    value = self.wrong_test.struct
    self.assertEqual(value, test.Test._DEFAULT_STRUCTURE, 'Custom value of structure is wrong')

  def test_set_correctly_value_dependencies(self):
    '''Make sure the custom value of dependencies could be set and read from real test'''
    custom_value = self.custom_dependencies
    value = self.correct_test.dependencies[0].name
    self.assertEqual(value, custom_value, 'Custom value of dependencies is wrong')

  def test_set_correctly_value_module(self):
    '''Make sure the custom value of module could be set and read from real test'''
    custom_value = self.custom_module
    value = self.correct_test.module
    self.assertEqual(value, custom_value, 'Custom value of module is wrong')

  def test_set_wrongly_value_module(self):
    '''Make sure the custom value of module could be set and read from real test'''
    value = self.wrong_test.module
    self.assertEqual(value, test.Test._DEFAULT_MODULE, 'Custom value of module is wrong')

  def test_set_correctly_value_timeout_factor(self):
    '''Make sure the custom value of timeout factor could be set and read from real test'''
    custom_value = self.custom_timeout_factor
    value = self.correct_test.timeout_factor
    self.assertEqual(value, float(custom_value), 'Custom value of timeout factor is wrong')

  def test_set_wrongly_value_timeout_factor(self):
    '''Make sure the custom value of timeout factor could be set and read from real test'''
    value = self.wrong_test.timeout_factor
    self.assertEqual(value, test.Test._DEFAULT_TIMEOUT_FACTOR, 'Custom value of timeout factor is wrong')

  def test_set_correctly_value_comment(self):
    '''Make sure the custom value of comment could be set and read from real test'''
    custom_value = self.custom_comment
    value = self.correct_test.comment
    self.assertEqual(value, custom_value, 'Custom value of comment is wrong')

  def test_set_correctly_value_package(self):
    '''Make sure the custom value of package could be set and read from real test'''
    custom_value = self.custom_package
    value = self.correct_test.package
    self.assertEqual(value, custom_value, 'Custom value of package is wrong')

  def test_set_correctly_value_compile_time(self):
    '''Make sure the custom value of compile time could be set and read from real test'''
    custom_value = 5.123
    self.correct_test.compile_time = custom_value
    self.assertEqual(self.correct_test.compile_time, custom_value, 'Custom value of compile time is wrong')

  def test_set_correctly_value_execute_time(self):
    '''Make sure the custom value of execute time could be set and read from real test'''
    custom_value = 1.321
    self.correct_test.execute_time = custom_value
    self.assertEqual(self.correct_test.execute_time, custom_value, 'Custom value of execute time is wrong')

  def test_set_correctly_value_issue(self):
    '''Make sure the custom value of issue could be set and read from real test'''
    custom_value = self.custom_issue
    value = self.correct_test.issue
    self.assertEqual(value, custom_value, 'Custom value of issue is wrong')
