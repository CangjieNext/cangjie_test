/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (Windows)ERRCHECK: %compiler --error-count-limit=all %cmp_macro %f
// (not Windows)ERRCHECK: %compiler %cmp_macro %f

import std.ast.*

main() {
    !quote(1)
    -quote(1)
    quote(1) ^ quote(1)
    quote(1) & quote(1)
    quote(1) | quote(1)
    quote(1) * quote(1)
    quote(1) % quote(1)
    quote(1) / quote(1)
    quote(1) - quote(1)
    quote(1) == quote(1)
    quote(1) != quote(1)
    quote(1) > quote(1)
    quote(1) >= quote(1)
    quote(1) <= quote(1)
    quote(1) < quote(1)
    quote(1) << quote(1)
    quote(1) >> quote(1)

    return 1
}
// ASSERT: scan sema_invalid_unary_expr
// ASSERT: scan sema_invalid_binary_expr
