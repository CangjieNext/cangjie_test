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
    var u1: MyInterface1<UIntNative> = Some(1)
    var u2: MyInterface2<UIntNative> = Some(1)
    var u3: MyInterface3<UIntNative> = Some(1)
    var u4: Option<Rune> = Some(r'1')

    if (u1.foo1(1) == 1 && u2.foo2(1) == 1 && u3.foo3(1) == 1 && u4.foo1(1) == 1 && u4.foo2(1) == 1 && u4.foo3(1) == 1) {
        return 0
    } else {
        return 1
    }
}
