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
import tempfile
import time
from pathlib import Path

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

  def test_cross_decode(self):
    '''Checking cross_decode with supported encodings and empty output'''
    self.assertEqual(utils.cross_decode(None), '')
    self.assertEqual(utils.cross_decode('仓颉'.encode('utf-8')), '仓颉')
    self.assertEqual(utils.cross_decode('тест'.encode('cp866')), 'тест')

  def test_clear_message(self):
    '''Checking ANSI color sequences are removed from messages'''
    message = f'{utils.PT_BOLD_RED}failed{utils.PT_END_COLORING}: details'
    self.assertEqual(utils.clear_message(message), 'failed: details')

  def test_find_files_by_creation_date(self):
    '''Checking files are filtered by mask and sorted by modification time'''
    with tempfile.TemporaryDirectory() as directory:
      newest_file = Path(directory, 'newest.log')
      oldest_file = Path(directory, 'oldest.log')
      ignored_file = Path(directory, 'ignored.txt')

      for file_path in [newest_file, oldest_file, ignored_file]:
        file_path.touch()

      now = time.time()
      os.utime(oldest_file, (now - 100, now - 100))
      os.utime(newest_file, (now - 10, now - 10))

      self.assertEqual(
        utils.find_files_by_creation_date(directory, '*.log'),
        [str(oldest_file), str(newest_file)]
      )
      self.assertEqual(utils.find_files_by_creation_date(directory, '*.json'), [])

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
