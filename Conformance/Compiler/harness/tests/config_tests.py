# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: config_tests.py

Description:
Unit tests for Config class from core
'''
import os.path
import unittest
from os import makedirs, rmdir

from core import config

# It's disabled to get dafault values from Config class
# pylint: disable=protected-access


class ConfigTests(unittest.TestCase):
  '''Tests for Config class from core.config'''
  custom_work_dir = 'some_work_dir'
  custom_output_dir = 'some_output_dir'
  custom_bin_dir = 'some_bin_dir'
  custom_work_dir2 = 'some_work_dir2'
  custom_output_dir2 = 'some_output_dir2'
  custom_bin_dir2 = 'some_bin_dir2'

  def setUp(self) -> None:
    self.cfg = config.Config()
    self.fake_test_root_dir = 'fake_test_root_dir'
    makedirs(self.fake_test_root_dir)
    config.Config._DEFAULT_TEST_ROOT_PATH = self.fake_test_root_dir
    return super().setUp()

  def tearDown(self) -> None:
    rmdir(self.fake_test_root_dir)

    if os.path.exists(os.path.join(self.custom_work_dir, self.custom_bin_dir)):
      rmdir(os.path.join(self.custom_work_dir, self.custom_bin_dir))

    if os.path.exists(os.path.join(self.custom_work_dir, self.custom_output_dir)):
      rmdir(os.path.join(self.custom_work_dir, self.custom_output_dir))

    if os.path.exists(self.custom_work_dir):
      rmdir(self.custom_work_dir)

    if os.path.exists(os.path.join(self.custom_work_dir2, self.custom_bin_dir2)):
      rmdir(os.path.join(self.custom_work_dir2, self.custom_bin_dir2))

    if os.path.exists(os.path.join(self.custom_work_dir2, self.custom_output_dir2)):
      rmdir(os.path.join(self.custom_work_dir2, self.custom_output_dir2))

    if os.path.exists(self.custom_work_dir2):
      rmdir(self.custom_work_dir2)

    return super().tearDown()

# Check the default values of configuration will be set when they wasn't defined
  def test_default_value_work_directory(self):
    '''Check the default values of work directory will be set if it hasn't been defined'''
    def_value = os.path.basename(self.cfg.work_directory)
    self.assertEqual(def_value, config.Config._DEFAULT_WORK_DIRECTORY, 'Default value of working directory is wrong')

  def test_default_value_binary_output(self):
    '''Check the default values of binary output directory will be set if it hasn't been defined'''
    def_value = os.path.basename(self.cfg.binary_output_path)
    self.assertEqual(def_value, config.Config._DEFAULT_BINARY_OUTPUT_PATH, 'Default value of binary output directory is wrong')

  def test_default_value_run_output(self):
    '''Check the default values of run output directory will be set if it hasn't been defined'''
    def_value = os.path.basename(self.cfg.test_run_output_path)
    self.assertEqual(def_value, config.Config._DEFAULT_TEST_RUN_OUTPUT_PATH, 'Default value of test run output directory is wrong')

  def test_default_value_cangjie_compiler(self):
    '''Check the default values of Cangjie compiler will be set if it hasn't been defined'''
    def_value = os.path.basename(self.cfg.cjc)
    self.assertEqual(def_value, config.Config._DEFAULT_CJC, 'Default value of Cangjie compiler is wrong')

  def test_default_value_c_compiler(self):
    '''Check the default values of C compiler will be set if it hasn't been defined'''
    def_value = os.path.basename(self.cfg.cc)
    self.assertEqual(def_value, config.Config._DEFAULT_CC, 'Default value of C compiler is wrong')

  def test_default_value_cxx_compiler(self):
    '''Check the default values of C++ compiler will be set if it hasn't been defined'''
    def_value = os.path.basename(self.cfg.cxx)
    self.assertEqual(def_value, config.Config._DEFAULT_CXX, 'Default value of C++ compiler is wrong')

  def test_default_value_test_root(self):
    '''Check the default values of test root directory will be set if it hasn't been defined'''
    def_value = os.path.basename(self.cfg.tests_root_path)
    self.assertEqual(def_value, os.path.basename(config.Config._DEFAULT_TEST_ROOT_PATH), 'Default value of test root directory is wrong')

  def test_default_value_tests(self):
    '''Check the default values of tests will be set if it hasn't been defined'''
    def_value = self.cfg.tests
    self.assertEqual(def_value, config.Config._DEFAULT_TESTS, 'Default value of tests is wrong')

  def test_default_value_run_mode(self):
    '''Check the default values of run mode will be set if it hasn't been defined'''
    def_value = self.cfg.run_mode
    self.assertEqual(def_value, config.Config._DEFAULT_RUN_MODE, 'Default value of run mode is wrong')

  def test_default_value_cangjie_compiler_options(self):
    '''Check the default values of cangjie compiler options will be set if it hasn't been defined'''
    def_value = self.cfg.cjc_flags
    self.assertEqual(def_value, config.Config._DEFAULT_CJC_FLAGS, 'Default value of Cangjie compiler options is wrong')

  def test_default_value_c_compiler_options(self):
    '''Check the default values of C compiler options will be set if it hasn't been defined'''
    def_value = self.cfg.cc_flags
    self.assertEqual(def_value, config.Config._DEFAULT_CC_FLAGS, 'Default value of C compiler options is wrong')

  def test_default_value_cxx_ompiler_options(self):
    '''Check the default values of C++ compiler options will be set if it hasn't been defined'''
    def_value = self.cfg.cxx_flags
    self.assertEqual(def_value, config.Config._DEFAULT_CXX_FLAGS, 'Default value of C++ compiler options is wrong')

  def test_default_value_compilation_threads(self):
    '''Check the default values of number of compilation threads will be set if it hasn't been defined'''
    def_value = self.cfg.compilation_threads
    self.assertEqual(def_value, config.Config._DEFAULT_COMPILATION_THREADS, 'Default value of compilation threads is wrong')

  def test_default_value_execution_threads(self):
    '''Check the default values of number of execution threads will be set if it hasn't been defined'''
    def_value = self.cfg.execution_threads
    self.assertEqual(def_value, config.Config._DEFAULT_EXECUTION_THREADS, 'Default value of execution threads is wrong')

  def test_default_value_base_timeout(self):
    '''Check the default values of base timeout for each test will be set if it hasn't been defined'''
    def_value = self.cfg.base_timeout
    self.assertEqual(def_value, config.Config._DEFAULT_BASE_TIMEOUT, 'Default value of base timeout is wrong')

  def test_default_value_filters(self):
    '''Check the default values of filters will be set if it hasn't been defined'''
    def_value = self.cfg.filters
    self.assertEqual(def_value, config.Config._DEFAULT_FILTERS, 'Default value of filters is wrong')

  def test_default_value_excluded_tests(self):
    '''Check the default values of excluded tests will be set if it hasn't been defined'''
    def_value = self.cfg.excluded_tests
    self.assertEqual(def_value, config.Config._DEFAULT_EXCLUDED_TESTS, 'Default value of excluded tests is wrong')

  def test_default_value_included_tests(self):
    '''Check the default values of included tests will be set if it hasn't been defined'''
    def_value = self.cfg.included_tests
    self.assertEqual(def_value, config.Config._DEFAULT_INCLUDED_TESTS, 'Default value of included tests is wrong')

  def test_default_value_test_report_mode(self):
    '''Check the default values of reporting mode will be set if it hasn't been defined'''
    def_value = self.cfg.test_report_mode
    self.assertEqual(def_value, config.Config._DEFAULT_REPORT_MODE, 'Default value of test report mode is wrong')

  def test_default_value_log_file(self):
    '''Check the default values of log file path will be set if it hasn't been defined'''
    def_value = os.path.basename(self.cfg.log_file)
    self.assertEqual(def_value, config.Config._DEFAULT_LOG_FILE, 'Default value of log file is wrong')

  def test_default_value_log_mode(self):
    '''Check the default values of log mode will be set if it hasn't been defined'''
    def_value = self.cfg.log_mode
    self.assertEqual(def_value, config.Config._DEFAULT_LOG_MODE, 'Default value of log mode is wrong')

  def test_default_value_log_no_color(self):
    '''Check the default values of log_no_color flag will be set if it hasn't been defined'''
    def_value = self.cfg.log_no_color
    self.assertEqual(def_value, config.Config._DEFAULT_LOG_NO_COLOR, 'Default value of log_no_color flag is wrong')

  def test_default_value_profile(self):
    '''Check the default values of profile flag will be set if it hasn't been defined'''
    def_value = self.cfg.profile
    self.assertEqual(def_value, config.Config._DEFAULT_PROFILE, 'Default value of profile flag is wrong')

# Make sure the custom values of configuration could be set and read
  def test_set_value_work_directory(self):
    '''Make sure the custom value of working directory could be set and read'''
    custom_value = self.custom_work_dir
    self.cfg.work_directory = custom_value
    value = os.path.basename(self.cfg.work_directory)
    self.assertEqual(value, custom_value, 'Custom value of working directory is wrong')
    self.assertTrue(os.path.exists(self.cfg.work_directory), 'Custom working directory wasn\'t created')

  def test_set_value_binary_output(self):
    '''Make sure the custom value of binary output directory could be set and read'''
    custom_value = self.custom_bin_dir
    self.cfg.binary_output_path = custom_value
    value = os.path.basename(self.cfg.binary_output_path)
    self.assertEqual(value, custom_value, 'Custom value of binary output directory is wrong')
    self.assertTrue(os.path.exists(self.cfg.binary_output_path), 'Custom binary output directory wasn\'t created')

  def test_set_value_run_output(self):
    '''Make sure the custom value of run output directory could be set and read'''
    custom_value = self.custom_output_dir
    self.cfg.test_run_output_path = custom_value
    value = os.path.basename(self.cfg.test_run_output_path)
    self.assertEqual(value, custom_value, 'Custom value of test run output directory is wrong')
    self.assertTrue(os.path.exists(self.cfg.test_run_output_path), 'Custom test run output directory wasn\'t created')

  def test_set_value_cangjie_compiler(self):
    '''Make sure the custom value of Cangjie compiler could be set and read'''
    custom_value = 'gcc'
    self.cfg.cjc = custom_value
    value = os.path.basename(self.cfg.cjc)
    self.assertEqual(value, custom_value, 'Custom value of Cangjie compiler is wrong')
    self.assertIsNotNone(self.cfg.cjc_version, 'Cangjie compiler version wasn\'t detected')

  def test_set_value_c_compiler(self):
    '''Make sure the custom value of C compiler could be set and read'''
    custom_value = 'gcc'
    self.cfg.cc = custom_value
    value = os.path.basename(self.cfg.cc)
    self.assertEqual(value, custom_value, 'Custom value of C compiler is wrong')
    self.assertIsNotNone(self.cfg.cc_version, 'C compiler version wasn\'t detected')

  def test_set_value_cxx_compiler(self):
    '''Make sure the custom value of C++ compiler could be set and read'''
    custom_value = 'gcc'
    self.cfg.cxx = custom_value
    value = os.path.basename(self.cfg.cxx)
    self.assertEqual(value, custom_value, 'Custom value of C++ compiler is wrong')
    self.assertIsNotNone(self.cfg.cxx_version, 'C++ compiler version wasn\'t detected')

  def test_set_value_test_root(self):
    '''Make sure the custom value of test root directory could be set and read'''
    custom_value = 'tests'
    self.cfg.tests_root_path = custom_value
    value = os.path.basename(self.cfg.tests_root_path)
    self.assertEqual(value, custom_value, 'Custom value of test root directory is wrong')

  def test_set_value_tests(self):
    '''Make sure the custom value of tests could be set and read'''
    custom_value = ['src/tests', 'test_fake.cj']
    self.cfg.tests = custom_value
    value = self.cfg.tests
    self.assertEqual(value, ['*src/tests*', '*test_fake.cj'], 'Custom value of tests is wrong')

  def test_set_value_run_mode(self):
    '''Make sure the custom value of test run mode could be set and read'''
    self.cfg.run_mode = config.RunMode.compilationOnly
    self.assertEqual(self.cfg.run_mode, config.RunMode.compilationOnly, 'Custom value of run mode is wrong')

  def test_set_value_cangjie_compiler_options(self):
    '''Make sure the custom value of Cangjie compiler options could be set and read'''
    custom_value = '-j 4'
    self.cfg.cjc_flags = custom_value
    self.assertEqual(self.cfg.cjc_flags, custom_value, 'Custom value of Cangjie compiler options is wrong')

  def test_set_value_c_compiler_options(self):
    '''Make sure the custom value of C compiler options could be set and read'''
    custom_value = '-j 4'
    self.cfg.cc_flags = custom_value
    self.assertEqual(self.cfg.cc_flags, custom_value, 'Custom value of C compiler options is wrong')

  def test_set_value_cxx_compiler_options(self):
    '''Make sure the custom value of C++ compiler options could be set and read'''
    custom_value = '-j 4'
    self.cfg.cxx_flags = custom_value
    self.assertEqual(self.cfg.cxx_flags, custom_value, 'Custom value of C++ compiler options is wrong')

  def test_set_value_compilation_threads(self):
    '''Make sure the custom value of compilation threads number could be set and read'''
    custom_value = 6
    self.cfg.compilation_threads = custom_value
    self.assertEqual(self.cfg.compilation_threads, custom_value, 'Custom value of compilation threads is wrong')

  def test_set_value_execution_threads(self):
    '''Make sure the custom value of execution threads number could be set and read'''
    custom_value = 9
    self.cfg.execution_threads = custom_value
    self.assertEqual(self.cfg.execution_threads, custom_value, 'Custom value of execution threads is wrong')

  def test_set_value_base_timeout(self):
    '''Make sure the custom value of base timeout could be set and read'''
    custom_value = 1001
    self.cfg.base_timeout = custom_value
    self.assertEqual(self.cfg.base_timeout, custom_value, 'Custom value of base timeout is wrong')

  def test_set_value_filters(self):
    '''Make sure the custom value of filters could be set and read'''
    custom_value = ['aa', 'bb']
    self.cfg.filters = custom_value
    self.assertEqual(self.cfg.filters, custom_value, 'Custom value of filters is wrong')

  def test_set_value_excluded_tests(self):
    '''Make sure the custom value of excluded tests could be set and read'''
    custom_value = ['cc', 'dd']
    self.cfg.excluded_tests = custom_value
    self.assertEqual(self.cfg.excluded_tests, custom_value, 'Custom value of excluded tests is wrong')

  def test_set_value_included_tests(self):
    '''Make sure the custom value of included tests could be set and read'''
    custom_value = ['ee', 'ff']
    self.cfg.included_tests = custom_value
    self.assertEqual(self.cfg.included_tests, custom_value, 'Custom value of included tests is wrong')

  def test_set_value_test_report_mode(self):
    '''Make sure the custom value of test report mode could be set and read'''
    self.cfg.test_report_mode = config.ReportMode.html
    self.assertEqual(self.cfg.test_report_mode, config.ReportMode.html, 'Custom value of test report mode is wrong')

  def test_set_value_log_file(self):
    '''Make sure the custom value of log file could be set and read'''
    custom_value = 'my_log_file.log'
    self.cfg.log_file = custom_value
    value = os.path.basename(self.cfg.log_file)
    self.assertEqual(value, custom_value, 'Default value of log file is wrong')

  def test_set_value_log_mode(self):
    '''Make sure the custom value of log mode could be set and read'''
    self.cfg.log_mode = config.VerbosityLevel.VERBOSE
    self.assertEqual(self.cfg.log_mode, config.VerbosityLevel.VERBOSE, 'Custom value of log mode is wrong')

  def test_set_value_log_no_color(self):
    '''Make sure the custom value of log_no_color flag could be set and read'''
    self.cfg.log_no_color = True
    self.assertEqual(self.cfg.log_no_color, True, 'Custom value of log_no_color flag is wrong')

  def test_set_value_profile(self):
    '''Make sure the custom value of profile flag could be set and read'''
    self.cfg.profile = True
    self.assertEqual(self.cfg.profile, True, 'Custom value of profile flag is wrong')


# Tests on changing configuration values. You shouldn't change them.

  def test_try_change_value_work_directory(self):
    '''Check that the initial value of the working directory cannot be changed'''
    initial_value = self.custom_work_dir
    self.cfg.work_directory = initial_value
    self.cfg.work_directory = self.custom_work_dir2
    value = os.path.basename(self.cfg.work_directory)
    self.assertEqual(value, initial_value, 'Initial value of working directory was changed')

  def test_try_change_value_binary_output(self):
    '''Check that the initial value of the binary output directory cannot be changed'''
    initial_value = self.custom_bin_dir
    self.cfg.binary_output_path = initial_value
    self.cfg.binary_output_path = self.custom_bin_dir2
    value = os.path.basename(self.cfg.binary_output_path)
    self.assertEqual(value, initial_value, 'Initial value of binary output directory was changed')

  def test_try_change_value_run_output(self):
    '''Check that the initial value of the run output directory cannot be changed'''
    initial_value = self.custom_output_dir
    self.cfg.test_run_output_path = initial_value
    self.cfg.test_run_output_path = self.custom_output_dir2
    value = os.path.basename(self.cfg.test_run_output_path)
    self.assertEqual(value, initial_value, 'Initial value of test run output directory was changed')

  def test_try_change_value_cangjie_compiler(self):
    '''Check that the initial value of the Cangjie compiler cannot be changed'''
    initial_value = 'gcc'
    self.cfg.cjc = initial_value
    self.cfg.cjc = 'g++'
    value = os.path.basename(self.cfg.cjc)
    self.assertEqual(value, initial_value, 'Initial value of Cangjie compiler was changed')

  def test_try_change_value_c_compiler(self):
    '''Check that the initial value of the C compiler cannot be changed'''
    initial_value = 'gcc'
    self.cfg.cc = initial_value
    self.cfg.cc = 'g++'
    value = os.path.basename(self.cfg.cc)
    self.assertEqual(value, initial_value, 'Initial value of C compiler was changed')

  def test_try_change_value_cxx_compiler(self):
    '''Check that the initial value of the C++ compiler cannot be changed'''
    initial_value = 'gcc'
    self.cfg.cxx = initial_value
    self.cfg.cxx = 'g++'
    value = os.path.basename(self.cfg.cxx)
    self.assertEqual(value, initial_value, 'Initial value of C++ compiler was changed')

  def test_try_change_value_test_root(self):
    '''Check that the initial value of the test root directory cannot be changed'''
    initial_value = 'tests'
    self.cfg.tests_root_path = initial_value
    self.cfg.tests_root_path = 'harness'
    value = os.path.basename(self.cfg.tests_root_path)
    self.assertEqual(value, initial_value, 'Initial value of test root directory was changed')

  def test_try_change_value_tess(self):
    '''Check that the initial value of the tests cannot be changed'''
    initial_value = ['*tests*']
    self.cfg.tests = initial_value
    self.cfg.tests = ['harness']
    value = self.cfg.tests
    self.assertEqual(value, initial_value, 'Initial value of tests was changed')

  def test_try_change_value_run_mode(self):
    '''Check that the initial value of the test run mode cannot be changed'''
    self.cfg.run_mode = config.RunMode.compilationOnly
    self.cfg.run_mode = config.RunMode.executionOnly
    self.assertEqual(self.cfg.run_mode, config.RunMode.compilationOnly, 'Initial value of run mode was changed')

  def test_try_change_value_cangjie_compiler_options(self):
    '''Check that the initial value of the compiler options cannot be changed'''
    initial_value = '-j 4'
    self.cfg.cjc_flags = initial_value
    self.cfg.cjc_flags = '-o bla-bla-bla.a'
    self.assertEqual(self.cfg.cjc_flags, initial_value, 'Initial value of Cangjie compiler options was changed')

  def test_try_change_value_c_compiler_options(self):
    '''Check that the initial value of the C compiler options cannot be changed'''
    initial_value = '-j 4'
    self.cfg.cc_flags = initial_value
    self.cfg.cc_flags = '-o bla-bla-bla.a'
    self.assertEqual(self.cfg.cc_flags, initial_value, 'Initial value of C compiler options was changed')

  def test_try_change_value_cxx_compiler_options(self):
    '''Check that the initial value of the C++ compiler options cannot be changed'''
    initial_value = '-j 4'
    self.cfg.cxx_flags = initial_value
    self.cfg.cxx_flags = '-o bla-bla-bla.a'
    self.assertEqual(self.cfg.cxx_flags, initial_value, 'Initial value of C++ compiler options was changed')

  def test_try_change_value_compilation_threads(self):
    '''Check that the initial value of the compilation threads number cannot be changed'''
    initial_value = 6
    self.cfg.compilation_threads = initial_value
    self.cfg.compilation_threads = 7
    self.assertEqual(self.cfg.compilation_threads, initial_value, 'Initial value of compilation threads was changed')

  def test_try_change_value_execution_threads(self):
    '''Check that the initial value of the execution threads number cannot be changed'''
    initial_value = 9
    self.cfg.execution_threads = initial_value
    self.cfg.execution_threads = 8
    self.assertEqual(self.cfg.execution_threads, initial_value, 'Initial value of execution threads was changed')

  def test_try_change_value_base_timeout(self):
    '''Check that the initial value of the base timeout cannot be changed'''
    initial_value = 1001
    self.cfg.base_timeout = initial_value
    self.cfg.base_timeout = 700
    self.assertEqual(self.cfg.base_timeout, initial_value, 'Initial value of base timeout was changed')

  def test_try_change_value_filters(self):
    '''Check that the initial value of the filters cannot be changed'''
    initial_value = ['aa', 'bb']
    self.cfg.filters = initial_value
    self.cfg.filters = ['cc']
    self.assertEqual(self.cfg.filters, initial_value, 'Initial value of filters was changed')

  def test_try_change_value_excluded_tests(self):
    '''Check that the initial value of the excluded tests cannot be changed'''
    initial_value = ['cc', 'dd']
    self.cfg.excluded_tests = initial_value
    self.cfg.excluded_tests = []
    self.assertEqual(self.cfg.excluded_tests, initial_value, 'Initial value of excluded tests was changed')

  def test_try_change_value_included_tests(self):
    '''Check that the initial value of the included tests cannot be changed'''
    initial_value = ['ee', 'ff']
    self.cfg.included_tests = initial_value
    self.cfg.included_tests = ['dd']
    self.assertEqual(self.cfg.included_tests, initial_value, 'Initial value of included tests was changed')

  def test_try_change_value_test_report_mode(self):
    '''Check that the initial value of the test report mode cannot be changed'''
    self.cfg.test_report_mode = config.ReportMode.html
    self.cfg.test_report_mode = config.ReportMode.plain
    self.assertEqual(self.cfg.test_report_mode, config.ReportMode.html, 'Initial value of test report mode was changed')

  def test_try_change_value_log_file(self):
    '''Check that the initial value of the log file cannot be changed'''
    initial_value = 'my_log_file.log'
    self.cfg.log_file = initial_value
    self.cfg.log_file = 'other_log_file.txt'
    value = os.path.basename(self.cfg.log_file)
    self.assertEqual(value, initial_value, 'Default value of log file was changed')


# Check the default values of configuration will be set if None will pass to setter

  def test_try_set_none_value_work_directory(self):
    '''Check the default values of work directory will be set when None is passed as input'''
    self.cfg.work_directory = None
    value = os.path.basename(self.cfg.work_directory)
    self.assertEqual(value, config.Config._DEFAULT_WORK_DIRECTORY, 'Default value of working directory wasn\'t set')

  def test_try_set_none_value_binary_output(self):
    '''Check the default values of binary output directory will be set when None is passed as input'''
    self.cfg.binary_output_path = None
    value = os.path.basename(self.cfg.binary_output_path)
    self.assertEqual(value, config.Config._DEFAULT_BINARY_OUTPUT_PATH, 'Default value of binary output directory wasn\'t set')

  def test_try_set_none_value_run_output(self):
    '''Check the default values of run output directory will be set when None is passed as input'''
    self.cfg.test_run_output_path = None
    value = os.path.basename(self.cfg.test_run_output_path)
    self.assertEqual(value, config.Config._DEFAULT_TEST_RUN_OUTPUT_PATH, 'Default value of test run output directory wasn\'t set')

  def test_try_set_none_value_cangjie_compiler(self):
    '''Check the default values of compiler will be set when None is passed as input'''
    self.cfg.cjc = None
    value = os.path.basename(self.cfg.cjc)
    self.assertEqual(value, config.Config._DEFAULT_CJC, 'Default value of Cangjie compiler wasn\'t set')

  def test_try_set_none_value_c_compiler(self):
    '''Check the default values of compiler will be set when None is passed as input'''
    self.cfg.cc = None
    value = os.path.basename(self.cfg.cc)
    self.assertEqual(value, config.Config._DEFAULT_CC, 'Default value of C compiler wasn\'t set')

  def test_try_set_none_value_cxx_compiler(self):
    '''Check the default values of compiler will be set when None is passed as input'''
    self.cfg.cxx = None
    value = os.path.basename(self.cfg.cxx)
    self.assertEqual(value, config.Config._DEFAULT_CXX, 'Default value of C++ compiler wasn\'t set')

  def test_try_set_none_value_test_root(self):
    '''Check the default values of test root directory will be set when None is passed as input'''
    self.cfg.tests_root_path = None
    value = os.path.basename(self.cfg.tests_root_path)
    self.assertEqual(value, os.path.basename(config.Config._DEFAULT_TEST_ROOT_PATH), 'Default value of test root directory wasn\'t set')

  def test_try_set_none_value_tests(self):
    '''Check the default values of tests will be set when None is passed as input'''
    self.cfg.tests = None
    value = self.cfg.tests
    self.assertEqual(value, config.Config._DEFAULT_TESTS, 'Default value of tests wasn\'t set')

  def test_try_set_none_value_run_mode(self):
    '''Check the default values of run mode will be set when None is passed as input'''
    self.cfg.run_mode = None
    value = self.cfg.run_mode
    self.assertEqual(value, config.Config._DEFAULT_RUN_MODE, 'Default value of run mode wasn\'t set')

  def test_try_set_none_value_cangjie_compiler_options(self):
    '''Check the default values of compiler options will be set when None is passed as input'''
    self.cfg.cjc_flags = None
    value = self.cfg.cjc_flags
    self.assertEqual(value, config.Config._DEFAULT_CJC_FLAGS, 'Default value of Cangjie compiler options wasn\'t set')

  def test_try_set_none_value_c_compiler_options(self):
    '''Check the default values of compiler options will be set when None is passed as input'''
    self.cfg.cc_flags = None
    value = self.cfg.cc_flags
    self.assertEqual(value, config.Config._DEFAULT_CC_FLAGS, 'Default value of C compiler options wasn\'t set')

  def test_try_set_none_value_cxx_compiler_options(self):
    '''Check the default values of compiler options will be set when None is passed as input'''
    self.cfg.cxx_flags = None
    value = self.cfg.cxx_flags
    self.assertEqual(value, config.Config._DEFAULT_CXX_FLAGS, 'Default value of C++ compiler options wasn\'t set')

  def test_try_set_none_value_compilation_threads(self):
    '''Check the default values of number of compilation threads will be set when None is passed as input'''
    self.cfg.compilation_threads = None
    value = self.cfg.compilation_threads
    self.assertEqual(value, config.Config._DEFAULT_COMPILATION_THREADS, 'Default value of compilation threads wasn\'t set')

  def test_try_set_none_value_execution_threads(self):
    '''Check the default values of number of execution threads will be set when None is passed as input'''
    self.cfg.execution_threads = None
    value = self.cfg.execution_threads
    self.assertEqual(value, config.Config._DEFAULT_EXECUTION_THREADS, 'Default value of execution threads wasn\'t set')

  def test_try_set_none_value_base_timeout(self):
    '''Check the default values of base timeout for each test will be set when None is passed as input'''
    self.cfg.base_timeout = None
    value = self.cfg.base_timeout
    self.assertEqual(value, config.Config._DEFAULT_BASE_TIMEOUT, 'Default value of base timeout wasn\'t set')

  def test_try_set_none_value_filters(self):
    '''Check the default values of filters will be set when None is passed as input'''
    self.cfg.filters = None
    value = self.cfg.filters
    self.assertEqual(value, config.Config._DEFAULT_FILTERS, 'Default value of filters wasn\'t set')

  def test_try_set_none_value_excluded_tests(self):
    '''Check the default values of excluded tests will be set when None is passed as input'''
    self.cfg.excluded_tests = None
    value = self.cfg.excluded_tests
    self.assertEqual(value, config.Config._DEFAULT_EXCLUDED_TESTS, 'Default value of excluded tests wasn\'t set')

  def test_try_set_none_value_included_tests(self):
    '''Check the default values of included tests will be set when None is passed as input'''
    self.cfg.included_tests = None
    value = self.cfg.included_tests
    self.assertEqual(value, config.Config._DEFAULT_INCLUDED_TESTS, 'Default value of included tests wasn\'t set')

  def test_try_set_none_value_test_report_mode(self):
    '''Check the default values of reporting mode will be set when None is passed as input'''
    self.cfg.test_report_mode = None
    value = self.cfg.test_report_mode
    self.assertEqual(value, config.Config._DEFAULT_REPORT_MODE, 'Default value of test report mode wasn\'t set')

  def test_try_set_none_value_log_file(self):
    '''Check the default values of log file path will be set when None is passed as input'''
    self.cfg.log_file = None
    value = os.path.basename(self.cfg.log_file)
    self.assertEqual(value, config.Config._DEFAULT_LOG_FILE, 'Default value of log file wasn\'t set')

  def test_try_set_none_value_log_mode(self):
    '''Check the default values of log mode will be set when None is passed as input'''
    self.cfg.log_mode = None
    value = self.cfg.log_mode
    self.assertEqual(value, config.Config._DEFAULT_LOG_MODE, 'Default value of log mode wasn\'t set')

  def test_try_set_none_value_log_no_color(self):
    '''Check the default values of log_no_color flag will be set when None is passed as input'''
    self.cfg.log_no_color = None
    value = self.cfg.log_no_color
    self.assertEqual(value, config.Config._DEFAULT_LOG_NO_COLOR, 'Default value of log_no_color flag wasn\'t set')

  def test_try_set_none_value_profile(self):
    '''Check the default values of profile flag will be set when None is passed as input'''
    self.cfg.profile = None
    value = self.cfg.profile
    self.assertEqual(value, config.Config._DEFAULT_PROFILE, 'Default value of profile flag wasn\'t set')

# Some additional tests
  def test_non_exists_tests_root(self):
    '''Check that the exception will raise when test root path set to non-existing directory'''
    with self.assertRaises(Exception):
      self.cfg.tests_root_path = 'some doesnt exist dir'

  def test_get_cjc_version_without_cangjie_compiler_set(self):
    '''Check that the Cangjie compiler version is None when compiler was not set'''
    self.assertIsNone(self.cfg.cjc_version, 'Cangjie compiler version is not None')

  def test_get_cc_version_without_c_compiler_set(self):
    '''Check that the C compiler version is None when compiler was not set'''
    self.assertIsNone(self.cfg.cc_version, 'C compiler version is not None')

  def test_get_cxx_version_without_cxx_compiler_set(self):
    '''Check that the C++ compiler version is None when compiler was not set'''
    self.assertIsNone(self.cfg.cxx_version, 'C++ compiler version is not None')

  def test_wrong_cangjie_compiler_setup(self):
    '''Check that the exception will raise when compiler set to non-existing program'''
    with self.assertRaises(Exception):
      self.cfg.cjc = 'non-existing-compiler'

  def test_to_string_conversion(self):
    '''Check that all values from config present when it converted to string'''
    self.cfg.work_directory = self.custom_work_dir
    self.cfg.binary_output_path = self.custom_bin_dir
    self.cfg.test_run_output_path = self.custom_output_dir
    self.cfg.cjc = 'gcc'
    self.cfg.cc = 'g++'
    self.cfg.cxx = 'clang'
    self.cfg.tests_root_path = 'tests'
    self.cfg.tests = ['*src/tests*']
    # Execution
    self.cfg.run_mode = config.RunMode.compilationOnly
    self.cfg.cjc_flags = '-someOption0'
    self.cfg.cc_flags = '-someOption1'
    self.cfg.cxx_flags = '-someOption2'
    self.cfg.compilation_threads = 34
    self.cfg.execution_threads = 43
    self.cfg.base_timeout = 123
    self.cfg.filters = ['ab']
    self.cfg.excluded_tests = ['cd']
    self.cfg.included_tests = ['ef']
    # Report
    self.cfg.test_report_mode = config.ReportMode.html
    self.cfg.log_file = 'some-log-file.txt'
    self.cfg.log_mode = config.VerbosityLevel.VERBOSE
    self.cfg.log_no_color = True
    self.cfg.profile = True

    value = str(self.cfg)
    self.assertTrue(self.custom_work_dir in value, 'Working directory wasn\'t found')
    self.assertTrue(self.custom_bin_dir in value, 'Binary output directory wasn\'t found')
    self.assertTrue(self.custom_output_dir in value, 'Test run output directory wasn\'t found')
    self.assertTrue('gcc' in value, 'Cangjie compiler wasn\'t found')
    self.assertTrue('g++' in value, 'C compiler wasn\'t found')
    self.assertTrue('clang' in value, 'C++ compiler wasn\'t found')
    self.assertTrue('tests' in value, 'Test root path wasn\'t found')
    self.assertTrue('*src/tests*' in value, 'Value of tests wasn\'t found')
    self.assertTrue(str(config.RunMode.compilationOnly) in value, 'Run mode wasn\'t found')
    self.assertTrue('-someOption0' in value, 'Cangjie compiler options wasn\'t found')
    self.assertTrue('-someOption1' in value, 'C compiler options wasn\'t found')
    self.assertTrue('-someOption2' in value, 'C++ compiler options wasn\'t found')
    self.assertTrue('34' in value, 'Compilation threads wasn\'t found')
    self.assertTrue('43' in value, 'Execution threads wasn\'t found')
    self.assertTrue('123' in value, 'Base timeout wasn\'t found')
    self.assertTrue('ab' in value, 'Filters wasn\'t found')
    self.assertTrue('cd' in value, 'Excluded tests wasn\'t found')
    self.assertTrue('ef' in value, 'Included tests wasn\'t found')
    self.assertTrue(str(config.ReportMode.html) in value, 'Report mode wasn\'t found')
    self.assertTrue('some-log-file.txt' in value, 'Log file wasn\'t found')
    self.assertTrue('VERBOSE' in value, 'Log mode wasn\'t found')
    self.assertTrue("'log_no_color': True" in value, 'Log no color flag wasn\'t found')
    self.assertTrue("'profile': True" in value, 'Profile flag wasn\'t found')
