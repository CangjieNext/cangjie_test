// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

enum TimeUnit1<T> {
  Year(T) | Month(T)

  // test1
  func funcdemo1(): TimeUnit1<T> {
    print("I am in instance func.\n")
    return this
  }

  // test2
  static func foo(b: T): T {
    print("I am in static func.\n")
    return b
  }

  // test3
  operator func -(): TimeUnit1<T> {
   print("I am in operator func.\n")
   return this
  }
}
