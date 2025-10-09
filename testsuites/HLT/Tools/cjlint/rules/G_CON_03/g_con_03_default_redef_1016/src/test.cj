import std.sync.ReentrantMutex

var arr: Array<Int64> = [1,2]

open class Base {
  private static let BASEMTX: ReentrantMutex = ReentrantMutex()
  public static func doSomething(): Unit {
    synchronized(BASEMTX) {

    }
  }
}
class Derived <: Base {
  private static let MTX: ReentrantMutex = ReentrantMutex()
  public redef static func doSomething(): Unit {
    synchronized(MTX) {
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
