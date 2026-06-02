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
    let str = '仓"颉"\\r\\n'
    let tok01 = Token(SINGLE_QUOTED_STRING_LITERAL)
    let tok02 = Token(SINGLE_QUOTED_STRING_LITERAL, str)
    var tok03 = Tokens()
    let tok04 = quote('')
    let tok05 = quote('仓"颉"\r\n')

    let boolean01 = compareTokens(tok04, tok03 + tok01)
    let boolean02 = compareTokens(tok05, tok03 + tok02)
    let boolean03 = match(getTokenKind(147)) {
        case STRING_LITERAL => true
        case _ => false
    }
    if (boolean01 && boolean02 && boolean03) {
        0
    } else {
        1
    }
}
