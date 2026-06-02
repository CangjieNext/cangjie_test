/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output | compare %f
// ASSERT: scan token_literal_value: @
// ASSERT: scan token_literal_value: M
// ASSERT: scan token_literal_value: [
// ASSERT: scan token_literal_value: 1
// ASSERT: scan token_literal_value: ]

package use

import std.ast.*

main() {
    var a = quote(@M[1])
    a.dump()
    return 0
}
