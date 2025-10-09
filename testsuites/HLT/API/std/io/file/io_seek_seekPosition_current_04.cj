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
    var fileName = "current_04.txt"
    var arr: Array<Byte> = Array<Byte>(100, {i => UInt8(i % 256)})
    var file = File(fileName, ReadWrite)
    @Assert(exists(fileName), true)
    file.write(arr)
    var i = 1
    try {
        file.seek(Current(9223372036854775708))
    } catch (e: FSException) {
        i--
        //if (e.toString() != "FSException: Failed to seek: The offset may be outside the range allowed by the current file system.") {return 1}
    }
    file.close()
    remove(fileName)
    return i
}
