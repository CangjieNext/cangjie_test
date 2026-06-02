/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkga/pkga.cj -o ./pkga.%middle
// EXEC: %compiler %cmp_opt %f  pkga.%middle -o %output
// RUN-EXEC: %run %run_opt %output  %run_args 

import pkga
import pkga.*

main(): Int64 {
    let a: Int32 = 1
    var b: Int32 = Data(a).get()
    Data(a).m--
    var c: Data = Data(a)
    c.m--
    pkga.Data(a).m--
    pkga.ext--
    print("n:" + Data.n.toString())
    if (b != 8) {
        return 1
    }
    if (c.m != 5) {
        return 2
    }
    if (pkga.ext != 0) {
        return 3
    }
    return 0
}
