import std.sync.ReentrantMutex

public struct Test {
  public var lock1: ReentrantMutex = ReentrantMutex()
  public var lock2: ReentrantMutex = ReentrantMutex()
  public var lock3: ReentrantMutex = ReentrantMutex()
  public var lock4: ReentrantMutex = ReentrantMutex()
}

class A{
  var l1 = Test().lock1
  var l2 = Test().lock2
  var l3 = Test().lock3
  var l4 = Test().lock4

  func lock1ToLock5(){
    spawn{
      synchronized(l1) {
        synchronized(l2) {
          synchronized(l3) {
            println("lock1 -> lock2 -> lock3 lock.")
          }
        }
      }
    }

    spawn{
      synchronized(l3) {
        synchronized(l2) {
          synchronized(l4) {
            println("lock1 -> lock2 -> lock3 lock.")
          }
        }
      }
    }
  }
}

main(): Int64 {
  0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
