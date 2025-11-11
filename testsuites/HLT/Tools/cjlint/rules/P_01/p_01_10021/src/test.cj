/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.ReentrantMutex

var right: ReentrantMutex = ReentrantMutex()
var left: ReentrantMutex = ReentrantMutex()
var third: ReentrantMutex = ReentrantMutex()

var lock1:Future<Int32> = spawn{
  synchronized(left) {
    synchronized(right) {
      println("left -> right lock.");
    }
  }
  0
}

var lock2:Future<Int32> = spawn{
  synchronized(right) {
    synchronized(third) {
      println("right -> third lock.");
    }
  }
  0
}

main(): Int64 {
  0
}
