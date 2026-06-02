# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: test.py

Description:
Implemented class for test
'''

import enum
from os import path
from inspect import getouterframes, currentframe
from subprocess import CompletedProcess

from drivers.test.base_test import BaseTest, TestResult, TestRunMode, WarningExpect
from utils.utils import convert_res_to_log, cross_decode, clear_message


class Structure(str, enum.Enum):
  '''Test structure enum'''
  single = 'single'
  complexMain = 'complex-main'
  complexAux = 'complex-aux'


class Test(BaseTest):
  '''Implemented class for test'''
  __test__ = False
  _DEFAULT_STRUCTURE = Structure.single
  _DEFAULT_DEPENDENCIES = []
  _DEFAULT_MODULE = 'default'
  _DEFAULT_PACKAGE = ''
  _DEFAULT_IS_MACRO_LIB = False
  _DEFAULT_IS_AUTODIFF = False

  def __init__(self, test_path: str) -> None:
    super().__init__(test_path)

    # Instance attributes
    self._compile_res = None
    self._execute_res = None
    self._struct = None
    self._dependencies = None
    self._module = None
    self._package = None
    self._is_macro_lib = None
    self._is_auto_diff = None

    if not super().is_valid():
      return

    self.is_macro_lib = self._has_attribute('macrolib')
    self.is_auto_diff = self._has_attribute('autodiff')
    self.struct = self._get_attribute('structure')
    if self.struct != Structure.single:
      self.module = self._get_attribute('module')
      self.package = self._get_package()
      self.dependencies = self._get_dependencies()
    del self._source

  def _get_dependencies(self) -> list:
    dependencies = []
    field = self._get_attribute('dependencies')
    if not field:
      return dependencies

    # Check that the depth is sufficient
    if len(getouterframes(currentframe())) > 200:
      raise RecursionError(f'The recursive depth limit of the {self.name} test was violated. The test is skipped.')

    for aux_file in field.split():
      aux_test = Test(path.join(path.dirname(self.test_path), aux_file))
      if aux_test.is_valid():
        dependencies.append(aux_test)
      else:
        error_message = f'The auxiliary test file {aux_file} is not valid for {self.test_path} test'
        self._logger.error(error_message)
        self._compile_log += f'{error_message}\n'
        self.is_valid = lambda: False
    return dependencies

  def _get_package(self) -> str:
    in_comments = 0
    package_indent = 'package ' if not self.is_macro_lib else 'macro package '
    for line in self._source:
      line = line.strip()
      if line.lower().startswith('/*'):
        in_comments += 1
      elif line.lower().startswith('*/') or line.lower().endswith('*/'):
        in_comments -= 1
      elif line.lower().startswith(package_indent) and not in_comments:
        return line[len(package_indent):].strip()

  def is_valid(self) -> bool:
    '''Validate test'''
    if not super().is_valid():
      return False
    if not isinstance(self.struct, Structure):
      return False
    return True

  def to_dict(self) -> dict:
    '''Convert Test to dictionary'''
    result = super().to_dict()
    result.update({
        'macrolib': self._is_macro_lib,
        'autodiff': self._is_auto_diff,
        'structure': self._struct,
        'dependencies': None if self._dependencies is None or len(self._dependencies) == 0 else
        [x.test_path for x in self._dependencies],
        'package': self._package,
    })
    return result

  def __str__(self):
    return str(self.to_dict())

  @property
  def compile_res(self) -> CompletedProcess:
    '''Compile completedProcess'''
    return self._compile_res

  @compile_res.setter
  def compile_res(self, value: CompletedProcess) -> None:
    if self._compile_res is None:
      self._compile_res = value
      self._log_debug_property_value('compile_res', self._compile_res)
      if isinstance(self._compile_res, CompletedProcess):
        # Fill compile_log
        self.compile_log += convert_res_to_log(self.name, self._compile_res)
        self.result = convert_compile_res_to_test_res(self, self._compile_res)
    else:
      self._log_error_about_second_set_value('compile_res')

  @property
  def execute_res(self) -> CompletedProcess:
    '''Execute completedProcess'''
    return self._execute_res

  @execute_res.setter
  def execute_res(self, value: CompletedProcess) -> None:
    if self._execute_res is None:
      self._execute_res = value
      self._log_debug_property_value('execute_res', self._execute_res)
      if isinstance(self._execute_res, CompletedProcess):
        # Fill execute_log
        self.execute_log += convert_res_to_log(self.name, self._execute_res, action='run')
        self.result = convert_execute_res_to_test_res(self, self._execute_res)
    else:
      self._log_error_about_second_set_value('execute_res')

  @property
  def struct(self) -> Structure:
    '''One test name can correspond to several files. Usually single'''
    if self._struct is None:
      self._log_debug_about_default_value('struct', self._DEFAULT_STRUCTURE)
      self.struct = self._DEFAULT_STRUCTURE
    return Structure(self._struct)

  @struct.setter
  def struct(self, value: any) -> None:
    if value is None:
      self._log_debug_about_default_value('struct', self._DEFAULT_STRUCTURE)
      value = self._DEFAULT_STRUCTURE
    if self._struct is None:
      if isinstance(value, str):
        try:
          self._struct = Structure(value.lower())
        except ValueError:
          self._logger.error('Incorrect value `%s` of @Structure attribute in test `%s`', value, self._name)
      elif isinstance(value, Structure):
        self._struct = value
      else:
        self._logger.error('Incorrect value `%s` of @Structure attribute in test `%s`', value, self._name)
      self._log_debug_property_value('struct', self._struct)
    else:
      self._log_error_about_second_set_value('struct')

  @property
  def dependencies(self) -> list:
    '''Unique test dependencies from the @Dependencies tag'''
    if self._dependencies is None:
      self._log_debug_about_default_value('dependencies', self._DEFAULT_DEPENDENCIES)
      self.dependencies = self._DEFAULT_DEPENDENCIES
    return self._dependencies

  @dependencies.setter
  def dependencies(self, value: list) -> None:
    if value is None:
      self._log_debug_about_default_value('dependencies', self._DEFAULT_DEPENDENCIES)
      value = self._DEFAULT_DEPENDENCIES
    if self._dependencies is None:
      self._dependencies = value
      self._log_debug_property_value('dependencies', self._dependencies)
    else:
      self._log_error_about_second_set_value('dependencies')

  @property
  def module(self) -> str:
    '''The test source module'''
    if self._module is None:
      self._log_debug_about_default_value('module', self._DEFAULT_MODULE)
      self.module = self._DEFAULT_MODULE
    return self._module

  @module.setter
  def module(self, value: str) -> None:
    if value is None:
      self._log_debug_about_default_value('module', self._DEFAULT_MODULE)
      value = self._DEFAULT_MODULE
    if self._module is None:
      self._module = value
      self._log_debug_property_value('module', self._module)
    else:
      self._log_error_about_second_set_value('module')

  @property
  def package(self) -> str:
    '''The test source package'''
    if self._package is None:
      self._log_debug_about_default_value('package', self._DEFAULT_PACKAGE)
      self.package = self._DEFAULT_PACKAGE
    return self._package

  @package.setter
  def package(self, value: str) -> None:
    if value is None:
      self._log_debug_about_default_value('package', self._DEFAULT_PACKAGE)
      value = self._DEFAULT_PACKAGE
    if self._package is None:
      self._package = value
      self._log_debug_property_value('package', self._package)
    else:
      self._log_error_about_second_set_value('package')

  @property
  def is_macro_lib(self) -> bool:
    '''The test macro flag'''
    if self._is_macro_lib is None:
      self._log_debug_about_default_value('is_macro_lib', self._DEFAULT_IS_MACRO_LIB)
      self.is_macro_lib = self._DEFAULT_IS_MACRO_LIB
    return bool(self._is_macro_lib)

  @is_macro_lib.setter
  def is_macro_lib(self, value: bool) -> None:
    if value is None:
      self._log_debug_about_default_value('is_macro_lib', self._DEFAULT_IS_MACRO_LIB)
      value = self._DEFAULT_IS_MACRO_LIB
    if self._is_macro_lib is None:
      self._is_macro_lib = bool(value)
      self._log_debug_property_value('is_macro_lib', self._is_macro_lib)
    else:
      self._log_error_about_second_set_value('is_macro_lib')


  @property
  def is_auto_diff(self) -> bool:
    '''The test macro flag'''
    if self._is_auto_diff is None:
      self._log_debug_about_default_value('is_auto_diff', self._DEFAULT_IS_AUTODIFF)
      self.is_auto_diff = self._DEFAULT_IS_AUTODIFF
    return bool(self._is_auto_diff)

  @is_auto_diff.setter
  def is_auto_diff(self, value: bool) -> None:
    if value is None:
      self._log_debug_about_default_value('is_auto_diff', self._DEFAULT_IS_AUTODIFF)
      value = self._DEFAULT_IS_AUTODIFF
    if self._is_auto_diff is None:
      self._is_auto_diff = bool(value)
      self._log_debug_property_value('is_auto_diff', self._is_auto_diff)
    else:
      self._log_error_about_second_set_value('is_auto_diff')


def convert_compile_res_to_test_res(test: BaseTest, proc: CompletedProcess) -> TestResult:
  '''Convert results of compile process(CompletedProcess) to TestResult'''
  if test.ICE_MSG in clear_message(cross_decode(proc.stdout)).lower() or test.ICE_MSG in clear_message(cross_decode(proc.stderr)).lower():
    return TestResult.ERRORED

  if test.WARNING_MSG in clear_message(cross_decode(proc.stdout)).lower() or test.WARNING_MSG in clear_message(cross_decode(proc.stderr)).lower():
    if test.compile_warning == WarningExpect.NO:
      return TestResult.FAILED
  elif test.compile_warning == WarningExpect.YES:
    return TestResult.FAILED

  if test.TIMEOUT_MSG in clear_message(cross_decode(proc.stdout)).lower() or test.TIMEOUT_MSG in clear_message(cross_decode(proc.stderr)).lower():
    if not test.expect_timeout or test.mode == TestRunMode.run:
      return TestResult.ERRORED
    else:
      return TestResult.PASSED

  if proc.returncode == 0:
    if test.mode == TestRunMode.run:
      return TestResult.INCOMPLETE
    elif test.is_negative:
      return TestResult.FAILED
    else:
      return TestResult.PASSED
  elif proc.returncode == 1:
    if test.mode == TestRunMode.run or not test.is_negative:
      return TestResult.FAILED
    else:
      return TestResult.PASSED
  else:
    return TestResult.ERRORED


def convert_execute_res_to_test_res(test: BaseTest, proc: CompletedProcess) -> TestResult:
  '''Convert results of execute process(CompletedProcess) to TestResult'''
  if test.TIMEOUT_MSG in clear_message(cross_decode(proc.stdout)).lower() or test.TIMEOUT_MSG in clear_message(cross_decode(proc.stderr)).lower():
    if test.expect_timeout:
      return TestResult.PASSED
    else:
      return TestResult.ERRORED
  else:
    if test.expect_timeout:
      return TestResult.FAILED

  if proc.returncode == 0:
    if test.is_negative:
      return TestResult.FAILED
    else:
      return TestResult.PASSED
  elif proc.returncode == 1:
    if test.is_negative:
      return TestResult.PASSED
    else:
      return TestResult.FAILED
  else:
    return TestResult.ERRORED
