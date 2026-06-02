#!/usr/bin/env python3
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: harness.py

Description:
Harness test for Cangjie language
'''

import argparse
import multiprocessing
import logging
from os.path import abspath, dirname

from core import config_manager as cm
from core import report_manager as rm
from core import task_manager as tm
from utils.version import PROG_VERSION, PROG_VERSION_DATE


class Harness:
  '''Class Harness for creating harness instance'''

  def __init__(self):
    # Parse cmd agrs
    arg_parser = self._create_parser()
    self.args = arg_parser.parse_args()
    root_path = dirname(abspath(__file__))

    # Init Harness modules
    self.cfg = cm.ConfigManager(self.args, root_path).get_config()
    self.report_mgr = rm.ReportManager(self.cfg)
    self.task_mgr = tm.TaskManager(self.cfg, self.report_mgr)

  def _create_parser(self):
    '''Harness arguments parser'''
    parser = argparse.ArgumentParser(description='Harness for Cangjie language', add_help=False,
                                     formatter_class=argparse.RawTextHelpFormatter)
    general = parser.add_argument_group('general arguments')
    execution = parser.add_argument_group('execution arguments')
    report = parser.add_argument_group('report arguments')
    other = parser.add_argument_group('other arguments')

    # General
    general.add_argument('--bin-output', action='store', dest='bin_output',
                         help='Path to output of compilation results')
    general.add_argument('--config-file', action='store', dest='config_file',
                         help='Path to custom config file')
    general.add_argument('--cj', action='store',
                         dest='cj', help='Path to Cangjie VM')
    general.add_argument('--cjc', action='store',
                         dest='cjc', help='Path to Cangjie compiler')
    general.add_argument('--cc', action='store',
                         dest='cc', help='Path to C compiler')
    general.add_argument('--cxx', action='store',
                         dest='cxx', help='Path to C++ compiler')
    general.add_argument('--java', action='store',
                         dest='java', help='Path to Java VM')
    general.add_argument('--javac', action='store',
                         dest='javac', help='Path to Javac compiler')
    general.add_argument('--test-output', action='store', dest='test_output',
                         help='Path for artifacts form tests execution')
    general.add_argument('--test-root', action='store', dest='test_root',
                         help='Path to root directory with tests')
    general.add_argument('--tests', nargs='+', dest='tests',
                         help='Path to specific folder with tests or test file')
    general.add_argument('--work-dir', action='store', dest='work_dir',
                         help='Path to work directory')
    general.add_argument('--level', action='store', dest='level',
                         help='Input level for run, default empty.')

    # Execution
    execution.add_argument('--run-mode', choices=['compile', 'execute', 'mixed'],
                           action='store', dest='run_mode',
                           help='Set one of the modes:\n\tcompile only\n\texecution only\n\tmixed mode (default)')
    execution.add_argument('--replay', action='store_true', help='Enable replay mode')
    execution.add_argument('--base-timeout', action='store', dest='base_timeout', type=float,
                           help='Base timeout which used for compilation and execution each test')
    execution.add_argument('--cj-flags', action='store', dest='cj_flags',
                           help='Additional options for Cangjie VM')
    execution.add_argument('--cjc-flags', action='store', dest='cjc_flags',
                           help='Additional options for Cangjie compiler')
    execution.add_argument('--cc-flags', action='store', dest='cc_flags',
                           help='Additional options for C compiler')
    execution.add_argument('--cxx-flags', action='store', dest='cxx_flags',
                           help='Additional options for C++ compiler')
    execution.add_argument('--java-flags', action='store', dest='java_flags',
                           help='Additional options for Java VM')
    execution.add_argument('--javac-flags', action='store', dest='javac_flags',
                           help='Additional options for Javac compiler')
    execution.add_argument('--comp-threads', action='store', dest='compilation_threads', type=int,
                           help='Threads used for tests compilation')
    execution.add_argument('--exec-threads', action='store', dest='execution_threads', type=int,
                           help='Threads used for tests execution')
    execution.add_argument('--included-tests', action='store', dest='included_tests_list',
                           help='Included tests list path')
    execution.add_argument('--excluded-tests', action='store', dest='excluded_tests_list',
                           help='Excluded tests list path')
    execution.add_argument('--jet', action='store_true', dest='is_jet',
                           help='Specify this flag if the jet compiler is being tested')
    execution.add_argument('--filters', action='store', dest='filters',
                           help='Test filters')

    # Report
    report.add_argument('--report-mode', action='store', dest='test_report_mode',
                        help='Test report mode', choices=['plain', 'junit', 'html'])
    report.add_argument('--log-file', action='store', dest='log_file',
                        help='Log file path')
    report.add_argument('--log-mode', action='store', dest='log_mode',
                        help='Logging mode of tests', choices=['progress', 'short', 'detailed', 'verbose'])

    # Other
    other.add_argument('--no-color', action='store_true', dest='log_no_color',
                       default=None, help='Disable output log coloring')
    other.add_argument('--profile', action='store_true', dest='profile',
                       default=False, help=argparse.SUPPRESS)
    other.add_argument('--debug', action='store_true',
                       dest='debug', help='Enable debug mode')
    other.add_argument('--clean', '-c', action='store_true',
                       dest='clean', help='Clean work directory')
    other.add_argument('--yes', '-y', action='store_true',
                       dest='clean_confirm', help='Confirming the cleaning of the work directory')
    other.add_argument('--help', '-h', action='help', help='Show this help message and exit')
    other.add_argument('--version', '-v', action='version', help='Show program\'s version number and exit',
                       version=f'Cangjie Harness: {PROG_VERSION} ({PROG_VERSION_DATE})')
    return parser

  def run(self):
    '''Run tests compilation and execution'''
    self.task_mgr.run()


def main():
  '''Initialization of harness and run tests'''
  try:
    harness = Harness()
    harness.run()
  except KeyboardInterrupt:
    logging.warning('Receive KeyboardInterrupt. Stopping run.')


if __name__ == '__main__':
  multiprocessing.set_start_method('spawn')
  main()
