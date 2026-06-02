/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p1/*.cj -o p1.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f p1.%middle -o %output 2>&1 | compare %f

import p1.*

main() {
    let a = TestA()
    0
}
// ASSERT: scan sema_undeclared_identifier
