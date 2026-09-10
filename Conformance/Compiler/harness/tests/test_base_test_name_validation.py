# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

"""Unit tests for BaseTest.name illegal-character validation."""
import logging
import unittest
from unittest import mock

from drivers.test.base_test import BaseTest


class BaseTestNameValidationTests(unittest.TestCase):
  """@Name must reject illegal path characters at any position."""

  def setUp(self) -> None:
    self.test = BaseTest.__new__(BaseTest)
    self.test._name = None
    self.test._test_path = '/tmp/dummy.cj'
    self.test._logger = logging.getLogger('BaseTestNameValidationTests')
    return super().setUp()

  def test_name_rejects_illegal_char_not_only_prefix(self) -> None:
    for bad in (':lead', 'lead:', 'foo:bar', 'a/b', 'a\\b', 'x*y', 'a?b'):
      with self.subTest(bad=bad):
        self.test._name = None
        with mock.patch.object(self.test._logger, 'error') as err:
          BaseTest.name.fset(self.test, bad)
        self.assertIsNone(self.test._name)
        err.assert_called()

  def test_name_accepts_safe_value(self) -> None:
    BaseTest.name.fset(self.test, 'ok_name-1.2')
    self.assertEqual(self.test._name, 'ok_name-1.2')


if __name__ == '__main__':
  unittest.main()
