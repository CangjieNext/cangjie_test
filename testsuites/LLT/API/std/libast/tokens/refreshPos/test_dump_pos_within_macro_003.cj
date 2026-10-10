/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

import std.ast.*
import def.*

main() {
    @M3()
}

// ASSERT: regex description: illegal, token_id: [0-9]+, token_literal_value:
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: a
// ASSERT: regex description: incr, token_id: [0-9]+, token_literal_value: \+\+