/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_var.cj
// EXEC: %compiler %cmp_macro define_var.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define_var.*

var a = 0

@M[x]
var b = 0

main() {
    return 0
}
// ASSERT: scan sema_redefinition
