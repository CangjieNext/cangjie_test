/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: b
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan [49, 50, 51, 52, 53, 54, 55, 56, 57]
import std.io.*
import std.fs.*

main() {
    var fs1 = File("./b/b_04_file_03.txt", ReadWrite)
    var b1: Array<UInt8> = Array<UInt8>(9, {i => 1})
    fs1.read(b1)
    print("${b1}")
    return 0
}
