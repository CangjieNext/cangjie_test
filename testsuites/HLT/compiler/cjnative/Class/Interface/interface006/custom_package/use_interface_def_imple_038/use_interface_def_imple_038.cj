/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: pkg1
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg1/a.cj -o pkg1.%middle
// EXEC: %compiler %cmp_opt %f pkg1.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkg1.*

main() {
    var enum1: faterInterface<Int64> = myEnum.A
    var enum2: MyInterface<Int64> = myEnum.A
    var enum3: myEnum = myEnum.A

    enum1.b1 = 1
    enum2.b2 = 2

    if (enum1.b1 == 1 && enum2.b2 == 2 && p1 == 1 && p2 == 2) {
        enum3.b1 = 3
        enum3.b2 = 4
        if (enum3.b1 == 1 && enum3.b2 == 2 && p1 == 3 && p2 == 4) {
            return 0
        }
    }
    return 1
}
