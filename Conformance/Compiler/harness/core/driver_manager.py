# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: driver_manager.py

Description:
Driver processing
'''

import os
import json
from multiprocessing import current_process
import traceback

import core.driver_list as dl
from core.config import Config


class DriverGroup:
  '''Struct drivers for DriverManager'''
  test = dl.DEFAULT_TEST
  runner = dl.DEFAULT_RUNNER

  def __eq__(self, other):
    return self.test == other.test and self.runner == other.runner


class DriverManager:
  '''Storage and processing of drivers'''

  def __init__(self, cfg: Config):
    self.cfg = cfg
    base_drivers = DriverGroup()
    self.groups = {0: base_drivers}
    self.customs = {self.cfg.tests_root_path: 0}

  def add_custom(self, file):
    '''Save custom file with id'''
    self.customs.update({file: None})  # id is None - for lazy driver initialization

  def add_group(self, file) -> int:
    '''Added driver group from custom.json file'''
    result_group = DriverGroup()
    with open(file, 'r', encoding='utf-8') as custom_file:
      custom_build = json.load(custom_file)
      try:
        test_class = getattr(dl, custom_build['test'])
        result_group.test = test_class
      except (KeyError, AttributeError):
        result_group.test = dl.DEFAULT_TEST

      try:
        runner_class = getattr(dl, custom_build['runner'])
        result_group.runner = runner_class
      except (KeyError, AttributeError):
        result_group.runner = dl.DEFAULT_RUNNER

    for id_n, group in self.groups.items():
      if group == result_group:
        return id_n

    group_id = len(self.groups)
    self.groups[group_id] = result_group
    return group_id

  def to_test(self, test) -> dl.BaseTest:
    '''Choose Test class for tests'''

    def _get_group_id(file_path):
      def _find_closest_parent_path(paths_list, target_path):
        target_path = os.path.abspath(target_path)
        closest_path = None
        closest_distance = float('inf')
        for path in paths_list:
          abs_path = os.path.dirname(path)
          common_prefix = os.path.commonpath([abs_path, target_path])
          if common_prefix == abs_path:
            distance = len(target_path) - len(common_prefix)
            if distance <= closest_distance:
              closest_distance = distance
              closest_path = path
        return closest_path
      try:
        key = _find_closest_parent_path(self.customs.keys(), os.path.dirname(file_path))
      except ValueError:
        return 0  # Default group

      if self.customs[key] is None:
        self.customs[key] = self.add_group(key)

      return self.customs[key]

    group_id = _get_group_id(test)
    res = self.groups[group_id].test(test)
    res.group_id = group_id
    return res

  def do_compile(self, test) -> dl.BaseTest:
    '''Choose compilation driver for tests'''
    try:
      if self.cfg.profile:
        process = current_process()
        test.comp_worker_pid = process.pid
      test = self.groups[test.group_id].runner.do_compile(test)
    except:
      test.compile_log += f'Harness driver crash: {traceback.format_exc()}'
      test.result = 'ERRORED'
    return test

  def do_execute(self, test) -> dl.BaseTest:
    '''Choose execution driver for tests'''
    try:
      if self.cfg.profile:
        process = current_process()
        test.exec_worker_pid = process.pid
      test = self.groups[test.group_id].runner.do_execute(test)
    except:
      test.execute_log += f'Harness driver crash: {traceback.format_exc()}'
      test.result = 'ERRORED'
    return test

  def to_dict(self):
    '''Convert DriverManager class to dictionary'''
    groups_dict = {}

    for key, item in self.groups.items():
      group = {key: {'test': item.test.__name__, 'runner': item.runner.__name__}}
      groups_dict.update(group)

    result = {
        'customs': self.customs,
        'groups': groups_dict
    }
    return result

  @staticmethod
  def from_dict(cfg: Config, drivers_dict: dict):
    '''Convert dictionary class to DriverManager'''
    drivers = DriverManager(cfg)
    drivers.customs = drivers_dict['customs']

    for ids in drivers_dict['groups']:
      group = drivers_dict['groups'][ids]
      result_group = DriverGroup()
      test_class = getattr(dl, group['test'])
      result_group.test = test_class

      runner_class = getattr(dl, group['runner'])
      result_group.runner = runner_class
      drivers.groups[int(ids)] = result_group

    return drivers

  def __getitem__(self, key):
    return self.groups.get(key)

  def __setitem__(self, key, value):
    self.groups[key] = value
