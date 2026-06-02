# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: lang_runner.py

Description:
Implemented drivers for compilation & execution lang tests
'''

import os
import logging
from subprocess import CompletedProcess
from time import time, sleep

from os.path import join, dirname, basename

from drivers.test.test import Test, TestResult, TestRunMode, BaseTest
from drivers.runner.base_runner import BaseRunner
from core.config import Config, RunMode
from utils.utils import convert_res_to_log, execute_subprocess as _exec


class LangRunner(BaseRunner):
  '''Compilation & execution of lang tests'''

  def __init__(self, cfg: Config, mp_lock=None, mp_dict=None):
    super().__init__(cfg)
    self.env = dict(os.environ)
    self.lock = mp_lock
    self.dependency_registry = mp_dict
    self.default_libs_arg = ''

  @property
  def _logger(self):
    return logging.getLogger(__name__)

  def do_compile(self, test: Test) -> Test:
    '''Test compilation method. Save binaries in work_dir/bin'''
    start_time = time()

    output_bin, output_dir, _, bin_name = _prepare_test_outputs(self.cfg, test)
    pkg_depends, macro_depends = self._prepare_dependencies(test, output_dir)
    depends = self._join_macro_dependencies(macro_depends)
    all_depends = ""
    if self.cfg.is_jet:
        pkg_depends = ' '.join(pkg_depends.split(' ')[::-1])
        all_depends = depends + " " + pkg_depends
    else:
        all_depends = pkg_depends + " " + depends

    if test.result == TestResult.PENDING:
      test.compile_res = _exec(f'{self.cfg.cjc} {"--enable-ad" if test.is_auto_diff and not self.cfg.is_jet else ""} '
                               f'{self.cfg.cjc_flags}'
                               f' --import-path "{output_dir}" '
                               f'"{test.test_path}" {all_depends} '
                               f'--output-dir "{output_dir}" '
                               f'-o "{bin_name}"',
                               timeout=self.cfg.base_timeout * test.timeout_factor, env=self.env, cwd=output_dir)
      if test.result == TestResult.INCOMPLETE:
        test.binary_path = output_bin

    end_time = time()
    test.compile_time = end_time - start_time
    test.compile_start = start_time
    test.compile_stop = end_time
    return test

  def do_execute(self, test: Test) -> Test:
    '''Test run method'''
    bin_file, _, artifact_dir, _ = _prepare_test_outputs(self.cfg, test)
    if not test.binary_path:  # Try take binaries
      if self.cfg.run_mode == RunMode.executionOnly:
        if test.mode != TestRunMode.compilationOnly:
          test.binary_path = bin_file
        else:
          # If the test is not compiled and the test is compile-only, must set the result manually.
          test.result = TestResult.SKIPPED
          return test
      else:  # Compile fail or compile-only test
        return test

    cmd = f'"{test.binary_path}"'

    if self.cfg.is_jet:
      cmd = f'{self.cfg.cj} {self.cfg.cj_flags} {cmd}'

    if self.cfg.replay and test.param:
      cmd += f' {test.param}'

    if not os.path.isfile(test.binary_path):
      test.result = TestResult.ERRORED
      test.execute_res = CompletedProcess(cmd, 127, f'{test.binary_path}: not found'.encode('utf-8'))
      return test

    start_time = time()
    test.execute_res = _exec(cmd, timeout=self.cfg.base_timeout * test.timeout_factor,
                             env=self.env, cwd=artifact_dir)
    end_time = time()
    test.execute_time = end_time - start_time
    test.execute_start = start_time
    test.execute_stop = end_time
    return test

  def prepare_default_libraries(self) -> list:
    '''Compiling src/utils as utils module'''
    if self.cfg.run_mode == RunMode.executionOnly:
      return None
    results = []
    if self.cfg.is_jet:
      lib_ext = '.bc'
    else:
      lib_ext = '.a'
    assert_package = join(self.cfg.tests_root_path, 'src', 'utils', 'assert')
    if os.path.isdir(assert_package):
      os.makedirs(join(self.cfg.binary_output_path, 'utils'), exist_ok=True)

      lib_file = join(self.cfg.binary_output_path, 'utils', f'libutils_utils{lib_ext}')
      result = _exec(f'{self.cfg.cjc} {self.cfg.cjc_flags} --import-path "{self.cfg.binary_output_path}"'
                     f' -p "{assert_package}" --output-type=staticlib'
                     f' -o "{lib_file}"', timeout=self.cfg.base_timeout, env=self.env, cwd=dirname(lib_file))
      if result.returncode:
        # add "decode("utf-8")", modified by zhujunhua 00496180
        raise ValueError(f'Utils lib compiled with errors: {result.stdout.decode("utf-8")}; {result.stderr.decode("utf-8")}')
      if self.cfg.is_jet:
        self.default_libs_arg += f' {lib_file}'
      else:
        self.default_libs_arg += f' -L "{dirname(lib_file)}" -lutils_utils'
      results.append(result)

    # 这里对于exception package的实现比较奇怪，并没有这个路径
    exceptions_package = join(self.cfg.tests_root_path, 'src', 'utils', 'exceptions')
    if os.path.isdir(exceptions_package):
      os.makedirs(join(self.cfg.binary_output_path, 'utils'), exist_ok=True)

      lib_file = join(self.cfg.binary_output_path, 'utils', f'libutils_exceptions{lib_ext}')
      result = _exec(f'{self.cfg.cjc} {self.cfg.cjc_flags} --import-path "{self.cfg.binary_output_path}"'
                     f' -p "{exceptions_package}" --output-type=staticlib'
                     f' -o "{lib_file}"', timeout=self.cfg.base_timeout, env=self.env, cwd=dirname(lib_file))
      if result.returncode:
        raise ValueError(f'Exceptions lib compiled with errors: {result.stdout}; {result.stderr}')
      if self.cfg.is_jet:
        self.default_libs_arg += f' {lib_file}'
      else:
        self.default_libs_arg += f' -L "{dirname(lib_file)}" -lutils_exceptions'
      results.append(result)

    # 编 macro 的包
    macros_package = join(self.cfg.tests_root_path, 'src', 'utils', 'macros')
    if os.path.isdir(macros_package):
      # macros_lib_name = 'libutils_macros'
      # if self.cfg.is_jet:
      #   macros_lib_name += '.bc'
      # elif os.name == 'nt':
      #   macros_lib_name += '.dll'
      # else:
      #   macros_lib_name += '.so'
      # if self.cfg.is_jet:
      #   macro_option = '--compile-macro --output-type=staticlib'
      # else:
      #   macro_option = '--compile-macro'
      macro_option = '--compile-macro'
      macros_lib_dir = join(self.cfg.binary_output_path, 'utils')
      macros_result = _exec(f'{self.cfg.cjc} {self.cfg.cjc_flags} '
                            f' -p "{macros_package}" {macro_option}'
                            f' --output-dir "{macros_lib_dir}"', timeout=self.cfg.base_timeout, env=self.env, cwd=dirname(macros_lib_dir))
      if macros_result.returncode:
        raise ValueError(f'Macros lib compiled with errors: {macros_result.stdout}; {macros_result.stderr}')
      # if self.cfg.is_jet:
      #   self.default_libs_arg += f' --interp-macro "{macros_lib_dir}"'
      # else:
      #   self.default_libs_arg += f' --macro-lib "{macros_lib_dir}"'
      self.default_libs_arg += f' --import-path "{macros_lib_dir}"'
      results.append(macros_result)
    self.env['CANGJIE_PATH'] = f'{self.cfg.binary_output_path}'
    self._logger.info('Set the CANGJIE_PATH environment variable to %s', self.env['CANGJIE_PATH'])
    return results

  def _prepare_build_list(self, test: Test) -> list:
    packages = {}
    key = test.module + '_' + test.package  # To group by modules and packages
    packages[key] = [test]

    nodes_to_process = [key]
    while nodes_to_process:
      package = nodes_to_process.pop()
      i, k = 0, 0
      while i <= k:
        for dependency in packages[package][i].dependencies:
          key = dependency.module + '_' + dependency.package
          if key not in packages:
            packages[key] = [dependency]
            nodes_to_process.append(key)
          else:
            packages[key].append(dependency)
        i += 1
        k = len(packages[package])-1

    res = []
    for tests in packages.values():
      res.append(tests)
    res[0] = res[0][1:]  # Remove test itself
    return res[::-1]    # Reverse to build from the end of the dependency tree

  def _prepare_dependencies(self, test: Test, output_dir: str) -> str:
    pkg_depends = ''
    macro_depends = ''

    if not test.dependencies:
      return pkg_depends, macro_depends

    package_build_list = self._prepare_build_list(test)
    pkg_depends = ' '.join(t.test_path for t in package_build_list.pop())

    for pkg in package_build_list:
      if not pkg:
        continue
      pkg_args = ' '.join(f'"{t.test_path}"' for t in pkg)
      lib_file = join(output_dir, f'lib{pkg[0].module}_{pkg[0].package}')
      if self.cfg.is_jet:
        lib_file += '.bc'
      else:
        lib_file += '.a'

      self.lock.acquire()
      if lib_file not in self.dependency_registry:
        self.dependency_registry[lib_file] = 'compiling'
        self.lock.release()
        os.makedirs(output_dir, exist_ok=True)
        os.makedirs(join(output_dir, pkg[0].module), exist_ok=True)
        depends = self._join_macro_dependencies(macro_depends)
        if pkg[0].is_macro_lib:
          if self.cfg.is_jet:
            pkg[0].compile_res = _exec(f'{self.cfg.cjc} {self.cfg.cjc_flags} '
                                       f'--compile-macro {depends} {pkg_depends} '
                                       # f'-o "{dirname(lib_file)}" {pkg_args}',
                                       f'{pkg_args}',
                                       timeout=self.cfg.base_timeout * test.timeout_factor, env=self.env, cwd=output_dir)
          else:
            pkg[0].compile_res = _exec(f'{self.cfg.cjc} {self.cfg.cjc_flags} {"--enable-ad" if test.is_auto_diff else ""} '
                                       f'--compile-macro {depends} {pkg_depends} '
                                       f'-o "{dirname(lib_file)}" {pkg_args}',
                                       timeout=self.cfg.base_timeout * test.timeout_factor, env=self.env, cwd=output_dir)
        else:
          pkg[0].compile_res = _exec(f'{self.cfg.cjc} {self.cfg.cjc_flags} {"--enable-ad" if test.is_auto_diff and not self.cfg.is_jet else ""} '
                            f'--import-path "{output_dir}" {pkg_args} '
                            f'--output-type=staticlib {depends} '
                            f'-o "{lib_file}" ', timeout=self.cfg.base_timeout * test.timeout_factor, env=self.env, cwd=output_dir)

        # propagate result to all package's files
        for file in pkg[1:]:
          file.result = pkg[0].result

        self.dependency_registry[lib_file] = pkg[0].compile_res
        test.compile_log += convert_res_to_log(pkg[0].name, pkg[0].compile_res, prefix='-->')

      else:
        self.lock.release()
        while self.dependency_registry[lib_file] == 'compiling':
          sleep(0.5)
        test.compile_log += convert_res_to_log(pkg[0].name, self.dependency_registry[lib_file], prefix='-->')

      if pkg[0].is_macro_lib:
        macro_depends += f' --import-path {dirname(lib_file)} '
      else:
        if self.cfg.is_jet:
          pkg_depends = f'{lib_file} ' + pkg_depends
        else:
          pkg_depends = f'-L "{dirname(lib_file)}" -l{basename(lib_file)[3:][:-2]} ' + pkg_depends

      if self.dependency_registry[lib_file].returncode != 0:
        test.compile_res = CompletedProcess('', stderr='The dependecies compile failed'.encode('utf-8'), returncode=1)
        test.execute_res = test.compile_log
        break

    return pkg_depends, macro_depends

  def _join_macro_dependencies(self, macro_depends):
    depends = self.default_libs_arg + macro_depends
    return depends

def _prepare_test_outputs(cfg: Config, test: BaseTest, mkdir=True) -> str:
  root_relative = os.path.relpath(dirname(test.test_path), cfg.tests_root_path)
  bin_output_dir = join(cfg.binary_output_path, root_relative)
  artifact_dir = None
  if test.mode == TestRunMode.run:
    artifact_dir = join(cfg.test_run_output_path, root_relative, test.name)

  bin_name = test.name
  if cfg.is_jet:
    bin_name += '.cbc'
  elif os.name == 'nt':
    bin_name += '.exe'

  if mkdir:
    os.makedirs(bin_output_dir, exist_ok=True)
    if artifact_dir:
      os.makedirs(artifact_dir, exist_ok=True)

  return join(bin_output_dir, bin_name), bin_output_dir, artifact_dir, bin_name
