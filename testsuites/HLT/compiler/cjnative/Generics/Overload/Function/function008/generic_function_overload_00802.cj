/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: b.cj b.cfg
// EXEC: %compiler %cmp_opt %compile_lib_opt b.cj -o b.%middle
// EXEC: %compiler %cmp_opt %f  b.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args
package pkg802

import b.*

public func test<T>(a: T) {
    return 2
}

main(): Int64 {
    var I = test(Int64(1))
    if (I != 2) {
        return 1
    }
    return 0
}
