/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE:  pkga
// EXEC: %compiler %cmp_opt %compile_lib_opt pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt  %f pkga.%middle   -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkga.Test

let res = Test()
let res1 = res.x
let res2 = res.y

func run(): Int64 {
    if (res1 == 1 && res2 == 2) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
