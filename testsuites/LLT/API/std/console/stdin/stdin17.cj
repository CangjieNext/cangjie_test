/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %stdx-package -o %output %f
// (Unix) RUN-EXEC-PIPE-0: echo "abcdefg" | %run %run_opt %output %run_args 2>&1 | compare %f
// (Windows) RUN-EXEC-PIPE-0: echo abcdefg | %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 2
// ASSERT: scan 5
// ASSERT: scan [99, 100, 101, 102, 103]

internal import std.console.*

main() {
    try {
        var arr: Array<Byte> = Array(2, repeat: 0)
        var arr2: Array<Byte> = Array(5, repeat: 0)
        let c = Console.stdIn.read(arr)
        println(c)
        let d = Console.stdIn.read(arr2)
        println(d)
        println(arr2)
    } catch (e: NoneValueException) {
        print(e)
    }
    return 0
}
