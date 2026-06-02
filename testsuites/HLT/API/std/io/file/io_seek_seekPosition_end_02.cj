/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.io.*
import std.fs.*

main() {
    var fileName = "End_02.txt"
    var mess = "FSException: Failed to seek: The offset may be outside the range allowed by the current file system."
    var file = File(fileName, ReadWrite)
    @Assert(exists(fileName), true)
    var arr: Array<Byte> = Array<Byte>(10, {i => UInt8(i % 256)})
    var i = 2
    try {
        file.seek(End(-1))
    } catch (e: FSException) {
        //if (e.toString() != mess) {return 1}
        i--
    }
    file.write(arr)
    try {
        file.seek(End(-11))
    } catch (e: FSException) {
        //if (e.toString() != mess) {return 2}
        i--
    }
    file.close()
    remove(fileName)

    return i
}
