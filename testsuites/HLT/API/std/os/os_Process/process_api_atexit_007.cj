/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not Windows) EXEC-PIPE: %compiler %cmp_opt -o %output %f
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args| compare %f
// (not Windows) ASSERT: scan-10000 callback1
import std.process.*

main() {
    var num = 10000
    for (i in 0..num) {
        Process.current.atExit(callback1)
    }
    return 0
}

func callback1(): Unit {
    println("callback1")
}
