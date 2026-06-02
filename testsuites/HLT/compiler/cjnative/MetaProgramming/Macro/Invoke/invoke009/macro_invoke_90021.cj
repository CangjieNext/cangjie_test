/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define.*

main() {
    3 - @X[0](@A(@B@D[0] var x = 1))
}
// ASSERT: scan parse_expected_decl
