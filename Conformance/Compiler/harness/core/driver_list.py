# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: driver_list.py

Description:
File for importing all drivers & set default drivers
'''

# This disables warnings about unused imports
# pylint: disable=unused-import

# Tests drivers
from drivers.test.base_test import BaseTest
from drivers.test.test import Test

# Runners drivers
from drivers.runner.lang_runner import LangRunner
from drivers.runner.simple_py_runner import SimplePyRunner

DEFAULT_TEST = Test
DEFAULT_RUNNER = LangRunner
