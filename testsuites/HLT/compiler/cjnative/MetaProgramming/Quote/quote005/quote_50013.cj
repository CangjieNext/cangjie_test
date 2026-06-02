/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_macro %f

import std.ast.*

main() {
    var a = quote(1)..quote(10) : quote(1)
    return 0
}
// ASSERT: scan sema_generic_type_argument_not_match_constraint
// ASSERT: scan sema_mismatched_types
