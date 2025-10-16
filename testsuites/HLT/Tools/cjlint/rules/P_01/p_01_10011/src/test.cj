import std.sync.ReentrantMutex

var lock1: ReentrantMutex = ReentrantMutex()
var lock2: ReentrantMutex = ReentrantMutex()
var lock3: ReentrantMutex = ReentrantMutex()
var lock4: ReentrantMutex = ReentrantMutex()
var lock5: ReentrantMutex = ReentrantMutex()

func lock1ToLock5(){
  let arrayTest: Array<Int64> =[0, 1, 2]
  try {
    synchronized(lock1) {
      synchronized(lock2) {
        println("lock1 -> lock2 lock.");
      }
    }

    synchronized(lock1) {
      synchronized(lock3) {
        println("lock1 -> lock3 lock.");
      }
    }

    synchronized(lock1) {
      synchronized(lock4) {
        println("lock1 -> lock4 lock.");
      }
    }

    synchronized(lock1) {
      synchronized(lock5) {
        println("lock1 -> lock5 lock.");
      }
    }
    let lastElement = arrayTest[3]
  } catch (_) {}

  {
    synchronized(lock2) {
      synchronized(lock3) {
        println("lock2 -> lock3 lock.");
      }
    }

    synchronized(lock2) {
      synchronized(lock4) {
        println("lock2 -> lock4 lock.");
      }
    }

    synchronized(lock1) {
      synchronized(lock2) {
        synchronized(lock3) {
          synchronized(lock4) {
            synchronized(lock5) {
              println("lock1 -> lock2 -> lock3 -> lock4 -> lock5 lock.");
            }
          }
        }
      }
    }

    synchronized(lock2) {
      synchronized(lock5) {
        println("lock2 -> lock5 lock.");
      }
    }

    synchronized(lock3) {
      synchronized(lock1) {
        println("lock1 -> lock2 lock.");
      }
    }

    synchronized(lock3) {
      synchronized(lock2) {
        synchronized(lock4) {
          synchronized(lock1) {
            synchronized(lock5) {
              println("lock3 -> lock2 -> lock4 -> lock1 -> lock5 lock.");
            }
          }
        }
      }
    }
  }()
}

main(): Int64 {
  for (i in 0..10) {
    spawn {
      lock1ToLock5()
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
