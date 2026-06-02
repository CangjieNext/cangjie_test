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
    let path = "/nonexist_dir/just_for_test/nonexist/b/b_05_file_06_bcz.txt"
    try {
        var fs1 = File(path, Write)
        ()
    } catch (e: FSException) {
        println(e)
        if (e.toString() == "FSException: The file `${path}` does not exist or permission denied!" || e.toString() ==
            "FSException: The input path 'parent' `/nonexist_dir/just_for_test/nonexist/b` does not exist.") {
            return 0
        }
    }
    return 1
}
