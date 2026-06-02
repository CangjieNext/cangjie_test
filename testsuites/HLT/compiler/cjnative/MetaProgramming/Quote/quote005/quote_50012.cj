/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %use_ast %enable_macro %f -o %output

import std.ast.*
import std.collection.*

main() {
    var a: HashMap<Tokens, Tokens>
    var b: HashSet<Tokens>
    return 0
}
// ASSERT: scan sema_generic_type_argument_not_match_constraint
