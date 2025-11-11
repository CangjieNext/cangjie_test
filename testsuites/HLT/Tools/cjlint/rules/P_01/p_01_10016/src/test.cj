/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.ReentrantMutex

struct Test{
  public var lock1: ReentrantMutex = ReentrantMutex()
  public var lock2: ReentrantMutex = ReentrantMutex()
}

var l1 = Test().lock1
var l2 = Test().lock2

struct A{

  var s1 = spawn{
    synchronized(l1) {
      synchronized(l2) {
        println("lock1 -> lock2 lock.");
      }
    }
    synchronized(l2) {
      synchronized(l1) {
        println("lock2 -> lock1 lock.");
      }
    }

    synchronized(l2) {
      synchronized(l1) {
        println("lock2 -> lock1 lock.");
      }
      synchronized(l2) {
        println("lock2 -> lock2 lock.");
      }
    }

    synchronized(l1) {
      synchronized(l1) {
        println("lock1 -> lock1 lock.");
      }
      synchronized(l2) {
        println("lock1 -> lock2 lock.");
      }
    }

    synchronized(l1) {
      synchronized(l2) {
        synchronized(l1) {
          println("lock1 -> lock2 -> lock1 lock.");
        }
      }
    }
  }

  static var s2 = spawn{
    synchronized(l1) {
      synchronized(l2) {
        println("lock1 -> lock1 lock.");
      }
    }
    synchronized(l2) {
      synchronized(l1) {
        println("lock2 -> lock1 lock.");
      }
    }
    
    synchronized(l2) {
      synchronized(l1) {
        println("lock2 -> lock1 lock.");
      }
      synchronized(l2) {
        println("lock2 -> lock2 lock.");
      }
    }

    synchronized(l1) {
      synchronized(l1) {
        println("lock1 -> lock1 lock.");
      }
      synchronized(l2) {
        println("lock1 -> lock2 lock.");
      }
    }

    synchronized(l2) {
      synchronized(l1) {
        synchronized(l2) {
          println("lock2 -> lock1 -> lock2 lock.");
        }
      }
    }
  }
}

main(): Int64 {
  A().s1
  A.s2
  0
}
