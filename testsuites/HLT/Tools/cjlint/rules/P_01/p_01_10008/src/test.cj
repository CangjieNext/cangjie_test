import std.sync.ReentrantMutex

public struct Test {
  public static var lock1: ReentrantMutex = ReentrantMutex()
  public var lock2: ReentrantMutex = ReentrantMutex()
}

main(): Int64 {
  let a = 1
  let l1 = Test.lock1
  let l2 = Test().lock2

  spawn{
    if(a == 1){
      synchronized(l1) {
        synchronized(l2) {
          println("lock1 -> lock2 lock.")
        }
      }
    }else{
      synchronized(l2) {
        synchronized(l1) {
          println("lock2 -> lock1 lock.")
        }
      }
    }
  }
  spawn{
    if(a != 1){
      synchronized(l2) {
        synchronized(l1) {
          println("lock2 -> lock1 lock.")
        }
      }
    }else{
      synchronized(l1) {
        synchronized(l2) {
          println("lock1 -> lock2 lock.")
        }
      }
    }
  }
  0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
