# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: html_diff.py

Description:
Runs diff of two test reports in HTML format
'''

import json
import logging
from os.path import abspath, dirname, join

class HTMLDiff:
  '''Class HTMLDiff for creating diff in html format'''

  def __init__(self, stats: dict, tests_added: list, tests_removed: list, diff_logs: list, write_line: callable, debug = False):
    self._logger = logging.getLogger(__name__)
    self._html_template = join(dirname(abspath(__file__)), 'diff_template', 'diff_template.html')
    if debug:
      self._stats = json.dumps(stats, indent=2)
      self._tests_added = json.dumps(list(tests_added), indent=2)
      self._tests_removed = json.dumps(list(tests_removed), indent=2)
      self._diff_logs = json.dumps(diff_logs, indent=2)
    else:
      self._stats = json.dumps(stats)
      self._tests_added = json.dumps(tests_added)
      self._tests_removed = json.dumps(tests_removed)
      self._diff_logs = json.dumps(diff_logs)
    self._write_line = write_line

  def create_report(self):
    '''Create testing report'''
    # get html template and replace placeholder by metadata
    template = None
    with open(self._html_template, 'r', encoding='utf-8') as read_file:
      template = read_file.read()
    template = template.replace('PLACEHOLDER_FOR_STATS', self._stats)
    template = template.replace('PLACEHOLDER_TESTS_ADDED', self._tests_added)
    template = template.replace('PLACEHOLDER_TESTS_REMOVED', self._tests_removed)
    result = template.replace('PLACEHOLDER_LOGS_DIFF', self._diff_logs)
    self._write_line(result)
