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
    if (myClass.foo2<UInt8>(a: 1) == "1" && myClass.foo4<UInt8>(a: 1) == "1" && myClass.foo6<UInt8>(a: 1) == "1" &&
        myClass.x1 == "foo1修改成功" && myClass.x2 == "foo3修改成功" && myClass.x3 == "foo5修改成功") {
        return 0
    } else {
        return 1
    }
}
