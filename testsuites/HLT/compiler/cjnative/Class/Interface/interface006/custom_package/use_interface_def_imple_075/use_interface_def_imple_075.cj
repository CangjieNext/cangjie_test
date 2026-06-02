/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: pkg1
// ERRCHECK: %compiler %cmp_opt %compile_lib_opt pkg1/a.cj -o pkg1.%middle

import pkg1.*

main() {
    var u1: faterInterface1<Rune> = UInt16(1)
    var u2: MyInterface2<Bool> = UInt16(1)
    var u3: MyInterface3 = UInt16(1)
    var u4: UInt16 = 1

    if (u1.foo([A()])[0] is A && u2.foo([A()]) is A && u3.foo([A()])[0] is A /* && u4.foo([A()]) is A */ ) {
        return 0
    } else {
        return 1
    }
}
// ASSERT: scan sema_interface_member_must_be_implemented
