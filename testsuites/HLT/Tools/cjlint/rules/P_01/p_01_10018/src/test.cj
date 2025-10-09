import std.sync.ReentrantMutex

main(): Int64 {
  let a = {
    => var lock1: ReentrantMutex = ReentrantMutex()
    var lock2: ReentrantMutex = ReentrantMutex()

    synchronized(lock1) {
      synchronized(lock2) {println("lock1 -> lock2 lock.");}
    }
    synchronized(lock2) {
      synchronized(lock1) {println("lock2 -> lock1 lock.");}
    }

    synchronized(lock1) {
      synchronized(lock1) {println("lock1 -> lock1 lock.");}
    }

    synchronized(lock2) {
      synchronized(lock2) {println("lock2 -> lock2 lock.");}
    }

    synchronized(lock1) {
      synchronized(lock2) {
        synchronized(lock1) {
          println("lock1 -> lock2 -> lock1 lock.")
        }
      }
    }
  }

  let b = {
    => var lock1: ReentrantMutex = ReentrantMutex()
    var lock2: ReentrantMutex = ReentrantMutex()

    synchronized(lock1) {
      synchronized(lock2) {println("lock1 -> lock2 lock.");}
    }
    synchronized(lock2) {
      synchronized(lock1) {println("lock2 -> lock1 lock.");}
    }

    synchronized(lock1) {
      synchronized(lock1) {println("lock1 -> lock1 lock.");}
    }

    synchronized(lock2) {
      synchronized(lock2) {println("lock2 -> lock2 lock.");}
    }

    synchronized(lock2) {
      synchronized(lock1) {
        synchronized(lock2) {
          println("lock2 -> lock1 -> lock2 lock.")
        }
      }
    }
  }
  spawn{a()}
  spawn{b()}
  0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
