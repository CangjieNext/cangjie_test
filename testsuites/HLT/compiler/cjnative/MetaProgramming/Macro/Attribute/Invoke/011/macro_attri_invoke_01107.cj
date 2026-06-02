/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_01107.cj
// ERRCHECK: %compiler %cmp_macro define_01107.cj

import define_01107.*

main() {
    var a = 1
    @M[a](=0)
    return a
}
// ASSERT: scan sema_undeclared_identifier
