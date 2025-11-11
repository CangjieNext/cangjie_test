/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.ReentrantMutex

var str: String = "test"

open class Base {
  private static let baseMtx: ReentrantMutex = ReentrantMutex()
  public static func doSomething() {
    synchronized(baseMtx) {

    }
  }
}
class Derived <: Base {
  public redef static func doSomething() {
    str = "test"
  }
}

main(){0}


