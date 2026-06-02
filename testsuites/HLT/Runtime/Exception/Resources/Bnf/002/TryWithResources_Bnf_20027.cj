/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./../../../../../API/asan
// EXEC: %compiler %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %cmp_opt %f asan.%middle -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan try!
// ASSERT: scan close!
// ASSERT: scan success!

import std.sync.*
import asan.*

class A <: Resource {
    public func isClosed():Bool{
        false
    }
    public func close():Unit {
        print("close!")
    }
}

let m = ReentrantMutex()

main() {
    try (a = synchronized(m) {
        A()
    }) {
        print("try!\n")
    }
    print("success!\n")
    asanGC()
    return 0
}
