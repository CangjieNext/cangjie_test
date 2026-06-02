/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../../../module1 ../../../module2 ../../../module3
// EXEC: %compiler %cmp_opt %compile_lib_opt ./module1/src/p1/*.cj -o module1/p1.%middle 
// EXEC: %compiler %cmp_opt %compile_lib_opt ./module2/src/p1/*.cj -o module2/p1.%middle 
// EXEC-PIPE-1: %compiler %cmp_opt module1/p1.%middle module2/p1.%middle %f -o %output 2>&1 | compare %f

import module1.p1.C // OK
import module2.p1.C // OK

main() {
    var a = C()
    var b = p1.C()
    return 0
}
// ASSERT: scan sema_ambiguous_use
// ASSERT: scan sema_undeclared_identifier
