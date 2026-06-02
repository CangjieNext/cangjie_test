/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ../pkga
// EXEC: %compiler %cmp_opt %compile_lib_opt pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package pkg

import pkga.TA

func run(): Int64 {
    var res: Int64 = TA().plus(TA(), TA())
    if (res == 3) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return run()
}
