// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import std.sync.ReentrantMutex

let m1: ReentrantMutex = ReentrantMutex()
let m2: ReentrantMutex = ReentrantMutex()
var a = 1
main(): Int64 {
  spawn {
    m1.lock()
    a = 1
    m1.unlock()
  }
  spawn {
    m2.lock()
    a = 1
    m2.unlock()
  }
  0
}
