/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not Windows and not MAC) EXEC: %compiler %compilation_options %extra_options %lto_options %sanitizer_options %mock_options %optimization_options %debug_options --static %overflow_wrapping %f -o %output
// (not Windows and not MAC) RUN-EXEC-PIPE: unset LD_LIBRARY_PATH && %output %run_args | compare %f
// ASSERT:scan Tick at: 

import std.sync.*
import std.time.*

var count: Int64 = 0
let mtx = ReentrantMutex()

main(): Int64 {
    let start = MonoTime.now()

    for (i in 0..1000000) {
        synchronized(mtx) {
            count++
        }
    }

    println("count = ${count}")
    println("Tick at: ${MonoTime.now() - start}")
    return 0
}
