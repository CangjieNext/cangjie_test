/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.ReentrantMutex

class Test{
  public let right: ReentrantMutex = ReentrantMutex()
  public let left: ReentrantMutex = ReentrantMutex()
  var lock1:Future<Int64> = spawn{1}
  var lock2:Future<Int64> = spawn{1}

  func foo(){
    lock1 = spawn{
      synchronized(left) {
        synchronized(right) {
          println("left -> right lock.");
        }
      }
      0
    }

    lock2 = spawn{
      synchronized(right) {
        synchronized(left) {
          println("right -> left lock.");
        }
      }
      0
    }
  }
}

main(): Int64 {
  Test().foo()
  Test().lock1.get()
  Test().lock2.get()
  return 0
}
