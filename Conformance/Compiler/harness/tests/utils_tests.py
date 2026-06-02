# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: utils_tests.py

Description:
Unit tests for utils from core
'''

import unittest
import subprocess
import os

from utils import utils


class UtilsTests(unittest.TestCase):
  '''Tests for harness utils'''
  custom_str_numbers = ['0.2', '5', '0.00000007', 'text']
  custom_command = 'python3 -c "while 1: pass"'

  def test_atof(self):
    '''Checking the atof function on a custom string list'''
    value = [utils.atof(c) for c in self.custom_str_numbers]
    self.assertEqual(value, [0.2, 5, 0.00000007, 'text'])

  def test_natural_keys(self):
    '''Checking the natural_keys function on a custom string list'''
    value = self.custom_str_numbers
    value.sort(key=utils.natural_keys)
    self.assertEqual(value, ['0.00000007', '0.2', '5', 'text'])

  def test_kill_processes(self):
    '''Checking the kill_processes function on a custom processes'''
    with subprocess.Popen(self.custom_command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, start_new_session=True) as process:
      try:
        process.communicate(None, timeout=0.5)
      except subprocess.TimeoutExpired:
        utils.kill_processes(process.pid)
      if os.name == 'nt':
        self.assertEqual(os.system(f'tasklist | findstr /i {process.pid}'), True)
      else:
        self.assertEqual(os.system(f'ps -p {process.pid} | grep defunct >/dev/null'), False)
