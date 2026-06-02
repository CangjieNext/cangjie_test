/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE:  b
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan [49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 65]
import std.io.*
import std.fs.*

main() {
    var fileName = "./b/b_05_file_01_cz.txt"
    var fs1 = File(fileName, OpenMode.Append)
    var b1: Array<UInt8> = [65, 66, 67, 68, 69, 65]
    fs1.write(b1)
    fs1.close()
    var fs2 = File(fileName, Read)
    var b2: Array<UInt8> = Array<UInt8>(15, {i => 1})
    fs2.read(b2)
    print("${b2}")
    return 0
}
