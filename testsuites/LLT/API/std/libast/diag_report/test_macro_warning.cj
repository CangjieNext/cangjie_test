// DEPENDENCE:  ./test_macro_define.cj
// EXEC: %compiler %cmp_macro ./test_macro_define.cj
// EXEC: %run_macro %compiler %cmp_opt -Woff unused %macro_lib %f -o %output 2>&1 | compare %f

import define.*

main() {
    @TEST_WARNING(let a = 1)
}


// ASSERT: scan warning: test diag report message.
// ASSERT: scan  ==> test_macro_warning.cj:8:19:
// ASSERT: scan   # note: this warning can be suppressed by setting the compiler option `-Woff parser`
// ASSERT: scan 1 warning generated, 1 warning printed.

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
