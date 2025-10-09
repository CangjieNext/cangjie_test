// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.sync.*

public class Test {
  public static var lock1: ReentrantMutex = ReentrantMutex()
  public var lock2: ReentrantMutex = ReentrantMutex()
}

var l1 = Test.lock1
var l2 = Test().lock2

func foo(){
  spawn{
    synchronized(l1) {
      synchronized(l2) {
        println("seq 1");
      }
    }

    synchronized(l2) {
      synchronized(l1) {
        println("seq 2");
      }
    }
  }

  spawn{
    synchronized(l1) {
      synchronized(l2) {
        println("seq 1");
      }
    }

    synchronized(l2) {
      synchronized(l1) {
        println("seq 2");
      }
    }
  }

  synchronized(l1) {
    synchronized(l2) {
      synchronized(l1) {
        println("seq 3");
      }
    }
  }

  synchronized(l2) {
    synchronized(l1) {
      synchronized(l2) {
        println("seq 4");
      }
    }
  }
}

main(): Int64 {
  foo()
  synchronized(l1) {
    synchronized(l2) {
      println("seq 1");
    }
  }

  synchronized(l2) {
    synchronized(l1) {
      println("seq 2");
    }
  }

  synchronized(l1) {
    synchronized(l2) {
      synchronized(l1) {
        println("seq 3");
      }
    }
  }

  synchronized(l2) {
    synchronized(l1) {
      synchronized(l2) {
        println("seq 4");
      }
    }
  }
  0
}
