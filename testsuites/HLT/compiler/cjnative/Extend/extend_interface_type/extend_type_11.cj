/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: extend_pkg_01.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt extend_pkg_01.cj -o extend_pkg_01.%middle  
// EXEC: %compiler %cmp_opt %f extend_pkg_01.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import p1.*

interface I1<T1> {}

interface I2<T2> {}

extend B <: I1<Int64> & I2<Int64> {}

main() {
    let ins: I1<Int64> = B()
    if (!(ins is B)) {
        return 1
    }
    if (!(ins is A)) {
        return 1
    }

    if (!(ins is I2<Int64>)) {
        return 1
    }
    return 0
}
