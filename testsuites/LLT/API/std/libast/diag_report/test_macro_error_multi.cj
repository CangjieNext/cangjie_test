// DEPENDENCE:  ./test_macro_define.cj
// EXEC: %compiler %cmp_macro ./test_macro_define.cj
// EXEC: %run_macro %compiler %cmp_opt %macro_lib %f -o %output 2>&1 | compare %f

import define.*

main() {
    @TEST_ERROR(let a = 1)
    @TEST_WARNING(let b = 1)
    @TEST_ERROR2(let c = 1)
}


// ASSERT: scan error: test diag report message.
// ASSERT: scan  ==> test_macro_error_multi.cj:8:17:

// ASSERT: scan warning: test diag report message.
// ASSERT: scan  ==> test_macro_error_multi.cj:9:19:

// ASSERT: scan error: test diag report message.
// ASSERT: scan   ==> test_macro_error_multi.cj:10:18:

// ASSERT: scan 2 errors generated, 2 errors printed.
// ASSERT: scan 1 warning generated, 1 warning printed.

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
