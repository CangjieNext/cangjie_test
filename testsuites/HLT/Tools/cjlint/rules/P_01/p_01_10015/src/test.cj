import std.sync.ReentrantMutex

struct Test{
  public static var lock1: ReentrantMutex = ReentrantMutex()
  public static var lock2: ReentrantMutex = ReentrantMutex()
  public static var lock3: ReentrantMutex = ReentrantMutex()
  public static var lock4: ReentrantMutex = ReentrantMutex()
  public static var lock5: ReentrantMutex = ReentrantMutex()
}



class A{
  func foo(){
    var l1 = Test.lock1
    var l2 = Test.lock2
    var l3 = Test.lock3
    var l4 = Test.lock4
    var l5 = Test.lock5

    var s1 = synchronized(l1) {
      synchronized(l2) {
        println("lock1 -> lock2 lock.");
      }
    }

    var s2 = synchronized(l2) {
      synchronized(l3) {
        println("lock2 -> lock3 lock.");
      }
    }

    var s3 = synchronized(l3) {
      synchronized(l4) {
        println("lock3 -> lock4 lock.");
      }
    }

    var s4 = synchronized(l4) {
      synchronized(l5) {
        println("lock4 -> lock5 lock.");
      }
    }

    var s5 = synchronized(l1) {
      synchronized(l2) {
        synchronized(l3) {
          synchronized(l4) {
            synchronized(l5) {
              println("lock1 -> lock2 -> lock3 -> lock4 -> lock5 lock.");
            }
          }
        }
      }
    }

    {
      var s6 = synchronized(l5) {
        synchronized(l4) {
          println("lock5 -> lock4 lock.");
        }
      }

      var s7 = synchronized(l4) {
        synchronized(l3) {
          println("lock4 -> lock3 lock.");
        }
      }

      var s8 = synchronized(l3) {
        synchronized(l2) {
          println("lock3 -> lock2 lock.");
        }
      }

      var s9 = synchronized(l2) {
        synchronized(l1) {
          println("lock2 -> lock1 lock.");
        }
      }

      var s10 = synchronized(l5) {
        synchronized(l4) {
          synchronized(l3) {
            synchronized(l3) {
              synchronized(l1) {
                println("lock5 -> lock4 -> lock3 -> lock2 -> lock1 lock.");
              }
            }
          }
        }
      }
    }()
  }
}

main(): Int64 {
  for (i in 0..10) {
    spawn {
      A().foo()
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
