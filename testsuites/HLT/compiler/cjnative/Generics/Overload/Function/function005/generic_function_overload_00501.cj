/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: a.cj a.cfg
// EXEC: %compiler %cmp_opt %compile_lib_opt a.cj -o a.%middle
// EXEC: %compiler %cmp_opt %f  a.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args
package pkg501

import a

main(): Int64 {
    var i = a.test(1)
    var j = a.test(true)
    var k = a.test(Int32(2))
    if (i != 1) {
        print("i is not 1\n")
        return 1
    }
    if (j != 2) {
        print("j is not 2\n")
        return 2
    }
    if (k != 2) {
        print("k is not 2\n")
        return 3
    }
    return 0
}
