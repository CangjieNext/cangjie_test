/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.ReentrantMutex

var num: Int64 = 1

open class Base {
  private let baseMtx: ReentrantMutex = ReentrantMutex()
  public open func doSomething() {
    synchronized(baseMtx) {

    }
  }
}
class Derived <: Base {
  public override func doSomething() {
    num++
  }
}

main(){0}


