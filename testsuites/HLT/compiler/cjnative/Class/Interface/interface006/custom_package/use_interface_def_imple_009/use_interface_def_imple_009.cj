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

struct Mystruct {
    var x: UInt64 = 10
    mut func f() {
        x = 20
        return x
    }
}

extend Mystruct <: MyInterface<UInt64> {
    public mut func foo1(): UInt64 {
        f()
    }
    public mut func foo3(): UInt64 {
        x
    }
}

main() {
    var s1: Mystruct = Mystruct()
    var s2: MyInterface<UInt64> = Mystruct()
    if (s2.foo2(a: 10) == 30 && s2.foo3() == 20 && s1.foo2(a: 5) == 25 && s1.x == 20) {
        return 0
    } else {
        return 1
    }
}
