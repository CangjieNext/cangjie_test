import std.sync.ReentrantMutex

var res: Int64 = 0
let baseMtx: ReentrantMutex = ReentrantMutex()

interface Base {
  static func doSomething() {
    synchronized(baseMtx) {
    }
  }
}

class Derived{}

extend Derived <: Base {
  public static func doSomething() {
    let mtx: ReentrantMutex = ReentrantMutex()
    synchronized(mtx) {
      res++
    }
  }
}

main(){0}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
