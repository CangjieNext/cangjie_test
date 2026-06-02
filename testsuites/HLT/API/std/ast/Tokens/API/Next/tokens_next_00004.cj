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
    var T1 = Tokens([
                    Token(getTokenKind(1)),
                    Token(getTokenKind(2)),
                    Token(getTokenKind(3)),
                    Token(getTokenKind(4)),
                    Token(getTokenKind(5))
                    ])
    var it = T1.iterator()
    while (true) {
        match (it.next()) {
            case None => break
            case _ => continue
        }
    }
    var ret = match (it.next()) {
        case None => "end"
        case _ => "mismatch"
    }
    if (ret != "end") {
        return 1
    }
    return 0
}
