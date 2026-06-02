/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: test.cj
// EXEC: %compiler %cmp_opt test.cj %compile_dylib_opt %obf_all %no_obf_export -o libtest.%test_suffix
// EXEC: %compiler %cmp_opt -L. -ltest --obf-seed=100 %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 123456789
// ASSERT: scan 987654321
// ASSERT: scan 11122233

package obf_me

import test.*

main() {
    println(a)
    println(foo())
    println(A().a)
    return 0
}
