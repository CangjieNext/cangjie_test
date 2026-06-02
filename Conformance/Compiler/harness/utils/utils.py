# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: utils.py

Description:
Some useful features
'''

import csv
import fnmatch
import logging
import pathlib
import re
import os
import subprocess
import signal
import glob

from subprocess import Popen, CompletedProcess, TimeoutExpired, SubprocessError
from shlex import shlex, split

PT_END_COLORING = '\033[0m'
PT_BOLD = '\033[1m'
PT_FAINT = '\033[2m'
PT_BOLD_GREEN = '\033[32;1m'
PT_BOLD_RED = '\033[31;1m'
PT_BOLD_YELLOW = '\033[93;1m'
PT_BLUE = '\033[34m'
PT_GREEN = '\033[32m'
PT_RED = '\033[31m'
PT_YELLOW = '\033[93m'


def atof(text: str):
  '''str to float function'''
  try:
    retval = float(text)
  except ValueError:
    retval = text
  return retval


def natural_keys(text: str):
  '''alist.sort(key=natural_keys) sorts in human order'''
  return [atof(c) for c in re.split(r'[+-]?([0-9]+(?:[.][0-9]*)?|[.][0-9]+)', text)]


def normpath(path: str):
  '''cross-platform path normalization'''
  if os.name == 'nt':
    return str(pathlib.PureWindowsPath(path))
  else:
    return pathlib.PureWindowsPath(path).as_posix()


def kill_processes(pid: int):
  '''kill process with children by pid'''
  if os.name == 'nt':
    from utils.win_killpg import win_killpg # pylint: disable=import-outside-toplevel
    win_killpg(pid)
  else:
    try:
      os.killpg(os.getpgid(pid), signal.SIGTERM)
    except ProcessLookupError:
      return


def cross_decode(text: bytes) -> str:
  '''Decoding strings with support for multiple encodings'''
  if text is None:
    return ''
  res = ''
  for encoding in ['utf-8', '866', '1251']:
    try:
      res = text.decode(encoding)
      break
    except UnicodeDecodeError:
      continue
  else:
    res = 'Unrecognized encoding'
  return res


def _prepare_process_output(name: str, output: bytes, prefix='-'):
  if output is None:
    return f'{prefix} {PT_BOLD}{name}{PT_END_COLORING}: None\n'
  else:
    res = f'{prefix} {PT_BOLD}{name}:{PT_END_COLORING}\n'
    split_output = output.splitlines()
    for line in split_output:
      res += f'\t{cross_decode(line)}\n'
    return res


def convert_res_to_log(name: str, res: CompletedProcess, action='compilation', prefix='-') -> str:
  '''Convert results of some process(CompletedProcess) to log format'''
  log = ''
  if res is not None:
    log = f'{prefix} {PT_BOLD}{name} {action} command:{PT_END_COLORING} {res.args}\n'
    log += _prepare_process_output('stdout', res.stdout, prefix)
    log += _prepare_process_output('stderr', res.stderr, prefix)
    log += f'{prefix} {PT_BOLD}return code:{PT_END_COLORING} {res.returncode}\n'
  return log


def clear_message(message: str) -> str:
  '''Remove colorize template'''
  cleared_message = re.sub(r'\x1b\[[0-9;]+m', '', message)
  return cleared_message


def execute_subprocess(command: str, timeout=None, shell=True, **kwargs) -> CompletedProcess:
  '''Command execution using the subprocess.popen function'''
  try:
    if not shell:
      if os.name == 'nt':
        lex = shlex(command, posix=True)
        lex.whitespace_split = True
        lex.escape = ''
        command = list(lex)
      else:
        command = split(command, posix=True)

    with Popen(command, shell=shell, stdout=subprocess.PIPE, stderr=subprocess.PIPE, start_new_session=True, **kwargs) as process:
      try:
        signal.signal(signal.SIGINT, lambda signum, frame: kill_processes(process.pid))
        stdout, stderr = process.communicate(None, timeout=timeout)
        retcode = process.poll()
        return CompletedProcess(process.args, stdout=stdout, stderr=stderr, returncode=retcode)
      except TimeoutExpired as error:
        kill_processes(process.pid)
        return CompletedProcess(args=error.cmd, stdout=error.stdout if error.stdout else b'',
                                stderr=f'The {error.timeout}-second timeout has expired'.encode('utf-8'), returncode=127)
      except SubprocessError as error:  # Other exception
        kill_processes(process.pid)
        return CompletedProcess(error.args, stderr=str(error).encode('utf-8'), returncode=127)
  except OSError as error:
    return CompletedProcess(command, stderr=str(error).encode('utf-8'), returncode=127)

def find_files_by_creation_date(directory, file_mask):
  '''Find file in directory by mask & sort by creation date'''
  search_pattern = os.path.join(directory, file_mask)
  file_list = glob.glob(search_pattern)
  if not file_list:
    return []
  return sorted(file_list, key=os.path.getmtime)


def _process_assertions_children(assertions):
  for i in range(1, len(assertions)):
    if assertions[i-1][0] in assertions[i][0]:  # Chapter has children
      child_index = 0
      is_the_end = i + child_index == len(assertions)
      while not is_the_end and assertions[i-1][0] in assertions[i+child_index][0]:  # go through childrens
        assertions[i-1][2] += assertions[i+child_index][2]
        child_index += 1
        is_the_end = i + child_index == len(assertions)
  return assertions


def process_assertions(tests_root_path):
  '''Return the list of ['chapter number', 'full chapter name', count of assertions in the chapter, 'path_name', 'root_path']'''
  if not os.path.exists(tests_root_path):
    logging.warning('Tests root path was not found.')
    return []
  assertions = []
  count_assertions_files = 0
  for root, _, files in os.walk(tests_root_path):
    assertions_files = [f for f in files if re.match(fnmatch.translate('assertions.csv'), f)]
    assertions_files = [os.path.join(root, f) for f in assertions_files]
    for file in assertions_files:
      with open(file, newline='', encoding='utf-8') as csvfile:
        reader = csv.reader(csvfile, delimiter=';')
        count = 0
        dir_name = os.path.dirname(file)
        row = [str(count_assertions_files), dir_name, 0, os.path.basename(dir_name), dir_name]
        assertions.append(row)
        for row in reader:
          if count == 0:
            count += 1
            continue
          chapter_num = str(count_assertions_files) + row[0].split(' ')[0]
          chapter_subnum = row[0].split(' ')[0].split('.')[-1]
          if str(chapter_subnum).isdigit():
            chapter_subnum = f'{int(chapter_subnum):02d}'
          elif chapter_subnum[-1].lower() == 'a': # HotFix: Check that it's appendix
            chapter_subnum = 'a'
          chapter_path_name = '_'.join(row[0].split(' ')[1:]).replace(',', '').replace('/', '_').replace('-', '_').lower()
          chapter_path_name = f'{chapter_subnum}_{chapter_path_name}'
          row.append(chapter_path_name)
          row[1] = int(row[1])
          row.append(dir_name)
          row.insert(0, chapter_num)
          assertions.append(row)
        count_assertions_files += 1
  assertions = _process_assertions_children(assertions)
  return assertions

def unify_tests(tests, cfg, unify_path = False, skip_non_spec = False) -> list:
  '''Unify tests logs: remove paths diffeerence from logs'''
  test_root_path = cfg["tests_root_path"]
  work_directory = cfg["work_directory"]
  binary_output_path = cfg["binary_output_path"]
  test_run_output_path = cfg["test_run_output_path"]
  cjc = cfg["cjc"]
  cc = cfg["cc"]
  cxx = cfg["cxx"]
  remove_tests = []
  for item in tests:
    item['test_path'] = item['test_path'].replace(test_root_path, '.')
    item['compile_log'] = clear_message(item['compile_log'])
    item['compile_log'] = item['compile_log'].replace(test_root_path, '.')
    item['compile_log'] = item['compile_log'].replace(binary_output_path, '.')
    item['compile_log'] = item['compile_log'].replace(test_run_output_path, '.')
    item['compile_log'] = item['compile_log'].replace(cjc, 'cjc')
    item['compile_log'] = item['compile_log'].replace(cc, 'сс')
    item['compile_log'] = item['compile_log'].replace(cxx, 'cxx')
    item['compile_log'] = item['compile_log'].replace(work_directory, '.')

    item['execute_log'] = clear_message(item['execute_log'])
    item['execute_log'] = item['execute_log'].replace(test_root_path, '.')
    item['execute_log'] = item['execute_log'].replace(binary_output_path, '.')
    item['execute_log'] = item['execute_log'].replace(test_run_output_path, '.')
    item['execute_log'] = item['execute_log'].replace(cjc, 'cjc')
    item['execute_log'] = item['execute_log'].replace(cc, 'сс')
    item['execute_log'] = item['execute_log'].replace(cxx, 'cxx')
    item['execute_log'] = item['execute_log'].replace(work_directory, '.')

    if unify_path:
      item['test_path'] = item['test_path'].replace('\\', '/')
      item['compile_log'] = item['compile_log'].replace('\\', '/')
      item['execute_log'] = item['execute_log'].replace('\\', '/')

    if 'dependencies' in item and item['dependencies']:
      item['dependencies'] = [dep.replace(test_root_path, '.') for dep in item['dependencies']]
      if unify_path:
        item['dependencies'] = [dep.replace('\\', '/') for dep in item['dependencies']]


    if skip_non_spec:
      if 'src/regression' in item['test_path']:
        remove_tests.append(item)
      if 'src/utils' in item['test_path']:
        remove_tests.append(item)
      if 'tdm/tests' in item['test_path']:
        remove_tests.append(item)
    item['id'] = item['test_path'].replace('\\', '').replace('/', '')

  if skip_non_spec:
    for item in remove_tests:
      tests.remove(item)

  return tests
