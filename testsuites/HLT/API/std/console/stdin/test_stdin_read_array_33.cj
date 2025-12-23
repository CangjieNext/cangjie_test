/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt -o %output %f
// (not iOS) RUN-EXEC-PIPE-0: echo ☸❁❀✿✾❃✺❇❈❊> input.txt && %run %run_opt %output %run_args < input.txt 2>&1 | compare %f
// ASSERT: scan 31
// (not Windows or OHOS) ASSERT: scan [226, 152, 184, 226, 157, 129, 226, 157, 128, 226, 156, 191, 226, 156, 190, 226, 157, 131, 226, 156, 186, 226, 157, 135, 226, 157, 136, 226, 157, 138, 10]
// (Windows and not OHOS) ASSERT: scan [226, 152, 184, 226, 157, 129, 226, 157, 128, 226, 156, 191, 226, 156, 190, 226, 157, 131, 226, 156, 186, 226, 157, 135, 226, 157, 136, 226, 157, 138, 32]
import std.console.*

main() {
    var arr: Array<Byte> = Array(31, repeat: 0)
    let c = Console.stdIn.read(arr)
    println(c)
    println(arr)
    return 0
}
