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
// EXEC: %compiler %cmp_opt %f pkga.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkga.TimeUnit
import pkga

class TimeUnit {
    public static var Hour: Int32 = 3
}

func run(): Int64 {
    var timea = pkga.TimeUnit<Int32>.Hour(3)
    var res = TimeUnit.Hour
    var resa: Int32 = match (timea) {
        case Hour(x) => 2
    }
    if (res + resa == 5) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return run()
}
