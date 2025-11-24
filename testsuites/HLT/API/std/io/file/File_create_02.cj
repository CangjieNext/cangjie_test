/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args

import std.io.*
import std.fs.*

main() {
    var fileName = "create_02.txt"
    var file = File(fileName, Write)
    file.close()
    try {
        var file1 = File.create(fileName)
    } catch (e: FSException) {
        if (e.toString() != "FSException: The file `${fileName}` is already exists!") {
            return 1
        }
    }
    remove(fileName)
    return 0
}
