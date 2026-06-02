// DEPENDENCE:  ./test_macro_define.cj
// EXEC: %compiler %cmp_macro ./test_macro_define.cj
// EXEC: %run_macro %compiler %cmp_opt %macro_lib %f -o %output 2>&1 | compare %f

import define.*

main() {
    @TEST_ERROR_WITHOUT_MESSAGE(let a = 1)
}


// ASSERT: scan error:
// ASSERT: scan  ==> test_macro_without_message.cj:8:33:
// ASSERT: scan 1 error generated, 1 error printed.

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
