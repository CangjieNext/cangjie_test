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
  public static var lock3: ReentrantMutex = ReentrantMutex()
  public static var lock4: ReentrantMutex = ReentrantMutex()
  public static var lock5: ReentrantMutex = ReentrantMutex()

  func foo1(a!:Unit = synchronized(lock5) {synchronized(lock4) {synchronized(lock3) {synchronized(lock5) {synchronized(lock4) {println("lock5 --> lock1 lock.")}}}}}){

  }

  func foo2(a!:Unit = synchronized(lock1) {synchronized(lock2) {synchronized(lock3) {synchronized(lock4) {synchronized(lock5) {println("lock1 --> lock5 lock.")}}}}}){

  }
}

main(): Int64 {
  for (i in 0..10) {
    spawn {
      Test().foo1()
      Test().foo2()
    }
  }
  0
}
