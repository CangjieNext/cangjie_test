# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: config.py

Description:
Configuration class for Harness
'''
import enum
import logging
import subprocess

from os import makedirs, path, getcwd
from utils.utils import cross_decode, convert_res_to_log, normpath


class RunMode(str, enum.Enum):
  '''Harness run mode enum'''
  mixed = 'mixed'
  compilationOnly = 'compile'
  executionOnly = 'execute'


class ReportMode(str, enum.Enum):
  '''Reporting results mode enum'''
  plain = 'plain'
  html = 'html'
  junit = 'junit'


class VerbosityLevel(str, enum.Enum):
  '''Logging verbosity level'''
  PROGRESS = 'progress'
  SHORT = 'short'
  DETAILED = 'detailed'
  VERBOSE = 'verbose'


class Config:
  '''Configuration for harness'''
  _DEFAULT_WORK_DIRECTORY = 'work'
  # this is a path relative to the working directory
  _DEFAULT_BINARY_OUTPUT_PATH = 'bin'
  # this is a path relative to the working directory
  _DEFAULT_TEST_RUN_OUTPUT_PATH = 'test_res'
  _DEFAULT_CJ = 'cj'
  _DEFAULT_CJC = 'cjc'
  _DEFAULT_CC = 'clang'
  _DEFAULT_CXX = 'clang++'
  _DEFAULT_JAVA = 'java'
  _DEFAULT_JAVAC = 'javac'
  _DEFAULT_TEST_ROOT_PATH = '../test_suite'
  # this is a paths relative to the tests root directory
  _DEFAULT_TESTS = []
  _DEFAULT_LEVEL=''
  _DEFAULT_REPLAY = False

  _DEFAULT_RUN_MODE = RunMode.mixed
  _DEFAULT_CJ_FLAGS = ''
  _DEFAULT_CJC_FLAGS = ''
  _DEFAULT_CC_FLAGS = ''
  _DEFAULT_CXX_FLAGS = ''
  _DEFAULT_JAVA_FLAGS = ''
  _DEFAULT_JAVAC_FLAGS = ''
  _DEFAULT_COMPILATION_THREADS = 4
  _DEFAULT_EXECUTION_THREADS = 4
  _DEFAULT_BASE_TIMEOUT = 30
  _DEFAULT_IS_JET = False
  _DEFAULT_FILTERS = []
  _DEFAULT_EXCLUDED_TESTS = []
  _DEFAULT_INCLUDED_TESTS = []

  _DEFAULT_REPORT_MODE = ReportMode.plain
  # this is a path relative to the working directory
  _DEFAULT_LOG_FILE = 'results.log'
  _DEFAULT_LOG_MODE = VerbosityLevel.DETAILED
  _DEFAULT_LOG_NO_COLOR = False
  _DEFAULT_PROFILE = False

  def __init__(self) -> None:
    # General
    self._work_directory = None
    self._binary_output_path = None
    self._test_run_output_path = None
    self._cj = None
    self._cjc = None
    self._cc = None
    self._cxx = None
    self._java = None
    self._javac = None
    self._tests_root_path = None
    self._tests = None
    self._level = None
    self._replay = None
    # Execution
    self._run_mode = None
    self._cj_flags = None
    self._cjc_flags = None
    self._cc_flags = None
    self._cxx_flags = None
    self._java_flags = None
    self._javac_flags = None
    self._compilation_threads = None
    self._execution_threads = None
    self._base_timeout = None
    self._is_jet = None
    self._filters = None
    self._excluded_tests = None
    self._included_tests = None
    # Report
    self._test_report_mode = None
    self._log_file = None
    self._log_mode = None
    self._log_no_color = None
    self._profile = None
    # Meta info
    self._cj_version = None
    self._cjc_version = None
    self._cc_version = None
    self._cxx_version = None
    self._java_version = None
    self._javac_version = None

  @property
  def _logger(self):
    return logging.getLogger(__name__)

  def _log_info_about_default_value(self, prop_name: str, default_value: any) -> None:
    self._logger.info('The %s property wasn\'t set. Use the default value: %s', prop_name, default_value)

  def _log_debug_property_value(self, prop_name: str, value: any) -> None:
    self._logger.debug('The %s property is: %s', prop_name, value)

  def _log_error_about_second_set_value(self, prop_name: str) -> None:
    self._logger.error('Value of the %s property couldn\'t set a second time.', prop_name)

  def to_dict(self):
    '''Convert Config class to dictionary'''
    config_dict = {
        'work_directory': self._work_directory,
        'binary_output_path': self._binary_output_path,
        'test_run_output_path': self._test_run_output_path,
        'cj': self._cj,
        'cjc': self._cjc,
        'cc': self._cc,
        'cxx': self._cxx,
        'java': self._java,
        'javac': self._javac,
        'tests_root_path': self._tests_root_path,
        'tests': self._tests,
        'level': self._level,
        'run_mode': self._run_mode,
        'cj_flags': self._cj_flags,
        'cjc_flags': self._cjc_flags,
        'cc_flags': self._cc_flags,
        'cxx_flags': self._cxx_flags,
        'java_flags': self._java_flags,
        'javac_flags': self._javac_flags,
        'compilation_threads': self._compilation_threads,
        'execution_threads': self._execution_threads,
        'base_timeout': self._base_timeout,
        'is_jet': self._is_jet,
        'filters': self._filters,
        'replay': self._replay,
        'excluded_tests': self._excluded_tests,
        'included_tests': self._included_tests,
        'test_report_mode': self._test_report_mode,
        'log_file': self._log_file,
        'log_mode': self._log_mode,
        'log_no_color': self._log_no_color,
        'profile': self._profile,
        'cj_version': self._cj_version,
        'cjc_version': self._cjc_version,
        'cc_version': self._cc_version,
        'cxx_version': self._cxx_version,
        'java_version': self._java_version,
        'javac_version': self._javac_version
    }
    return config_dict

  def __str__(self):
    return str(self.to_dict())

  @property
  def work_directory(self) -> str:
    '''Working directory. Usually ./work/'''
    if self._work_directory is None:
      self._log_info_about_default_value('working_directory', self._DEFAULT_WORK_DIRECTORY)
      self.work_directory = self._DEFAULT_WORK_DIRECTORY
    return self._work_directory

  @work_directory.setter
  def work_directory(self, value: str) -> None:
    if value is None:
      self._log_info_about_default_value('working_directory', self._DEFAULT_WORK_DIRECTORY)
      value = self._DEFAULT_WORK_DIRECTORY
    if self._work_directory is None:
      abs_path = path.abspath(path.expanduser(value))
      if not path.isdir(abs_path):
        makedirs(abs_path)
        self._logger.debug('Create work directory: %s', abs_path)
      self._work_directory = abs_path
      self._log_debug_property_value('working_directory', self._work_directory)
    else:
      self._log_error_about_second_set_value('working_directory')

  @property
  def binary_output_path(self) -> str:
    '''Path for output binaries. Usually ./work/bin/'''
    if self._binary_output_path is None:
      self._log_info_about_default_value('binary_output_path', path.join(self.work_directory, self._DEFAULT_BINARY_OUTPUT_PATH))
      self.binary_output_path = path.join(self.work_directory, self._DEFAULT_BINARY_OUTPUT_PATH)
    return self._binary_output_path

  @binary_output_path.setter
  def binary_output_path(self, value: str) -> None:
    if value is None:
      self._log_info_about_default_value('binary_output_path', path.join(self.work_directory, self._DEFAULT_BINARY_OUTPUT_PATH))
      value = path.join(self.work_directory, self._DEFAULT_BINARY_OUTPUT_PATH)
    if self._binary_output_path is None:
      abs_path = None
      value = normpath(value)
      if not path.isabs(value):
        abs_path = path.join(self.work_directory, value)
      else:
        abs_path = value
      if not path.isdir(abs_path):
        makedirs(abs_path)
        self._logger.debug('Create binary output directory: %s', abs_path)
      self._binary_output_path = abs_path
      self._log_debug_property_value('binary_output_path', self._binary_output_path)
    else:
      self._log_error_about_second_set_value('binary_output_path')

  @property
  def test_run_output_path(self) -> str:
    '''Test's artifacts path. Usually ./work/test_res/'''
    if self._test_run_output_path is None:
      self._log_info_about_default_value('test_run_output_path', path.join(self.work_directory, self._DEFAULT_TEST_RUN_OUTPUT_PATH))
      self.test_run_output_path = path.join(self.work_directory, self._DEFAULT_TEST_RUN_OUTPUT_PATH)
    return self._test_run_output_path

  @test_run_output_path.setter
  def test_run_output_path(self, value: str) -> None:
    if value is None:
      self._log_info_about_default_value('test_run_output_path', path.join(self.work_directory, self._DEFAULT_TEST_RUN_OUTPUT_PATH))
      value = path.join(self.work_directory, self._DEFAULT_TEST_RUN_OUTPUT_PATH)
    if self._test_run_output_path is None:
      abs_path = None
      value = normpath(value)
      if not path.isabs(value):
        abs_path = path.join(self.work_directory, value)
      else:
        abs_path = value
      if not path.isdir(abs_path):
        makedirs(abs_path)
        self._logger.debug('Create test run output directory: %s', abs_path)
      self._test_run_output_path = abs_path
      self._log_debug_property_value('test_run_output_path', self._test_run_output_path)
    else:
      self._log_error_about_second_set_value('test_run_output_path')

  @property
  def cj(self) -> str:
    '''Cangjie VM executable path'''
    if self._cj is None:
      self._log_info_about_default_value('cj', self._DEFAULT_CJ)
      self.cj = self._DEFAULT_CJ
    return self._cj

  @cj.setter
  def cj(self, value: str) -> None:
    if value is None:
      self._log_info_about_default_value('cj', self._DEFAULT_CJ)
      value = self._DEFAULT_CJ
    if self._cj is None:
      self._cj = value
      self._log_debug_property_value('cj', self._cj)
      # not supported yet
      # version_res = subprocess.run(self._cj + ' --version', shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, check=False)
      # if version_res.returncode == 0:
      #   self._cj_version = cross_decode(version_res.stdout).splitlines()[0] if (version_res.stdout is not None) else 'Undefined'
      #   self._logger.debug('cj cm version: %s', self._cj_version)
      # else:
      #   raise ValueError(f'Failed to determine cj vm version:\n{convert_res_to_log("cj", version_res, action="check version")}')
    else:
      self._log_error_about_second_set_value('cj')

  @property
  def cjc(self) -> str:
    '''Cangjie compiler executable path'''
    if self._cjc is None:
      self._log_info_about_default_value('cjc', self._DEFAULT_CJC)
      self.cjc = self._DEFAULT_CJC
    return self._cjc

  @cjc.setter
  def cjc(self, value: str) -> None:
    if value is None:
      self._log_info_about_default_value('cjc', self._DEFAULT_CJC)
      value = self._DEFAULT_CJC
    if self._cjc is None:
      self._cjc = value
      self._log_debug_property_value('cjc', self._cjc)
      version_res = subprocess.run(self._cjc + ' --version', shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, check=False)
      if version_res.returncode == 0:
        self._cjc_version = cross_decode(version_res.stdout).splitlines()[0] if (version_res.stdout is not None) else 'Undefined'
        self._logger.debug('cjc compiler version: %s', self._cjc_version)
      else:
        raise ValueError(f'Failed to determine cjc compiler version:\n{convert_res_to_log("cjc", version_res, action="check version")}')
    else:
      self._log_error_about_second_set_value('cjc')

  @property
  def cc(self) -> str:
    '''C compiler executable path'''
    if self._cc is None:
      self._log_info_about_default_value('cc', self._DEFAULT_CC)
      self.cc = self._DEFAULT_CC
    return self._cc

  @cc.setter
  def cc(self, value: str) -> None:
    if value is None:
      self._log_info_about_default_value('cc', self._DEFAULT_CC)
      value = self._DEFAULT_CC
    if self._cc is None:
      self._cc = value
      self._log_debug_property_value('cc', self._cc)
      version_res = subprocess.run(self._cc + ' --version', shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, check=False)
      if version_res.returncode == 0:
        self._cc_version = cross_decode(version_res.stdout).splitlines()[0] if (version_res.stdout is not None) else 'Undefined'
        self._logger.debug('C compiler version: %s', self._cc_version)
      else:
        self._cc_version = f'\"{self._cc} --version\" failed to run'
    else:
      self._log_error_about_second_set_value('cc')

  @property
  def cxx(self) -> str:
    '''C++ compiler executable path'''
    if self._cxx is None:
      self._log_info_about_default_value('cxx compiler', self._DEFAULT_CXX)
      self.cxx = self._DEFAULT_CXX
    return self._cxx

  @cxx.setter
  def cxx(self, value: str) -> None:
    if value is None:
      self._log_info_about_default_value('cxx compiler', self._DEFAULT_CXX)
      value = self._DEFAULT_CXX
    if self._cxx is None:
      self._cxx = value
      self._log_debug_property_value('cxx compiler', self._cxx)
      version_res = subprocess.run(self._cxx + ' --version', shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, check=False)
      if version_res.returncode == 0:
        self._cxx_version = cross_decode(version_res.stdout).splitlines()[0] if (version_res.stdout is not None) else 'Undefined'
        self._logger.debug('C++ compiler version: %s', self._cxx_version)
      else:
        self._cxx_version = f'\"{self._cxx} --version\" failed to run'
    else:
      self._log_error_about_second_set_value('cxx compiler')

  @property
  def java(self) -> str:
    '''Java VM executable path'''
    if self._java is None:
      self._log_info_about_default_value('java vm', self._DEFAULT_JAVA)
      self.java = self._DEFAULT_JAVA
    return self._java

  @java.setter
  def java(self, value: str) -> None:
    if value is None:
      self._log_info_about_default_value('java vm', self._DEFAULT_JAVA)
      value = self._DEFAULT_JAVA
    if self._java is None:
      self._java = value
      self._log_debug_property_value('java vm', self._java)
      version_res = subprocess.run(self._java + ' -version', shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, check=False)
      if version_res.returncode == 0:
        self._java_version = cross_decode(version_res.stdout).splitlines()[0] if (version_res.stdout is not None) else 'Undefined'
        self._logger.debug('Java VM version: %s', self._java_version)
      else:
        self._java_version = f'\"{self._java} -version\" failed to run'
    else:
      self._log_error_about_second_set_value('java vm')

  @property
  def javac(self) -> str:
    '''Javac compiler executable path'''
    if self._javac is None:
      self._log_info_about_default_value('javac compiler', self._DEFAULT_JAVAC)
      self.javac = self._DEFAULT_JAVAC
    return self._javac

  @javac.setter
  def javac(self, value: str) -> None:
    if value is None:
      self._log_info_about_default_value('javac compiler', self._DEFAULT_JAVAC)
      value = self._DEFAULT_JAVAC
    if self._javac is None:
      self._javac = value
      self._log_debug_property_value('javac compiler', self._javac)
      version_res = subprocess.run(self._javac + ' -version', shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, check=False)
      if version_res.returncode == 0:
        self._javac_version = cross_decode(version_res.stdout).splitlines()[0] if (version_res.stdout is not None) else 'Undefined'
        self._logger.debug('Javac compiler version: %s', self._javac_version)
      else:
        self._javac_version = f'\"{self._javac} -version\" failed to run'
    else:
      self._log_error_about_second_set_value('javac compiler')

  @property
  def tests_root_path(self) -> str:
    '''Root path to the tests directory'''
    if self._tests_root_path is None:
      self._log_info_about_default_value('tests_root_path', self._DEFAULT_TEST_ROOT_PATH)
      self.tests_root_path = self._DEFAULT_TEST_ROOT_PATH
    return self._tests_root_path

  @tests_root_path.setter
  def tests_root_path(self, value: str) -> None:
    if value is None:
      self._log_info_about_default_value('tests_root_path', self._DEFAULT_TEST_ROOT_PATH)
      value = self._DEFAULT_TEST_ROOT_PATH
    if self._tests_root_path is None:
      abs_path = path.abspath(path.expanduser(value))
      if not path.exists(abs_path):
        raise ValueError(f'{abs_path} doesn\'t exist.')
      self._tests_root_path = abs_path
      self._log_debug_property_value('tests_root_path', self._tests_root_path)
    else:
      self._log_error_about_second_set_value('tests_root_path')

  @property
  def tests(self) -> list:
    '''Paths to the tests, relative to the root of the test directory'''
    if self._tests is None:
      self._log_info_about_default_value('tests', self._DEFAULT_TESTS)
      self.tests = self._DEFAULT_TESTS
    return self._tests

  @property
  def level(self) -> str:
    '''Level to the tests'''
    if self._level is None:
      self._log_info_about_default_value('level', self._DEFAULT_LEVEL)
      self.level = self._DEFAULT_LEVEL
    return self._level

  @level.setter
  def level(self, value: str) -> None:
    if value is None:
      self._log_info_about_default_value('level', self._DEFAULT_LEVEL)
      value = self._DEFAULT_LEVEL
    if self._level is None:
      self._level = value
      self._log_debug_property_value('level', self._DEFAULT_LEVEL)

  @tests.setter
  def tests(self, value: list) -> None:
    if value is None:
      self._log_info_about_default_value('tests', self._DEFAULT_TESTS)
      value = self._DEFAULT_TESTS
    if self._tests is None:
      result = []
      for test in value:
        if test.startswith('.'):
          if test.startswith('..'):
            test = test.replace('..', path.join(getcwd(), '..'), 1)
          else:
            test = test.replace('.', getcwd(), 1)
        if path.isabs(test):
          test = path.relpath(test, self.tests_root_path)
        if not (test.endswith('.cj') or test.endswith('*')):
          test += '*'
        if not test.startswith('*'):
          test = '*' + test
        test = normpath(test)
        result.append(test)
      self._tests = result
      self._log_debug_property_value('tests', self._tests)
    else:
      self._log_error_about_second_set_value('tests')

  @property
  def replay(self) -> bool:
    '''Replay mode of the previous test run'''
    if self._replay is None:
      self._log_info_about_default_value('replay', self._DEFAULT_REPLAY)
      self.replay = self._DEFAULT_REPLAY
    return self._replay

  @replay.setter
  def replay(self, value: bool) -> None:
    if value is None:
      self._log_info_about_default_value('replay', self._DEFAULT_REPLAY)
      value = self._DEFAULT_REPLAY
    if self._replay is None:
      self._replay = bool(value)
      self._log_debug_property_value('replay', self._replay)
    else:
      self._log_error_about_second_set_value('replay')

  @property
  def run_mode(self) -> RunMode:
    '''Test run mode'''
    if self._run_mode is None:
      self._log_info_about_default_value('run_mode', self._DEFAULT_RUN_MODE)
      self.run_mode = self._DEFAULT_RUN_MODE
    return self._run_mode

  @run_mode.setter
  def run_mode(self, value: RunMode) -> None:
    if value is None:
      self._log_info_about_default_value('run_mode', self._DEFAULT_RUN_MODE)
      value = self._DEFAULT_RUN_MODE
    if self._run_mode is None:
      self._run_mode = RunMode(value)
      self._log_debug_property_value('run_mode', self._run_mode)
    else:
      self._log_error_about_second_set_value('run_mode')

  @property
  def cj_flags(self) -> str:
    '''Additional Cangjie VM options'''
    if self._cj_flags is None:
      self._log_info_about_default_value('cj_flags', self._DEFAULT_CJ_FLAGS)
      self.cj_flags = self._DEFAULT_CJ_FLAGS
    return self._cj_flags

  @cj_flags.setter
  def cj_flags(self, value: str) -> None:
    if value is None:
      self._log_info_about_default_value('cj_flags', self._DEFAULT_CJ_FLAGS)
      value = self._DEFAULT_CJ_FLAGS
    if self._cj_flags is None:
      self._cj_flags = value
      self._log_debug_property_value('cj_flags', self._cj_flags)
    else:
      self._log_error_about_second_set_value('cj_flags')

  @property
  def cjc_flags(self) -> str:
    '''Additional Cangjie compiler options'''
    if self._cjc_flags is None:
      self._log_info_about_default_value('cjc_flags', self._DEFAULT_CJC_FLAGS)
      self.cjc_flags = self._DEFAULT_CJC_FLAGS
    return self._cjc_flags

  @cjc_flags.setter
  def cjc_flags(self, value: str) -> None:
    if value is None:
      self._log_info_about_default_value('cjc_flags', self._DEFAULT_CJC_FLAGS)
      value = self._DEFAULT_CJC_FLAGS
    if self._cjc_flags is None:
      self._cjc_flags = value
      self._log_debug_property_value('cjc_flags', self._cjc_flags)
    else:
      self._log_error_about_second_set_value('cjc_flags')

  @property
  def cc_flags(self) -> str:
    '''Additional C compiler options'''
    if self._cc_flags is None:
      self._log_info_about_default_value('cc_flags', self._DEFAULT_CC_FLAGS)
      self.cc_flags = self._DEFAULT_CC_FLAGS
    return self._cc_flags

  @cc_flags.setter
  def cc_flags(self, value: str) -> None:
    if value is None:
      self._log_info_about_default_value('cc_flags', self._DEFAULT_CC_FLAGS)
      value = self._DEFAULT_CC_FLAGS
    if self._cc_flags is None:
      self._cc_flags = value
      self._log_debug_property_value('cc_flags', self._cc_flags)
    else:
      self._log_error_about_second_set_value('cc_flags')

  @property
  def cxx_flags(self) -> str:
    '''Additional C++ compiler options'''
    if self._cxx_flags is None:
      self._log_info_about_default_value('cxx_flags', self._DEFAULT_CXX_FLAGS)
      self.cxx_flags = self._DEFAULT_CXX_FLAGS
    return self._cxx_flags

  @cxx_flags.setter
  def cxx_flags(self, value: str) -> None:
    if value is None:
      self._log_info_about_default_value('cxx_flags', self._DEFAULT_CXX_FLAGS)
      value = self._DEFAULT_CXX_FLAGS
    if self._cxx_flags is None:
      self._cxx_flags = value
      self._log_debug_property_value('cxx_flags', self._cxx_flags)
    else:
      self._log_error_about_second_set_value('cxx_flags')

  @property
  def java_flags(self) -> str:
    '''Additional Java VM options'''
    if self._java_flags is None:
      self._log_info_about_default_value('java_flags', self._DEFAULT_JAVA_FLAGS)
      self.java_flags = self._DEFAULT_JAVA_FLAGS
    return self._java_flags

  @java_flags.setter
  def java_flags(self, value: str) -> None:
    if value is None:
      self._log_info_about_default_value('java_flags', self._DEFAULT_JAVA_FLAGS)
      value = self._DEFAULT_JAVA_FLAGS
    if self._java_flags is None:
      self._java_flags = value
      self._log_debug_property_value('java_flags', self._java_flags)
    else:
      self._log_error_about_second_set_value('java_flags')

  @property
  def javac_flags(self) -> str:
    '''Additional Javac compiler options'''
    if self._javac_flags is None:
      self._log_info_about_default_value('javac_flags', self._DEFAULT_JAVAC_FLAGS)
      self.javac_flags = self._DEFAULT_JAVAC_FLAGS
    return self._javac_flags

  @javac_flags.setter
  def javac_flags(self, value: str) -> None:
    if value is None:
      self._log_info_about_default_value('javac_flags', self._DEFAULT_JAVAC_FLAGS)
      value = self._DEFAULT_JAVAC_FLAGS
    if self._javac_flags is None:
      self._javac_flags = value
      self._log_debug_property_value('javac_flags', self._javac_flags)
    else:
      self._log_error_about_second_set_value('javac_flags')

  @property
  def compilation_threads(self) -> int:
    '''Number of threads for tests compilation'''
    if self._compilation_threads is None:
      self._log_info_about_default_value('compilation_threads', self._DEFAULT_COMPILATION_THREADS)
      self.compilation_threads = self._DEFAULT_COMPILATION_THREADS
    return self._compilation_threads

  @compilation_threads.setter
  def compilation_threads(self, value: int) -> None:
    if value is None:
      self._log_info_about_default_value('compilation_threads', self._DEFAULT_COMPILATION_THREADS)
      value = self._DEFAULT_COMPILATION_THREADS
    if self._compilation_threads is None:
      self._compilation_threads = int(value)
      self._log_debug_property_value('compilation_threads', self._compilation_threads)
    else:
      self._log_error_about_second_set_value('compilation_threads')

  @property
  def execution_threads(self) -> int:
    '''Number of threads for tests execution'''
    if self._execution_threads is None:
      self._log_info_about_default_value('execution_threads', self._DEFAULT_EXECUTION_THREADS)
      self.execution_threads = self._DEFAULT_EXECUTION_THREADS
    return self._execution_threads

  @execution_threads.setter
  def execution_threads(self, value: int) -> None:
    if value is None:
      self._log_info_about_default_value('execution_threads', self._DEFAULT_EXECUTION_THREADS)
      value = self._DEFAULT_EXECUTION_THREADS
    if self._execution_threads is None:
      self._execution_threads = int(value)
      self._log_debug_property_value('execution_threads', self._execution_threads)
    else:
      self._log_error_about_second_set_value('execution_threads')

  @property
  def base_timeout(self) -> float:
    '''Base timeout for each test. Test also can contain timeout multiplier'''
    if self._base_timeout is None:
      self._log_info_about_default_value('base_timeout', self._DEFAULT_BASE_TIMEOUT)
      self.base_timeout = self._DEFAULT_BASE_TIMEOUT
    return self._base_timeout

  @base_timeout.setter
  def base_timeout(self, value: float) -> None:
    if value is None:
      self._log_info_about_default_value('base_timeout', self._DEFAULT_BASE_TIMEOUT)
      value = self._DEFAULT_BASE_TIMEOUT
    if self._base_timeout is None:
      self._base_timeout = float(value)
      self._log_debug_property_value('base_timeout', self._base_timeout)
    else:
      self._log_error_about_second_set_value('base_timeout')

  @property
  def is_jet(self) -> bool:
    '''Is jet flag'''
    if self._is_jet is None:
      self._log_info_about_default_value('is_jet', self._DEFAULT_IS_JET)
      self.is_jet = self._DEFAULT_IS_JET
    return self._is_jet

  @is_jet.setter
  def is_jet(self, value: bool) -> None:
    if value is None:
      self._log_info_about_default_value('is_jet', self._DEFAULT_IS_JET)
      value = self._DEFAULT_IS_JET
    if self._is_jet is None:
      self._is_jet = bool(value)
      self._log_debug_property_value('is_jet', self._is_jet)
    else:
      self._log_error_about_second_set_value('is_jet')

  @property
  def filters(self) -> list:
    '''Filters for discovering tests'''
    if self._filters is None:
      self._log_info_about_default_value('filters', self._DEFAULT_FILTERS)
      self.filters = self._DEFAULT_FILTERS
    return self._filters

  @filters.setter
  def filters(self, value: list) -> None:
    if value is None:
      self._log_info_about_default_value('filters', self._DEFAULT_FILTERS)
      value = self._DEFAULT_FILTERS
    if self._filters is None:
      self._filters = value
      self._log_debug_property_value('filters', self._filters)
    else:
      self._log_error_about_second_set_value('filters')

  @property
  def excluded_tests(self) -> list:
    '''List of excluded tests'''
    if self._excluded_tests is None:
      self._log_info_about_default_value('excluded_tests', self._DEFAULT_EXCLUDED_TESTS)
      self.excluded_tests = self._DEFAULT_EXCLUDED_TESTS
    return self._excluded_tests

  @excluded_tests.setter
  def excluded_tests(self, value: list) -> None:
    if value is None:
      self._log_info_about_default_value('excluded_tests', self._DEFAULT_EXCLUDED_TESTS)
      value = self._DEFAULT_EXCLUDED_TESTS
    if self._excluded_tests is None:
      self._excluded_tests = value
      self._log_debug_property_value('excluded_tests', self._excluded_tests)
    else:
      self._log_error_about_second_set_value('excluded_tests')

  @property
  def included_tests(self) -> list:
    '''List of included tests'''
    if self._included_tests is None:
      self._log_info_about_default_value('included_tests', self._DEFAULT_INCLUDED_TESTS)
      self.included_tests = self._DEFAULT_INCLUDED_TESTS
    return self._included_tests

  @included_tests.setter
  def included_tests(self, value: list) -> None:
    if value is None:
      self._log_info_about_default_value('included_tests', self._DEFAULT_INCLUDED_TESTS)
      value = self._DEFAULT_INCLUDED_TESTS
    if self._included_tests is None:
      self._included_tests = value
      self._log_debug_property_value('included_tests', self._included_tests)
    else:
      self._log_error_about_second_set_value('included_tests')

  @property
  def test_report_mode(self) -> ReportMode:
    '''Reporting results mode'''
    if self._test_report_mode is None:
      self._log_info_about_default_value('test_report_mode', self._DEFAULT_REPORT_MODE)
      self.test_report_mode = self._DEFAULT_REPORT_MODE
    return self._test_report_mode

  @test_report_mode.setter
  def test_report_mode(self, value: ReportMode) -> None:
    if value is None:
      self._log_info_about_default_value('test_report_mode', self._DEFAULT_REPORT_MODE)
      value = self._DEFAULT_REPORT_MODE
    if self._test_report_mode is None:
      self._test_report_mode = value
      self._log_debug_property_value('test_report_mode', self._test_report_mode)
    else:
      self._log_error_about_second_set_value('test_report_mode')

  @property
  def cjc_version(self) -> str:
    '''Cangjie compiler version which used during tests compilation'''
    if self._cjc_version is None:
      self._logger.debug('The cjc_version property value was not set.')
    return self._cjc_version

  @property
  def cc_version(self) -> str:
    '''C compiler version (used for some tests)'''
    if self._cc_version is None:
      self._logger.debug('The cc_version property value was not set.')
    return self._cc_version

  @property
  def cxx_version(self) -> str:
    '''C++ compiler version (used for some tests)'''
    if self._cxx_version is None:
      self._logger.debug('The cxx_version property value was not set.')
    return self._cxx_version

  @property
  def java_version(self) -> str:
    '''Java VM version (used for some tests)'''
    if self._java_version is None:
      self._logger.debug('The java_version property value was not set.')
    return self._java_version

  @property
  def javac_version(self) -> str:
    '''Javac compiler version (used for some tests)'''
    if self._javac_version is None:
      self._logger.debug('The javac_version property value was not set.')
    return self._javac_version

  @property
  def log_file(self) -> str:
    '''Log file path'''
    if self._log_file is None:
      self._log_info_about_default_value('log_file', path.join(self.work_directory, self._DEFAULT_LOG_FILE))
      self.log_file = path.join(self.work_directory, self._DEFAULT_LOG_FILE)
    return self._log_file

  @log_file.setter
  def log_file(self, value: str) -> None:
    if value is None:
      self._log_info_about_default_value('log_file', path.join(self.work_directory, self._DEFAULT_LOG_FILE))
      value = path.join(self.work_directory, self._DEFAULT_LOG_FILE)
    if self._log_file is None:
      value = normpath(value)
      if not path.isabs(value):
        self._log_file = path.join(self.work_directory, value)
      else:
        self._log_file = value
      self._log_debug_property_value('log_file', self._log_file)
    else:
      self._log_error_about_second_set_value('log_file')

  @property
  def log_mode(self) -> VerbosityLevel:
    '''Logging mode'''
    if self._log_mode is None:
      self._log_info_about_default_value('log_mode', self._DEFAULT_LOG_MODE)
      self.log_mode = self._DEFAULT_LOG_MODE
    return self._log_mode

  @log_mode.setter
  def log_mode(self, value: str) -> None:
    if value is None:
      self._log_info_about_default_value('log_mode', self._DEFAULT_LOG_MODE)
      value = self._DEFAULT_LOG_MODE
    if self._log_mode is None:
      try:
        self._log_mode = VerbosityLevel(value)
      except ValueError:
        self._logger.error('Value of the log mode property is wrong: %s', value)
        self._log_info_about_default_value('log_mode', self._DEFAULT_LOG_MODE)
        value = self._DEFAULT_LOG_MODE
      self._log_debug_property_value('log_mode', self._log_mode)
    else:
      self._log_error_about_second_set_value('log_mode')

  @property
  def log_no_color(self) -> bool:
    '''Disable output log coloring'''
    if self._log_no_color is None:
      self._log_info_about_default_value('log_no_color', self._DEFAULT_LOG_NO_COLOR)
      self.log_no_color = self._DEFAULT_LOG_NO_COLOR
    return self._log_no_color

  @log_no_color.setter
  def log_no_color(self, value: bool) -> None:
    if value is None:
      self._log_info_about_default_value('log_no_color', self._DEFAULT_LOG_NO_COLOR)
      self.log_no_color = self._DEFAULT_LOG_NO_COLOR
    if self._log_no_color is None:
      self._log_no_color = bool(value)
      self._log_debug_property_value('log_no_color', self._log_no_color)
    else:
      self._log_error_about_second_set_value('log_no_color')

  @property
  def profile(self) -> bool:
    '''Enable profiling'''
    if self._profile is None:
      self._log_info_about_default_value('profile', self._DEFAULT_PROFILE)
      self.profile = self._DEFAULT_PROFILE
    return self._profile

  @profile.setter
  def profile(self, value: bool) -> None:
    if value is None:
      self._log_info_about_default_value('profile', self._DEFAULT_PROFILE)
      self.profile = self._DEFAULT_PROFILE
    if self._profile is None:
      self._profile = bool(value)
      self._log_debug_property_value('profile', self._profile)
    else:
      self._log_error_about_second_set_value('profile')
