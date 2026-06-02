# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: tree_view.py

Description:
Contains class for Tree and some methods to work with it
'''

import re

from drivers.test.test import TestResult
from utils.utils import PT_END_COLORING, PT_BLUE, PT_BOLD_GREEN, PT_BOLD_RED, PT_BOLD_YELLOW, PT_GREEN, PT_FAINT


class TreeNode:
  '''Tree node class with additional attributes for tests analysis'''
  ASSERT_DELIMITER = '<some_unique_delimiter>'

  def __init__(self, name: str, parent) -> None:
    self.name = name
    self.value: dict = None
    self.children = []
    self.parent = parent
    self.num_passed = 0
    self.num_failed = 0
    self.num_errors = 0
    self.num_skipped = 0
    self.num_incomplete = 0
    self.num_asserts = 0
    self.num_exp_asserts = 0
    self.assert_text = ''
    self.time_comp = 0.0
    self.time_exec = 0.0

  def get_child_by_name(self, name: str):
    '''Get child by name'''
    for child in self.children:
      if child.name == name:
        return child
    return None

  def _check_expected_assertion(self, child) -> True:
    if child.num_exp_asserts != 0:
      return True
    elif child.parent is not None:
      return self._check_expected_assertion(child.parent)
    return False

  def update_children_stats(self):
    '''Update stats for '''
    if len(self.children) > 0:
      self.children.sort(key=lambda item: item.name)
      for child in self.children:
        child.update_children_stats()
        self.num_passed += child.num_passed
        self.num_failed += child.num_failed
        self.num_errors += child.num_errors
        self.num_incomplete += child.num_incomplete
        self.num_skipped += child.num_skipped
        self.time_comp += child.time_comp
        self.time_exec += child.time_exec
        if len(self.children[0].children) == 0:  # its assert
          if self._check_expected_assertion(child):
            self.num_asserts = 1
            self.assert_text = self.children[0].value['assertion'] + self.ASSERT_DELIMITER
        elif child.assert_text not in self.assert_text:
          self.num_asserts += child.num_asserts
          self.assert_text += child.assert_text
    else:
      if TestResult(self.value['result']) == TestResult.PASSED:  # pylint: disable=unsubscriptable-object
        self.num_passed = 1
      elif TestResult(self.value['result']) == TestResult.FAILED:  # pylint: disable=unsubscriptable-object
        self.num_failed = 1
      elif TestResult(self.value['result']) == TestResult.ERRORED:  # pylint: disable=unsubscriptable-object
        self.num_errors = 1
      elif TestResult(self.value['result']) == TestResult.INCOMPLETE:  # pylint: disable=unsubscriptable-object
        self.num_incomplete = 1
      else:
        self.num_skipped = 1
      if self.value['compile_time'] is None:  # pylint: disable=unsubscriptable-object
        self.time_comp = 0
      else:
        self.time_comp = self.value['compile_time']  # pylint: disable=unsubscriptable-object

      if self.value['execute_time'] is None:  # pylint: disable=unsubscriptable-object
        self.time_exec = 0
      else:
        self.time_exec = self.value['execute_time']  # pylint: disable=unsubscriptable-object


def cut_leaves_from_tree(tree_root: TreeNode):
  '''Cuts leaves of input tree. Necessary for next correct displaying a tree'''
  if len(tree_root.children) == 0:  # it's the leaf
    tree_root.parent.children.remove(tree_root)
  else:
    prev_len = len(tree_root.children)
    counter = 0
    while counter < len(tree_root.children):
      cut_leaves_from_tree(tree_root.children[counter])
      if prev_len == len(tree_root.children):  # nothing was removed
        counter += 1


def _cut_leaves_upto_assertions(tree_root: TreeNode):
  if re.match(r'a\d+', tree_root.name) is not None:  # it's the assertion
    tree_root.children.clear()
  else:
    prev_len = len(tree_root.children)
    counter = 0
    while counter < len(tree_root.children):
      _cut_leaves_upto_assertions(tree_root.children[counter])
      if prev_len == len(tree_root.children):
        counter += 1


def cut_tests_leaves_from_tree(tree_root: TreeNode):
  '''Cuts tests leaves upto assertions of input tree'''
  cut_leaves_from_tree(tree_root)
  _cut_leaves_upto_assertions(tree_root)


def write_tree(tree_root: TreeNode, indent: str, write_message: callable, need_time=False):
  '''Write tree using 'write_message' function'''
  _mid = '├─ '
  _last = '└─ '
  _vert = '│  '
  _empty = '   '
  f = ''
  if tree_root.value is None:
    is_all_passed = tree_root.num_failed == 0 and tree_root.num_errors == 0 and tree_root.num_incomplete == 0 and tree_root.num_skipped == 0
    if is_all_passed:
      f = f'{PT_FAINT}'
    if tree_root.num_exp_asserts == 0:
      assertions_info = '' #f'A:{tree_root.num_asserts}, '
    else:
      if tree_root.num_asserts == tree_root.num_exp_asserts:
        assertions_info = f'{f}A:{PT_GREEN}{tree_root.num_asserts}/{tree_root.num_exp_asserts}{PT_END_COLORING}{f}, '
      else:
        f = ''
        assertions_info = f'A:{tree_root.num_asserts}/{tree_root.num_exp_asserts}, '

    chapter_name = tree_root.name.replace('_', ' ')
    total_tests = tree_root.num_passed + tree_root.num_failed + tree_root.num_errors + tree_root.num_incomplete + tree_root.num_skipped
    message = f'{indent}{f}{chapter_name} [{assertions_info}{f}T:{total_tests}'
    if not is_all_passed:
      message += f'{f} ({PT_BOLD_GREEN}P:{tree_root.num_passed}{PT_END_COLORING}'
      message += f'{f}/{PT_BOLD_RED}F:{tree_root.num_failed}{PT_END_COLORING}{f}/{PT_BOLD_RED}E:{tree_root.num_errors}{PT_END_COLORING}'
      if tree_root.num_incomplete != 0 or tree_root.num_skipped != 0:
        message += f'{f}/{PT_BOLD_YELLOW}S:{tree_root.num_skipped}{PT_END_COLORING}{f}/{PT_BOLD_YELLOW}I:{tree_root.num_incomplete}{PT_END_COLORING}'
      message += f'{f})'
    message += f'{f}]{PT_END_COLORING}'
    if need_time:
      message += f'{f} ({PT_BLUE}{tree_root.time_comp:.3f}s{PT_END_COLORING}/{PT_BLUE}{tree_root.time_exec:.3f}s{PT_END_COLORING})'
    write_message(message)
  else:
    write_message(f'{indent}{tree_root.value["name"]} - {tree_root.value["result"]}')
  indent = indent.replace(_mid, _vert).replace(_last, _empty)
  for child in tree_root.children:
    if child == tree_root.children[-1]:
      write_tree(child, indent + _last, write_message, need_time)
    else:
      write_tree(child, indent + _mid, write_message, need_time)
