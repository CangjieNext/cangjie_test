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
    var c1: fatherInterface<Int32> = myClass()
    var c2: MyInterface<Int32> = myClass()
    var c3: myClass = myClass()
    c3.foo2(0..10)
    if (arr[c1.foo2(0..10)].size == 3 && c1.foo3() == 2 && arr[c2.foo2(0..10)][2] == 3 && c2.foo3() == 2 && c3.x == 2) {
        return 0
    } else {
        return 1
    }
}
