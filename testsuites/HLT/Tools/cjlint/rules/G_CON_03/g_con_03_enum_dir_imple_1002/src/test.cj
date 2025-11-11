/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.ReentrantMutex

var res: Int64 = 0
let baseMtx: ReentrantMutex = ReentrantMutex()
let mtx: ReentrantMutex = ReentrantMutex()

interface Base {
  static func doSomething() {
    synchronized(baseMtx) {
    }
  }
}
enum Derived <: Base {
  A
  public static func doSomething() {
    synchronized(mtx) {
      res++
    }
  }
}

main(){0}


