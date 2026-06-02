// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt -Woff unused %macro_lib %f 2>&1 | compare %f
// ASSERT: scan var a = 'hello'
// ASSERT: scan var b = "hello"

import define.*

main() {
    @M1(var a = 'hello')
    @M1(var b = "hello")
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
