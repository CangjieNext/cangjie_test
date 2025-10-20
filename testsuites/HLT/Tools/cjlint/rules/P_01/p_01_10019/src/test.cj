import std.sync.ReentrantMutex

main(): Int64 {
  var lock1: ReentrantMutex = ReentrantMutex()
  var lock2: ReentrantMutex = ReentrantMutex()
  var lock3: ReentrantMutex = ReentrantMutex()
  var lock4: ReentrantMutex = ReentrantMutex()
  var lock5: ReentrantMutex = ReentrantMutex()
  var a = 3

  let b = while (a>1){
    synchronized(lock1) {
      synchronized(lock2) {
        println("lock1 -> lock2 lock.");
      }
    }

    synchronized(lock2) {
      synchronized(lock3) {
        println("lock2 -> lock3 lock.");
      }
    }

    synchronized(lock3) {
      synchronized(lock4) {
        println("lock3 -> lock4 lock.");
      }
    }

    synchronized(lock4) {
      synchronized(lock5) {
        println("lock4 -> lock5 lock.");
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

    {
      synchronized(lock5) {
        synchronized(lock4) {
          println("lock5 -> lock4 lock.");
        }
      }

      synchronized(lock4) {
        synchronized(lock3) {
          println("lock4 -> lock3 lock.");
        }
      }

      synchronized(lock3) {
        synchronized(lock2) {
          println("lock3 -> lock2 lock.");
        }
      }

      synchronized(lock2) {
        synchronized(lock1) {
          println("lock2 -> lock1 lock.");
        }
      }

      synchronized(lock5) {
        synchronized(lock4) {
          synchronized(lock3) {
            synchronized(lock2) {
              synchronized(lock1) {
                println("lock5 -> lock4 -> lock3 -> lock2 -> lock1 lock.");
              }
            }
          }
        }
      }
    }()
    a--
  }
  for (i in 0..10) {
    spawn {
      b
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
