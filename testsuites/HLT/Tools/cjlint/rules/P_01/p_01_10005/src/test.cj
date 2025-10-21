/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.ReentrantMutex

struct Test{
  public static var lock1: ReentrantMutex = ReentrantMutex()
  public static var lock2: ReentrantMutex = ReentrantMutex()

  func foo(a!:Unit = synchronized(lock1) {synchronized(lock2) {println("lock1 -> lock2 lock.")}},b!:Unit = synchronized(lock2) {synchronized(lock1) {println("lock2 -> lock1 lock.")}}){

  }
}

main(): Int64 {
  for (i in 0..10) {
    spawn {
      Test().foo()
    }
  }
  0
}
