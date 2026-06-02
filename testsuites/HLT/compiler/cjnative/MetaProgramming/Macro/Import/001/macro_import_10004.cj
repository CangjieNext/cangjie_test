/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: macro_define_10004.cj
// EXEC: %compiler %cmp_macro macro_define_10004.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output 2>&1 | compare %f

package test

import define_10004.X as x

var x = 0

main() {
    return 0
}
// ASSERT: scan-not sema_redefinition
