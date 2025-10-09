import std.sync.*

class A{
  private static let mtx: ReentrantMutex = ReentrantMutex()
  static func foo(){
    try {
        mtx.lock()
    } catch (_) {
        mtx.unlock()
    }
    return 0
  }
}

main(){
  return A.foo()
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
