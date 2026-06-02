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

struct myStruct {
    var x: Bool = true
}

extend myStruct <: MyInterface<Bool> {
    public mut func foo1(): Bool {
        x = false
        return x
    }
    public mut func foo3(): Bool {
        x
    }
}

main() {
    var struct1: faterInterface<Bool> = myStruct()
    var struct2: MyInterface<Bool> = myStruct()
    var struct3: myStruct = myStruct()

    if (!struct1.foo2(5, true) && !struct1.foo3() && !struct2.foo2(11, false) && !struct2.foo2(4, false) &&
        !struct2.foo3() && !struct3.foo2(10, true) && !struct3.x) {
        return 0
    } else {
        return 1
    }
}
