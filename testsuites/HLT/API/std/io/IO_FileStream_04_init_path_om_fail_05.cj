/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.io.*
import std.fs.*

main(): Int64 {
    try {
        var fileName = "/nonexist_dir/just_for_test/nonexist/b/B/b_file_01_cz.txt"
        var fs1 = File(fileName, ReadWrite) //目录不存在
        ()
    } catch (e: FSException) {
        if (e.toString() !=
            "FSException: The input path 'parent' `/nonexist_dir/just_for_test/nonexist/b/B` does not exist.") {
            return 1
        }
    }
    return 0
}
