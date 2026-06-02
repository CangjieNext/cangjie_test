# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: config_manager.py

Description:
Module for Load/Save & Get/Set Harness Settings
'''

import json
import logging
import os.path
from argparse import Namespace
import shutil

from core import config
from utils.utils import normpath


class ConfigManager:
  '''Configuration manager which prepare config for future use'''

  def __init__(self, args: Namespace, root_path: str) -> None:
    # Init logger

    # Check if the debug option was provided
    if args.debug:
      logging.basicConfig(format='%(asctime)s:[%(levelname)s]:(%(filename)s) - %(message)s')
      logging.getLogger().setLevel(logging.DEBUG)
    else:
      logging.basicConfig(format='%(asctime)s:[%(levelname)s]: %(message)s')
      logging.getLogger().setLevel(logging.INFO)
    logging.debug('Args: %s\n', args)

    # Set settings
    self._root_path = root_path
    self._config = config.Config()
    self._config.replay = args.replay

    # Check that local-settings.json is exists and parse it
    if args.config_file is None:
      self._settings_file = self._get_settings_file_path()
    else:
      if os.path.exists(args.config_file):
        self._settings_file = args.config_file
      else:
        self._settings_file = None
        self._settings_from_file = None
        logging.info('Config file not found: %s', args.config_file)
    if not self._settings_file is None:
      with open(self._settings_file, 'r', encoding='utf-8') as settings_file:
        self._settings_from_file = json.load(settings_file)

    # General
    self._config.work_directory = self._get_option_value(args.work_dir, 'work_directory')
    if args.clean:
      while True:
        if args.clean_confirm:
          clean_confirmation = 'y'
        else:
          clean_confirmation = str(input(f'Do you really want to clear the directory {self._config.work_directory}? (y/N): ')).lower()
        if clean_confirmation == 'y':
          print(f'Clearing {self._config.work_directory} directory')
          for file in os.listdir(self._config.work_directory):
            target = os.path.join(self._config.work_directory, file)
            if os.path.isdir(target):
              shutil.rmtree(target)
            else:
              os.remove(target)
        elif clean_confirmation and clean_confirmation != 'n':
          print('Unrecognized response. Try again.')
          continue
        break

    self._config.binary_output_path = self._get_option_value(args.bin_output, 'binary_output_path')
    self._config.test_run_output_path = self._get_option_value(args.test_output, 'test_run_output_path')
    self._config.cj = self._get_option_value(args.cj, 'cj')
    self._config.cjc = self._get_option_value(args.cjc, 'cjc')
    self._config.cc = self._get_option_value(args.cc, 'cc')
    self._config.cxx = self._get_option_value(args.cxx, 'cxx')
    self._config.java = self._get_option_value(args.java, 'java')
    self._config.javac = self._get_option_value(args.javac, 'javac')
    self._config.tests_root_path = self._get_option_value(args.test_root, 'tests_root_path')
    self._config.tests = self._get_option_value(args.tests, 'tests')
    self._config.level = self._get_option_value(args.level, 'level')

    # Execution
    self._config.run_mode = self._get_option_value(args.run_mode, 'run_mode')
    self._config.cj_flags = self._get_option_value(args.cj_flags, 'cj_flags')
    self._config.cjc_flags = self._get_option_value(args.cjc_flags, 'cjc_flags')
    self._config.cc_flags = self._get_option_value(args.cc_flags, 'cc_flags')
    self._config.cxx_flags = self._get_option_value(args.cxx_flags, 'cxx_flags')
    self._config.java_flags = self._get_option_value(args.java_flags, 'java_flags')
    self._config.javac_flags = self._get_option_value(args.javac_flags, 'javac_flags')
    self._config.compilation_threads = self._get_option_value(args.compilation_threads, 'compilation_threads')
    self._config.execution_threads = self._get_option_value(args.execution_threads, 'execution_threads')
    self._config.base_timeout = self._get_option_value(args.base_timeout, 'base_timeout')
    self._config.is_jet = self._get_option_value(args.is_jet, 'is_jet')
    self._config.filters = self._get_option_value(args.filters, 'filters')  # Not sure how to path them from command line argument

    # Processing of excluded tests list
    excluded_tests_list_file_path = self._get_option_value(args.excluded_tests_list, 'excluded_tests_list')
    if not excluded_tests_list_file_path is None and not os.path.isabs(excluded_tests_list_file_path) and not os.path.exists(excluded_tests_list_file_path):
      excluded_tests_list_file_path = root_path + os.path.sep + excluded_tests_list_file_path

    if excluded_tests_list_file_path is None or not os.path.exists(excluded_tests_list_file_path):
      self._config.excluded_tests = []
    else:
      with open(excluded_tests_list_file_path, 'r', encoding='utf-8') as tests_list_file:
        self._config.excluded_tests = self._process_path_list(tests_list_file)

    # Processing of included tests list
    included_tests_list_file_path = self._get_option_value(args.included_tests_list, 'included_tests_list')
    if not included_tests_list_file_path is None and not os.path.isabs(included_tests_list_file_path) and not os.path.exists(included_tests_list_file_path):
      included_tests_list_file_path = root_path + os.path.sep + included_tests_list_file_path

    if included_tests_list_file_path is None or not os.path.exists(included_tests_list_file_path):
      self._config.included_tests = []
    else:
      with open(included_tests_list_file_path, 'r', encoding='utf-8') as tests_list_file:
        self._config.included_tests = self._process_path_list(tests_list_file)

    # Report
    self._config.test_report_mode = self._get_option_value(args.test_report_mode, 'test_report_mode')
    self._config.log_file = self._get_option_value(args.log_file, 'log_file')
    self._config.log_mode = self._get_option_value(args.log_mode, 'log_mode')
    self._config.log_no_color = self._get_option_value(args.log_no_color, 'log_no_color')
    self._config.profile = args.profile
    logging.debug('Config:\n%s\n', self._config)

  def _get_settings_file_path(self) -> str:
    settings_file = None
    if os.path.exists(self._root_path + os.path.sep + 'local-settings.json'):
      settings_file = self._root_path + os.path.sep + 'local-settings.json'
    elif os.path.exists(self._root_path + os.path.sep + 'base-settings.json'):
      settings_file = self._root_path + os.path.sep + 'base-settings.json'
    else:
      logging.debug('No one settings file was found.')
    return settings_file

  def _get_option_value(self, value_from_args, name_in_settings):
    option = None
    if value_from_args is None:
      if not self._settings_from_file is None:
        try:
          option = self._settings_from_file[name_in_settings]
        except KeyError:
          option = None
          logging.error('Value of the %s property couldn\'t found in setting file.', name_in_settings)
    else:
      option = value_from_args
    return option

  def _process_path_list(self, list_file: str) -> list:
    '''Trim comments & transform test path relative to root path'''
    result_list = []
    for test in list_file.read().splitlines():
      if test and not test.startswith('#'):
        test = test.split('#')[0].strip()
        if os.path.isabs(test):
          test = os.path.relpath(test, self._config.tests_root_path)
        if not test.endswith('.cj'):
          test += '*'
        if not test.startswith('*'):
          test = '*' + test
        test = normpath(test)
        result_list.append(test)
    return result_list

  def get_config(self):
    '''Get current configuration'''
    return self._config
