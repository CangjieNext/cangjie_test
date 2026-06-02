/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkga/pkga.cj -o pkga.%middle 
// EXEC-PIPE-0: %compiler %cmp_opt %f pkga.%middle -o %output 2>&1

import pkga as A

func run(): Int64 {
    var time = A.TimeUnit<Int32>.Hour(3)
    var res: Int32 = match (time) {
        case Hour(x) => x - 1
    }
    if (res == 2) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return run()
}
