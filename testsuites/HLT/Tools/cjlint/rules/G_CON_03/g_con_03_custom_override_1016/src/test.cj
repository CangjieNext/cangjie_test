import a.Base
import std.sync.ReentrantMutex

class Derived <: Base {
  private let mtx: ReentrantMutex = ReentrantMutex()
  public override func doSomething(): Unit {
    synchronized(mtx) {
      arr = [1,2]
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
