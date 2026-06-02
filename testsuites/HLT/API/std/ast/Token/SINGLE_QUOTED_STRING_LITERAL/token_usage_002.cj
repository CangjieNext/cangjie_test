/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

main(){
    let str = "a"
    let tok01 = Token(SINGLE_QUOTED_STRING_LITERAL)
    let tok02 = Token(SINGLE_QUOTED_STRING_LITERAL, str)
    var tok03 = Tokens()
    let tok04 = quote("")
    let tok05 = quote("a")

    let boolean01 = compareTokens(tok04, tok03 + tok01)
    let boolean02 = compareTokens(tok05, tok03 + tok02)
    if (!boolean01 && !boolean02 ) {
        0
    } else {
        1
    }
}
