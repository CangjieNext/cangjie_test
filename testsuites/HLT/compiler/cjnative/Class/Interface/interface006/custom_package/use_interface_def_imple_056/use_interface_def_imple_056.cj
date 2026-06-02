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
    var struct1: faterInterface<UInt16> = myStruct<MyInterface<UInt16>>()
    var struct2: MyInterface<UInt16> = myStruct<MyInterface<UInt16>>()
    var struct3: myStruct<MyInterface<UInt16>> = myStruct<MyInterface<UInt16>>()

    if (struct1.foo2() == 20 && struct1.foo3() == 20 && struct2.foo2() == 20 && struct2.foo3() == 20 &&
        struct3.foo2() == 20 && struct3.x == 20) {
        return 0
    } else {
        return 1
    }
}
