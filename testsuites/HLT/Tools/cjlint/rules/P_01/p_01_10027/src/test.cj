/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.ReentrantMutex

main(): Int64 {
  let a = 1
  let lock1: ReentrantMutex = ReentrantMutex()
  let lock2: ReentrantMutex = ReentrantMutex()
  spawn{
    if(a == 1){
      synchronized(lock1) {
        synchronized(lock2) {
          println("lock1 -> lock2 lock.")
        }
      }
    }else{
      synchronized(lock2) {
        synchronized(lock1) {
          println("lock2 -> lock1 lock.")
        }
      }
    }
  }
  spawn{
    if(a != 1){
      synchronized(lock2) {
        synchronized(lock1) {
          println("lock2 -> lock1 lock.")
        }
      }
    }else{
      synchronized(lock1) {
        synchronized(lock2) {
          println("lock1 -> lock2 lock.")
        }
      }
    }
  }
  0
}
