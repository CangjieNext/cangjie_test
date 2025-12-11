/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.io.*
import std.posix.*
import std.fs.*

main() {
    var path: String = "mydic/mytest"
    var curdir = getcwd()
    var exppath = curdir + "/mydic/mytest"
    try {
        var file: FileInfo = FileInfo(path)
        var result = canonicalize(file.path).toString()
    } catch (e: FSException) {
        if (e.toString().contains("FSException: The input path `mydic/mytest` does not exist")) {
            return 0
        }
        return 2
    }
    return 1
}
