/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_macro %f

import std.ast.*

main() {
    var a: (Tokens, Tokens) = (quote(1), quote(2))
    var b: (Tokens, Tokens) = (quote((1,2)), quote(Bool))
    var c: (Tokens, Tokens) = (quote((quote(1),quote(2))), quote(2))
    return 0
}
