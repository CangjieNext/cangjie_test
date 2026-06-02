/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkga.*

main(): Int64 {
    var i: Int32 = 90
    var result = match (i) {
        case grade => test(grade)
    }
    if (result == "good") {
        return 0
    }
    return 1
}
