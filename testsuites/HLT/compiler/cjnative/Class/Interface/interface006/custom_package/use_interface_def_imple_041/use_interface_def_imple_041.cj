/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: pkg1 pkg2
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg1/a.cj -o pkg1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg2/b.cj pkg1.%middle -o pkg2.%middle
// EXEC: %compiler %cmp_opt %f pkg1.%middle pkg2.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkg1.*
import pkg2.*

main() {
    var enum1: faterInterface<Int64> = myEnum.A
    var enum2: MyInterface<UInt16> = myEnum.A
    var enum3: myEnum = myEnum.A

    if (enum1.b == 3 && enum2.b == 3 && enum3.b == 3) {
        return 0
    } else {
        return 1
    }
}
