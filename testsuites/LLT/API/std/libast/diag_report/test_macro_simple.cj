// DEPENDENCE:./test_macro_simple_define.cj
// EXEC: %compiler -Woff unused %cmp_macro ./test_macro_simple_define.cj
// EXEC: %run_macro %compiler %cmp_opt %macro_lib --debug-macro %f -o %output 2>&1 | compare %f
// ASSERT: scan error: this is error 0

import macro_define.*

@M(class A {})

main() {
    0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
