/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.ReentrantMutex

public class Test {
  public static var lock1: ReentrantMutex = ReentrantMutex()
  public static var lock2: ReentrantMutex = ReentrantMutex()
  public var lock3: ReentrantMutex = ReentrantMutex()
  public static var lock4: ReentrantMutex = ReentrantMutex()
  public var lock5: ReentrantMutex = ReentrantMutex()
}

var l1 = Test.lock1
var l2 = Test.lock2
var l3 = Test().lock3
var l4 = Test.lock4
var l5 = Test().lock5

struct A{
  var lock1ToLock5 = spawn{
    synchronized(l1) {
      synchronized(l2) {
        synchronized(l5) {
          synchronized(l4) {
            synchronized(l3) {
              println("lock1 -> lock2 -> lock3 -> lock4 -> lock5 lock.")
            }
          }
        }
      }
    }
  }

  var lock5ToLock1 = spawn{
    synchronized(l5) {
      synchronized(l4) {
        synchronized(l3) {
          synchronized(l2) {
            synchronized(l1) {
              println("lock5 -> lock4 -> lock3 -> lock2 -> lock1 lock.");
            }
          }
        }
      }
    }
  }
}

main(): Int64 {
  for (i in 0..10) {
    spawn {
      A().lock1ToLock5
      A().lock5ToLock1
    }
  }
  0
}
