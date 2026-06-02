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
    var s1: fatherInterface<A> = myStruct<String>()
    var s2: MyInterface = myStruct<String>()
    var s3: myStruct<String> = myStruct<String>()

    if (s1.foo2(a: A()) is A && s1.foo3() == 20 && s2.foo2(a: A()) is A && s2.foo3() == 20 && s3.foo2(a: A()) is A &&
        s3.x == 20) {
        return 0
    } else {
        return 1
    }
}
