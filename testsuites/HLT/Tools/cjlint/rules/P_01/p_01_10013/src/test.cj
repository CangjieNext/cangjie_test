/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.ReentrantMutex

public class Test {
  public var lock1: ReentrantMutex = ReentrantMutex()
  public var lock2: ReentrantMutex = ReentrantMutex()
  public var lock3: ReentrantMutex = ReentrantMutex()
  public var lock4: ReentrantMutex = ReentrantMutex()
  public var lock5: ReentrantMutex = ReentrantMutex()
}

main(): Int64 {
  synchronized(Test().lock1) {
    synchronized(Test().lock2) {
      println("lock1 -> lock2 lock.");
    }
  }

  synchronized(Test().lock2) {
    synchronized(Test().lock3) {
      println("lock2 -> lock3 lock.");
    }
  }

  synchronized(Test().lock3) {
    synchronized(Test().lock4) {
      println("lock3 -> lock4 lock.");
    }
  }

  synchronized(Test().lock4) {
    synchronized(Test().lock5) {
      println("lock4 -> lock5 lock.");
    }
  }

  synchronized(Test().lock1) {
    synchronized(Test().lock2) {
      synchronized(Test().lock3) {
        synchronized(Test().lock4) {
          synchronized(Test().lock5) {
            println("lock1 -> lock2 -> lock3 -> lock4 -> lock5 lock.");
          }
        }
      }
    }
  }

  synchronized(Test().lock5) {
    synchronized(Test().lock4) {
      println("lock5 -> lock4 lock.");
    }
  }

  synchronized(Test().lock4) {
    synchronized(Test().lock3) {
      println("lock4 -> lock3 lock.");
    }
  }

  synchronized(Test().lock3) {
    synchronized(Test().lock2) {
      println("lock3 -> lock2 lock.");
    }
  }

  synchronized(Test().lock2) {
    synchronized(Test().lock1) {
      println("lock2 -> lock1 lock.");
    }
  }

  synchronized(Test().lock5) {
    synchronized(Test().lock4) {
      synchronized(Test().lock3) {
        synchronized(Test().lock3) {
          synchronized(Test().lock1) {
            println("lock5 -> lock4 -> lock3 -> lock2 -> lock1 lock.");
          }
        }
      }
    }
  }
  0
}
