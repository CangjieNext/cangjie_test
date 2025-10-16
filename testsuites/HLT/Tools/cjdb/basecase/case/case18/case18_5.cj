/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.*

var count: Int64 = 0
let mtx = ReentrantMutex()

main(): Int64 {
    let fut = synchronized(mtx) {
        count++
    }
    println("count = ${count}")
    return 0
}
