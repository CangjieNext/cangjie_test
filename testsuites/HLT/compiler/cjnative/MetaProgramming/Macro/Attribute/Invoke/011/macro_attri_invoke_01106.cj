/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_01106.cj
// EXEC: %compiler %cmp_macro define_01106.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %f -o %output

import define_01106.*

main() {
    var a = 2
    X = Y
    Y = X
    return a
}
// ASSERT: scan sema_undeclared_identifier
