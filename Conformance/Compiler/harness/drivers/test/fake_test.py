# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: fake_test.py

Description:
Implemented class for faked tests
Test class without checks in the property setters
'''

from os import path
from drivers.test.base_test import BaseTest, TestResult, TestRunMode


class FakeTest(BaseTest):
  '''Implemented class for faked tests'''

  def __init__(self, test_path: str) -> None:  # pylint: disable=super-init-not-called
    # Instance attributes
    self._test_path = None
    self._name = None
    self._assertion = None
    self._description = None
    self._mode = None
    self._is_negative = None
    self._compile_warning = None
    self._is_replayed = None
    self._timeout_factor = None
    self._comment = None
    self._compile_log = ''
    self._execute_log = ''
    self._binary_path = None
    self._result = None
    self._compile_time = None
    self._execute_time = None
    self._issue = None

    # Property
    self.test_path = test_path

  def to_dict(self) -> dict:
    '''Convert FakeTest to dictionary'''
    result = {
        'name': self.name,
        'test_path': self.test_path,
        'assertion': self.assertion,
        'description': self.description,
        'mode': self.mode,
        'is_negative': self.is_negative,
        'compile_warning': self.compile_warning,
        'is_replayed': self.is_replayed,
        'timeout_factor': self.timeout_factor,
        'comment': self.comment,
        'compile_log': self.compile_log,
        'execute_log': self.execute_log,
        'binary_path': self.binary_path,
        'result': self.result,
        'compile_time': self.compile_time,
        'execute_time': self.execute_time,
        'issue': self.issue
    }
    return result

  @property
  def test_path(self) -> str:
    '''Path to the test file'''
    return self._test_path

  @test_path.setter
  def test_path(self, value: str) -> None:
    self._test_path = value

  @property
  def name(self) -> str:
    '''Test name'''
    if self._name is None:
      default_test_name = '.'.join(path.basename(self.test_path).split('.')[:-1])
      self.name = default_test_name
    return self._name

  @name.setter
  def name(self, value: str) -> None:
    if value is None:
      value = '.'.join(path.basename(self.test_path).split('.')[:-1])
    self._name = value

  @property
  def assertion(self) -> str:
    '''Number and text of the assertion that corresponds to the test'''
    if self._assertion is None:
      self.assertion = self._DEFAULT_ASSERTION
    return self._assertion

  @assertion.setter
  def assertion(self, value: str) -> None:
    if value is None:
      value = self._DEFAULT_ASSERTION
    self._assertion = value

  @property
  def description(self) -> str:
    '''Test case description as part of the assertion'''
    if self._description is None:
      self.description = self._DEFAULT_DESCRIPTION
    return self._description

  @description.setter
  def description(self, value: str) -> None:
    if value is None:
      value = self._DEFAULT_DESCRIPTION
    self._description = value

  @property
  def mode(self) -> TestRunMode:
    '''Mode of test execution. Usually mixed'''
    if self._mode is None:
      self.mode = self._DEFAULT_MODE
    return TestRunMode(self._mode)

  @mode.setter
  def mode(self, value: any) -> None:
    if value is None:
      value = self._DEFAULT_MODE
    self._mode = value

  @property
  def is_negative(self) -> bool:
    '''Whether a test case is negative. Usually false'''
    if self._is_negative is None:
      self.is_negative = self._DEFAULT_NEGATIVE
    return bool(self._is_negative)

  @is_negative.setter
  def is_negative(self, value: any) -> None:
    if value is None:
      value = self._DEFAULT_NEGATIVE
    self._is_negative = value

  @property
  def compile_warning(self) -> bool:
    '''Whether a test case is replayed. Usually false'''
    if self._compile_warning is None:
      self.compile_warning = self._DEFAULT_COMPILE_WARNING
    return bool(self._compile_warning)

  @compile_warning.setter
  def compile_warning(self, value: bool) -> None:
    if value is None:
      value = self._DEFAULT_COMPILE_WARNING
    self._compile_warning = value

  @property
  def is_replayed(self) -> bool:
    '''Whether a test case is replayed. Usually false'''
    if self._is_replayed is None:
      self.is_replayed = self._DEFAULT_REPLAYED
    return bool(self._is_replayed)

  @is_replayed.setter
  def is_replayed(self, value: bool) -> None:
    if value is None:
      value = self._DEFAULT_REPLAYED
    self._is_replayed = value

  @property
  def timeout_factor(self) -> float:
    '''Optional test timeout factor, Usually 1.0'''
    if self._timeout_factor is None:
      self.timeout_factor = self._DEFAULT_TIMEOUT_FACTOR
    return self._timeout_factor

  @timeout_factor.setter
  def timeout_factor(self, value: any) -> None:
    if value is None:
      value = self._DEFAULT_TIMEOUT_FACTOR
    self._timeout_factor = value

  @property
  def comment(self) -> str:
    '''Optional comment'''
    if self._comment is None:
      self.comment = self._DEFAULT_COMMENT
    return self._comment

  @comment.setter
  def comment(self, value: str) -> None:
    if value is None:
      value = self._DEFAULT_COMMENT
    self._comment = value

  @property
  def compile_log(self) -> str:
    '''Compile completedProcess'''
    return self._compile_log

  @compile_log.setter
  def compile_log(self, value: str) -> None:
    self._compile_log = value

  @property
  def execute_log(self) -> str:
    '''Execute completedProcess'''
    return self._execute_log

  @execute_log.setter
  def execute_log(self, value: str) -> None:
    self._execute_log = value

  @property
  def binary_path(self) -> str:
    '''Path to the test binary file'''
    if self._binary_path is None:
      self.binary_path = self._DEFAULT_BIN_PATH
    return self._binary_path

  @binary_path.setter
  def binary_path(self, value: str) -> None:
    if value is None:
      value = self._DEFAULT_BIN_PATH
    self._binary_path = value

  @property
  def result(self) -> TestResult:
    '''Test result'''
    if self._result is None:
      self._result = self._DEFAULT_RESULT
    return self._result

  @result.setter
  def result(self, value: any) -> None:
    self._result = value

  @property
  def compile_time(self) -> float:
    '''The compile time'''
    if self._compile_time is None:
      self.compile_time = self._DEFAULT_COMPILE_TIME
    return self._compile_time

  @compile_time.setter
  def compile_time(self, value: float) -> None:
    if value is None:
      value = self._DEFAULT_COMPILE_TIME
    self._compile_time = value

  @property
  def execute_time(self) -> float:
    '''The compile time'''
    if self._execute_time is None:
      self.execute_time = self._DEFAULT_EXECUTE_TIME
    return self._execute_time

  @execute_time.setter
  def execute_time(self, value: float) -> None:
    if value is None:
      value = self._DEFAULT_EXECUTE_TIME
    self._execute_time = value

  @property
  def issue(self) -> str:
    '''Issue number (optional)'''
    if self._issue is None:
      self.issue = self._DEFAULT_ISSUE
    return self._issue

  @issue.setter
  def issue(self, value: str) -> None:
    if value is None:
      value = self._DEFAULT_ISSUE
    self._issue = value
