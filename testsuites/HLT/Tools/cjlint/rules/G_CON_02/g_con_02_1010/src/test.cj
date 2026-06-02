/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.*

let mtx: ReentrantMutex = ReentrantMutex()

func f(a1: (Int64) -> Int64): Int64 {
  a1(0)
}

main(): Int64 {
  return f({a2: Int64 =>
    try {
        mtx.lock()
    } catch (_) {
        mtx.unlock()
    }
    return a2
  })
}


