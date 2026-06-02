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
    var struct1: faterInterface<Int64> = myStruct()
    var struct2: MyInterface<Int64> = myStruct()
    var struct3: myStruct = myStruct()

    var s1: Int64 = match (struct1.foo2()) {
        case Some(x) => x
        case _ => 0
    }
    var s2: Int64 = match (struct2.foo2()) {
        case Some(x) => x
        case _ => 0
    }
    var s3: Int64 = match (struct3.foo2()) {
        case Some(x) => x
        case _ => 0
    }

    if (s1 == 10 && s2 == struct2.foo3() && struct1.foo4() == 10 && struct2.foo4() == 10 && s3 == 10 &&
        struct3.foo3() == 10 && struct3.x == 10) {
        return 0
    } else {
        return 1
    }
}
