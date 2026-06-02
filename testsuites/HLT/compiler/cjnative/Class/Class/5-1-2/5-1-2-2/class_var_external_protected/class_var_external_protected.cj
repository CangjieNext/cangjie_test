/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: pkg
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg/pkg.cj -o pkg.%middle
// EXEC: %compiler %cmp_opt %f pkg.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package class_var_public_protected

import pkg.*

class Data <: Base {
    public var res: Int64
    public init() {
        res = a
    }
}

func run(): Int64 {
    var test: Int64 = Data().res
    if (test != 1) {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}
