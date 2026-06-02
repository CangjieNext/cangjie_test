/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: caserunner.cj b
// EXEC: %compiler %cmp_opt %f caserunner.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.io.*
import std.fs.*

main(): Int64 {
    try {
        var fs1 = File("./b/", ReadWrite) //Directory existed but can't open ,throw FSException
        ()
    } catch (e: FSException) {
        if (!e.toString().contains("FSException: Failed to open the file")) {
            return 1
        }
    }
    return 0
}
