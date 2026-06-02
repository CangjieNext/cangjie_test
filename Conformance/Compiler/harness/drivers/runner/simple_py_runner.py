# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: simple_py_runner.py

Description:
Implemented drivers for compilation & execution test by simplified python scripts
'''

import os
from time import time

from drivers.test.test import BaseTest, TestResult, TestRunMode, convert_compile_res_to_test_res, convert_execute_res_to_test_res
from drivers.runner.lang_runner import BaseRunner, CompletedProcess, _exec, convert_res_to_log, _prepare_test_outputs
from core.config import Config, RunMode


class SimplePyRunner(BaseRunner):
  '''Compilation & execution of tests with custom python script'''

  def __init__(self, cfg: Config, mp_lock=None, mp_dict=None):
    super().__init__(cfg)
    self.env = dict(os.environ)
    self.lock = mp_lock
    self.dependency_registry = mp_dict
    self.default_libs_arg = ''

  def do_compile(self, test: BaseTest) -> BaseTest:
    '''Test compilation method. Save binaries in work_dir/bin'''
    start_time = time()
    source_dir = os.path.dirname(test.test_path)
    output_bin, output_dir, artifact_dir, bin_name = _prepare_test_outputs(self.cfg, test)  # pylint: disable=unused-variable
    script_file = os.path.join(source_dir, 'custom.py')

    def on_compile(cmd: str, output_contains=None, handler=None) -> CompletedProcess:  # pylint: disable=unused-variable
      result = _exec(cmd, timeout=self.cfg.base_timeout * test.timeout_factor, cwd=output_dir, env=self.env)
      test.result = convert_compile_res_to_test_res(test, result)
      if output_contains:
        if output_contains.lower() not in str(result.stdout).lower():
          test.result = TestResult.FAILED
      if handler:
        handler(self, test, result)
      test.compile_log += convert_res_to_log(test.name, result)

      if result.returncode:
        raise ChildProcessError(result)  # To exit the script file
      return result

    def on_execute(cmd: str, output_contains=None, handler=None):  # pylint: disable=unused-variable,unused-argument
      pass

    # Aliases for command generators
    cj = self._cj_command_generator  # pylint: disable=unused-variable
    cjc = self._cjc_command_generator  # pylint: disable=unused-variable
    cc = self._cc_command_generator    # pylint: disable=unused-variable
    cxx = self._cxx_command_generator  # pylint: disable=unused-variable
    java = self._java_command_generator  # pylint: disable=unused-variable
    javac = self._javac_command_generator  # pylint: disable=unused-variable

    try:
      with open(script_file, 'r', encoding='utf-8') as script:
        compiled_source = compile(script.read(), '<string>', 'exec')
        exec(compiled_source)  # pylint: disable=exec-used
    except ChildProcessError:
      # Ending the script execution
      pass
    except (Exception, BaseException) as ex:  # pylint: disable=broad-exception-caught
      test.result = TestResult.ERRORED
      test.compile_log += str(ex)

    end_time = time()
    test.compile_time = end_time - start_time
    return test

  def do_execute(self, test: BaseTest) -> BaseTest:
    '''Test run method'''
    if test.mode == TestRunMode.compilationOnly:
      if self.cfg.run_mode == RunMode.executionOnly:
        test.result = TestResult.SKIPPED
      return test
    elif test.result == TestResult.FAILED or test.result == TestResult.ERRORED:
      return test

    source_dir = os.path.dirname(test.test_path)
    output_bin, output_dir, artifact_dir, bin_name = _prepare_test_outputs(self.cfg, test)  # pylint: disable=unused-variable
    script_file = os.path.join(source_dir, 'custom.py')

    def on_compile(cmd: str, output_contains=None, handler=None):  # pylint: disable=unused-variable,unused-argument
      pass

    # Aliases for command generators
    cj = self._cj_command_generator  # pylint: disable=unused-variable
    cjc = self._cjc_command_generator  # pylint: disable=unused-variable
    cc = self._cc_command_generator    # pylint: disable=unused-variable
    cxx = self._cxx_command_generator  # pylint: disable=unused-variable
    java = self._java_command_generator  # pylint: disable=unused-variable
    javac = self._javac_command_generator  # pylint: disable=unused-variable

    def on_execute(cmd: str, output_contains=None, handler=None) -> CompletedProcess:  # pylint: disable=unused-variable
      result = _exec(cmd, timeout=self.cfg.base_timeout * test.timeout_factor, shell=False, cwd=output_dir, env=self.env)
      test.result = convert_execute_res_to_test_res(test, result)
      if output_contains:
        if output_contains.lower() not in str(result.stdout).lower():
          test.result = TestResult.FAILED
      if handler:
        handler(self, test, result)
      test.execute_log += convert_res_to_log(test.name, result, action='run')

      if result.returncode:
        raise ChildProcessError(result)  # To exit the script file
      return result

    start_time = time()
    try:
      with open(script_file, 'r', encoding='utf-8') as script:
        compiled_source = compile(script.read(), '<string>', 'exec')
        exec(compiled_source)  # pylint: disable=exec-used
    except ChildProcessError:
      # Ending the script execution
      pass
    except (Exception, BaseException) as ex:  # pylint: disable=broad-exception-caught
      test.result = TestResult.ERRORED
      test.execute_log += str(ex)
    end_time = time()
    test.execute_time = end_time - start_time
    return test

  def prepare_default_libraries(self) -> list:
    '''Link src/utils'''
    # Possible improvement: Add a system of shared dependencies between drivers
    if self.cfg.run_mode == RunMode.executionOnly:
      return None
    if self.cfg.is_jet:
      lib_ext = '.bc'
    else:
      lib_ext = '.a'
    utils_package = os.path.join(self.cfg.tests_root_path, 'src', 'utils', 'assert')
    if os.path.isdir(utils_package):
      os.makedirs(os.path.join(self.cfg.binary_output_path, 'utils'), exist_ok=True)
      lib_file = os.path.join(self.cfg.binary_output_path, 'utils', f'libutils_utils{lib_ext}')
      if self.cfg.is_jet:
        self.default_libs_arg += f' {lib_file}'
      else:
        self.default_libs_arg += f' -L "{os.path.dirname(lib_file)}" -lutils_utils'

    exceptions_package = os.path.join(self.cfg.tests_root_path, 'src', 'utils', 'exceptions')
    if os.path.isdir(exceptions_package):
      os.makedirs(os.path.join(self.cfg.binary_output_path, 'utils'), exist_ok=True)
      lib_file = os.path.join(self.cfg.binary_output_path, 'utils', f'libutils_exceptions{lib_ext}')
      if self.cfg.is_jet:
        self.default_libs_arg += f' {lib_file}'
      else:
        self.default_libs_arg += f' -L "{os.path.dirname(lib_file)}" -lutils_exceptions'

    macros_package = os.path.join(self.cfg.tests_root_path, 'src', 'utils', 'macros')
    if os.path.isdir(macros_package):
      macros_lib_dir = os.path.join(self.cfg.binary_output_path, 'utils')
      self.default_libs_arg += f' --import-path "{macros_lib_dir}"'
    self.env['CANGJIE_PATH'] = f'{self.cfg.binary_output_path}'
    return None  # There is no output in the log, because the default drivers that were compiled in LangRunner are used here

  def _cj_command_generator(self, source: str, vm_option='', args=''):
    if self.cfg.is_jet:
      return f'{self.cfg.cj} {self.cfg.cj_flags} {vm_option} "{source}" {args}'
    else:
      return f'"{source}" {args}'

  def _cjc_command_generator(self, source: str, output: str, option=''):
    return f'{self.cfg.cjc} {self.cfg.cjc_flags} {option} {source} {self.default_libs_arg} -o "{output}"'

  def _cc_command_generator(self, source: str, output: str, option=''):
    return f'{self.cfg.cc} {self.cfg.cc_flags} {option} "{source}" -o "{output}"'

  def _cxx_command_generator(self, source: str, output: str, option=''):
    return f'{self.cfg.cxx} {self.cfg.cxx_flags} {option} "{source}" -o "{output}"'

  def _java_command_generator(self, source: str, option=''):
    return f'{self.cfg.java} {self.cfg.java_flags} {option} "{source}"'

  def _javac_command_generator(self, source: str, output: str, option=''):
    return f'{self.cfg.javac} {self.cfg.javac_flags} {option} "{source}" -d "{output}"'
