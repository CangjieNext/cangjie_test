// DEPENDENCE:  ./test_macro_define.cj
// EXEC: %compiler %cmp_macro ./test_macro_define.cj
// EXEC: %run_macro %compiler %cmp_opt %macro_lib %f -o %output 2>&1 | compare %f

import define.*

main() {
    @TEST_ERROR_EMPTY(let a = 1)
    @TEST_ERROR_EMPTY_WITH_ATTR[public](let b = 1)
    @TEST_ERROR_EMPTY_WITH_ATTR[public](
        let c = 1
        let d = 1
        let e = 1
    )
    @TEST_ERROR_EMPTY let f = 1
    @TEST_ERROR_EMPTY
    let g = 1
}

// ASSERT: scan error: test diag report message.

// ASSERT: scan 5 errors generated, 5 errors printed.

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
