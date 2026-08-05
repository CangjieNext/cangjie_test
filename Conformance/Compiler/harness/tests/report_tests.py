#!/usr/bin/env python3
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''Unit tests for report sorting and filtering.'''

import json
import os
import sys
import tempfile
import unittest
from unittest.mock import patch

import report


class ReportTests(unittest.TestCase):
  '''Tests for report command-line field mappings.'''

  def _create_reporter(self, *args):
    data = [
        {
            'tests_root_path': '.',
            'cjc_version': 'test',
        },
        {'metadata': 'header'},
        {
            'name': 'slow',
            'test_path': 'slow.cj',
            'timeout_factor': 2.0,
            'result': 'PASSED',
        },
        {
            'name': 'fast',
            'test_path': 'fast.cj',
            'timeout_factor': 1.0,
            'result': 'PASSED',
        },
        {'total_time': 3.0},
    ]
    metadata = tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False)
    self.addCleanup(lambda: os.unlink(metadata.name))
    with metadata:
      json.dump(data, metadata)

    argv = ['report.py', '--data-file', metadata.name, *args]
    with patch.object(sys, 'argv', argv):
      return report.Reporter()

  @patch('report.process_assertions', return_value=[])
  @patch('report.PlainTextReporter')
  def test_sort_by_timeout_uses_serialized_field(self, plain_reporter, _process_assertions):
    reporter = self._create_reporter('--sort-by', 'timeout')

    reporter.create_report()

    self.assertEqual(reporter.sort_by, 'timeout_factor')
    report_args = plain_reporter.call_args[0]
    self.assertEqual([item['name'] for item in report_args[2]], ['fast', 'slow'])

  @patch('report.process_assertions', return_value=[])
  @patch('report.PlainTextReporter')
  def test_filter_by_timeout_uses_serialized_field(self, plain_reporter, _process_assertions):
    reporter = self._create_reporter('--filter-by', 'timeout', '--filter-pattern', '2')

    reporter.create_report()

    self.assertEqual(reporter.filter_by, 'timeout_factor')
    report_args = plain_reporter.call_args[0]
    self.assertEqual([item['name'] for item in report_args[2]], ['slow'])


if __name__ == '__main__':
  unittest.main()
