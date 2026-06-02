# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: driver_tests.py

Description:
Unit tests for DriverManager class from core
'''

import unittest

from core.config import Config
from core.driver_manager import DriverGroup, DriverManager, dl
from drivers.test.test import Test
from drivers.runner.lang_runner import LangRunner

# It's disabled to get dafault values from Test class
# pylint: disable=protected-access


class DriverTests(unittest.TestCase):
  '''Tests for DriverManager class from core'''
  correctly_custom = './tests/resources/custom.json'
  wrong_custom = './tests/resources/wrong_custom/custom.json'

  correctly_test_path = './tests/resources/correctly_test.cj'

  custom_test = Test
  custom_runner = LangRunner

  def setUp(self) -> None:
    self.cfg = Config()
    self.cfg.tests_root_path = './tests/'
    self.drive_manager = DriverManager(self.cfg)
    return super().setUp()

# Check the default values of configuration will be set when they wasn't defined
  def test_default_value_test(self):
    '''Check the default values of test will be set if it hasn't been defined'''
    def_value = dl.DEFAULT_TEST
    self.assertEqual(def_value, self.drive_manager.groups[0].test, 'Default value of test is wrong')
    self.assertEqual(def_value, DriverGroup().test, 'Default value of test is wrong')

  def test_default_value_runner(self):
    '''Check the default values of runner will be set if it hasn't been defined'''
    def_value = dl.DEFAULT_RUNNER
    self.assertEqual(def_value, self.drive_manager.groups[0].runner, 'Default value of runner is wrong')
    self.assertEqual(def_value, DriverGroup().runner, 'Default value of runner is wrong')

# Make sure the custom values of configuration could be set and read
  def test_set_correctly_value_test(self):
    '''Make sure the custom value of test could be set and read from real custom.json'''
    custom_value = self.custom_test
    id_group = self.drive_manager.add_group(self.correctly_custom)
    value = self.drive_manager[id_group].test
    self.assertEqual(value, custom_value, 'Custom value of test is wrong')

  def test_set_correctly_value_runner(self):
    '''Make sure the custom value of runner could be set and read from real custom.json'''
    custom_value = self.custom_runner
    id_group = self.drive_manager.add_group(self.correctly_custom)
    value = self.drive_manager[id_group].runner
    self.assertEqual(value, custom_value, 'Custom value of runner is wrong')

  def test_set_wrongly_value_test(self):
    '''Make sure the custom value of test could be set and read from real custom.json'''
    custom_value = dl.DEFAULT_TEST
    id_group = self.drive_manager.add_group(self.wrong_custom)
    value = self.drive_manager[id_group].test
    self.assertEqual(value, custom_value, 'Custom value of test is wrong')

  def test_set_wrongly_value_runner(self):
    '''Make sure the custom value of runner could be set and read from real custom.json'''
    custom_value = dl.DEFAULT_RUNNER
    id_group = self.drive_manager.add_group(self.wrong_custom)
    value = self.drive_manager[id_group].runner
    self.assertEqual(value, custom_value, 'Custom value of runner is wrong')

  def test_get_correctly_value_test(self):
    '''Make sure the custom value of test could be get from real test'''
    custom_value = self.custom_test(self.correctly_test_path).to_dict()
    self.drive_manager.add_custom(self.correctly_custom)
    value = self.drive_manager.to_test(self.correctly_test_path).to_dict()
    self.assertEqual(value, custom_value, 'Custom value of test is wrong')
