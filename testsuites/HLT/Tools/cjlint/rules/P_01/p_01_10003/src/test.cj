import std.sync.ReentrantMutex

class A{
  public var right: ReentrantMutex = ReentrantMutex()
  public var left: ReentrantMutex = ReentrantMutex()
}

var l1 = A().left
var l2 = A().right

class Test{
  var lock1:Future<Int64> = spawn{
    synchronized(l1) {
      synchronized(l2) {
        println("left -> right lock.");
      }
    }
    0
  }

  var lock2:Future<Int64> = spawn{
    synchronized(l2) {
      synchronized(l1) {
        println("right -> left lock.");
      }
    }
    0
  }
}

main(): Int64 {
  Test().lock1.get()
  Test().lock2.get()
  return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
