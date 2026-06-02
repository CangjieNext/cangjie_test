/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define10015.cj
// EXEC: %compiler %cmp_macro define10015.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %f -o %output

package use

import define10015.*

main() {
    return @M[x](y)
}
// ASSERT: scan macro_expect_attributed_macro
