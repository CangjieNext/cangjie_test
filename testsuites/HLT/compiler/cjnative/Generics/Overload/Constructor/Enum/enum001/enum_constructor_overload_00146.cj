/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: a.cj b.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt a.cj -o a.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt b.cj -o b.%middle
// ERRCHECK: %compiler %cmp_opt a.%middle b.%middle %f -o %output

package c

import a.*
import b.*

main(): Int64 {
    let a = A.a
    return 1
}
// ASSERT: scan sema_ambiguous_use
