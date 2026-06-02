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
// ASSERT: scan [49, 50, 51, 52, 53, 54, 55, 56, 57, 58]
import std.io.*
import std.fs.*

main() {
    var fileName = "./b/b_05_file_04.txt"
    var fs = File(fileName, ReadWrite)
    fs.close()
    var fs2 = File(fileName, Write)
    var b2: Array<UInt8> = [49, 50, 51, 52, 53, 54, 55, 56, 57, 58]
    fs2.write(b2)
    fs2.close()
    var fs1 = File(fileName, Read)
    var b1: Array<UInt8> = Array<UInt8>(10, {i => 1})
    fs1.read(b1)
    print("${b1}")
    fs1.close()
    return 0
}
