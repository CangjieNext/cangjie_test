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
// ERRCHECK: %compiler %cmp_opt %f pkg1.%middle pkg2.%middle -o %output

import pkg2.*

main() {
    if (myClass<MyInterface1<Int32>>.b1() == 1 && myClass<MyInterface1<Int32>>.b2() == 2 &&
        myClass<MyInterface1<Int32>>.b3() == 3 && myClass<MyInterface1<Int32>>.x1 == 10 &&
        myClass<MyInterface1<Int32>>.x2 == 20 && myClass<MyInterface1<Int32>>.x3 == 30) {
        return 0
    } else {
        return 1
    }
}
// ASSERT: scan sema_undeclared_identifier
// ASSERT: scan sema_undeclared_type_name
