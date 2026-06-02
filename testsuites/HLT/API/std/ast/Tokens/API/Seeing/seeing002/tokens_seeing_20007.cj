/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_args

import std.ast.*


main(){
    var T : Tokens = Tokens([Token(getTokenKind(1))])
    var s1 = T.size
    var it = T.iterator()
    it.next()
    it.seeing(Token(getTokenKind(1)).kind)
    var s2 = T.size
    if (s1 != s2) {
        return 1
    }
    return 0
}
