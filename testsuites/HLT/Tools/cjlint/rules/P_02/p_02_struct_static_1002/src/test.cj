import std.sync.ReentrantMutex

struct Demo{
  static var res: Bool = true
}

public func test(): Unit {
  let m1: ReentrantMutex = ReentrantMutex()
  spawn {
    m1.lock()
    print("${Demo.res}")
    m1.unlock()
  }
  spawn {
    m1.lock()
    Demo.res = true
    m1.unlock()
  }
}

main(): Int64 {
  return 1
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
