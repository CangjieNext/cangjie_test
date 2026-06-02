// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*

main(): Int64 {
    let tt = quote(var a = ##"
        aa
    "##)
    let tt_bytes = tt.toBytes()
    for (t in tt) {
        let t_bytes = t.toBytes()
        for (i in 0..t_bytes.size) {
            print("${t_bytes[i]} ")
        }
        println()
    }
    return 0
}

/* SCAN-IN
92 0 3 0 0 0 118 97 114 1 0 0 0 7 0 0 0 20 0 0 0 0 0 
137 0 1 0 0 0 97 1 0 0 0 7 0 0 0 24 0 0 0 0 0 
30 0 1 0 0 0 61 1 0 0 0 7 0 0 0 26 0 0 0 0 0 
150 0 16 0 0 0 10 32 32 32 32 32 32 32 32 97 97 10 32 32 32 32 1 0 0 0 7 0 0 0 28 0 0 0 0 0 2 0 
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
