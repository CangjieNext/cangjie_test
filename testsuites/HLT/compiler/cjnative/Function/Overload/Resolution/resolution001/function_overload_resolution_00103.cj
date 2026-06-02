/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: a b
// EXEC: %compiler %cmp_opt %compile_lib_opt ./a/a.cj -o ./a.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt ./b/b.cj -o ./b.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

import a.*
import b.*

main() {
    test(1)
    return 1
}
// ASSERT: scan sema_ambiguous_match
