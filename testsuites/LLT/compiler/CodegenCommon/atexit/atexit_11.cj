// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-begin CJC
// ASSERT: scan-next AAA
// ASSERT: scan-next BBB

internal import std.process.*

func callback1(): Unit {
    println("CJC")
}

func callback2(): Unit {
    println("AAA")
    Process.current.atExit(callback1)
    println("BBB")
}

main() {
    Process.current.atExit(callback2)
    Process.current.atExit(callback1)
    return 0
}
