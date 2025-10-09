import std.sync.ReentrantMutex

public class Test {
  public static var lock1: ReentrantMutex = ReentrantMutex()
  public static var lock2: ReentrantMutex = ReentrantMutex()
  public static var lock3: ReentrantMutex = ReentrantMutex()
  public static var lock4: ReentrantMutex = ReentrantMutex()
  public static var lock5: ReentrantMutex = ReentrantMutex()
}

var l1 = Test.lock1
var l2 = Test.lock2
var l3 = Test.lock3
var l4 = Test.lock4
var l5 = Test.lock5

func lock1ToLock5(){
  synchronized(l1) {
    synchronized(l2) {
      println("lock1 -> lock2 lock.");
    }
  }

  synchronized(l2) {
    synchronized(l3) {
      println("lock2 -> lock3 lock.");
    }
  }

  synchronized(l3) {
    synchronized(l4) {
      println("lock3 -> lock4 lock.");
    }
  }

  synchronized(l4) {
    synchronized(l5) {
      println("lock4 -> lock5 lock.");
    }
  }

  synchronized(l1) {
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
}

func lock5ToLock1(){
  synchronized(l5) {
    synchronized(l4) {
      println("lock5 -> lock4 lock.");
    }
  }

  synchronized(l4) {
    synchronized(l3) {
      println("lock4 -> lock3 lock.");
    }
  }

  synchronized(l3) {
    synchronized(l2) {
      println("lock3 -> lock2 lock.");
    }
  }

  synchronized(l2) {
    synchronized(l1) {
      println("lock2 -> lock1 lock.");
    }
  }

  synchronized(l5) {
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
}

main(): Int64 {
  for (i in 0..10) {
    spawn {
      lock5ToLock1()
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
