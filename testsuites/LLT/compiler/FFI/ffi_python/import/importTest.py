# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

def func():
    print("xxxx")

def func1():
    x = None
    return x[0]

def func2():
    func1()

a = 10

class Point:
   def __init__( self, x=0, y=0):
      self.x = x
      self.y = y

   def set(self, x, y):
      self.x = x
      self.y = y

   def print(self):
      print(f"x = {self.x}, y = {self.y}")
