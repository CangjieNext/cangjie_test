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
// ERRCHECK: %compiler %cmp_opt %f pkg1.%middle -o %output

import pkg1.*

main() {
    var s1: Mystruct = Mystruct()
    var s2: MyInterface<Int32> = Mystruct()
    if (s2.foo2() == 20 && s1.foo2() == 20 && s1.x == 20) {
        return 0
    } else {
        return 1
    }
}
// ASSERT: scan sema_undeclared_type_name
// ASSERT: scan sema_undeclared_identifier
