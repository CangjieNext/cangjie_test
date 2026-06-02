/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not Windows) EXEC-PIPE: %compiler %cmp_opt -o %output %f
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args| compare %f
// (not Windows) ASSERT: scan-begin callback3
// (not Windows) ASSERT: scan-next callback2
// (not Windows) ASSERT: scan-next callback1

import std.process.*

main() {
    Process.current.atExit(callback1)
    Process.current.atExit(callback2)
    Process.current.atExit(callback3)
    return 0
}

func callback1(): Unit {
    println("callback1")
}

func callback2(): Unit {
    println("callback2")
}

func callback3(): Unit {
    println("callback3")
}
