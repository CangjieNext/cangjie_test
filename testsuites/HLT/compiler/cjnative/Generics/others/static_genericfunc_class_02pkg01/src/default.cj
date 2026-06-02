/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: pkga
// EXEC: %compiler %cmp_opt %compile_lib_opt pkga/a.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkga.Coo

main(): Int64 {
    var i: Int32 = 3
    var a: Option<String> = Coo<String>.foo<Int32>(i)
    var res = match (a) {
        case Some(x) => x
        case None => "No"
    }
    if (res != "No") {
        return 1
    }
    return 0
}
