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

package pkg801

import a.*

public func test(a: Int64) {
    return 2
}

main(): Int64 {
    var I = test(1)
    if (I != 2) {
        return 1
    }
    return 0
}
