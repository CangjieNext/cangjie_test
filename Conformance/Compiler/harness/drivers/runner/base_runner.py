# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: base_runner.py

Description:
Implemented base class for runners
'''

from abc import ABC, abstractmethod

from drivers.test.base_test import BaseTest
from core.config import Config


class BaseRunner(ABC):
  '''
  Compilation & execution tests

  Abstract class
  '''

  def __init__(self, cfg: Config):
    self.cfg = cfg

  @abstractmethod
  def do_compile(self, test: BaseTest) -> BaseTest:
    '''
    Test compilation method

    Expected to be overriden to set compilation log to test.compile_log & set binary path to test.binary_path

    Args:
      test: Test for compilation

    Returns:
      Returning a modified test
    '''
    pass

  @abstractmethod
  def do_execute(self, test: BaseTest) -> BaseTest:
    '''
    Test run method

    Expected to be overriden to set execution log to test.execute_log

    Args:
      test: Test for execution

    Returns:
      Returning a modified test
    '''
    pass

  def prepare_default_libraries(self) -> str:
    '''
    Compile default libraries

    Return:
      Will be return log of compilation or None
    '''
    return None
