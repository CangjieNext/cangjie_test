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
    if (String.foo2<Bool>(a: false) && String.foo4<Bool>(a: false) && String.foo6<Bool>(a: false)) {
        if (String.foo2(a: false) && String.foo4(a: false) && String.foo6(a: false)) {
            return 0
        }
    }
    return 1
}
