/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

import std.ast.*

var id = getTokenKind(156)

main(){
    var T : Tokens = Tokens([Token(getTokenKind(156))])
    T.Seeing(Int64(156)) 
    return 1
}
// ASSERT: scan sema_not_member_of
