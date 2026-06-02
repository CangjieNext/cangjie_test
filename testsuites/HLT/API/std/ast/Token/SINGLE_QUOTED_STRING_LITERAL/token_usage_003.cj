/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

main(){
    let str = '''
Hello,
Cangjie Lang'''
    let tok01 = Token(SINGLE_QUOTED_STRING_LITERAL, str)
    let tok02 = Token(SINGLE_QUOTED_STRING_LITERAL, ##'\n'##)

    if (tok01.kind.toString() == "SINGLE_QUOTED_STRING_LITERAL"
    && tok02.kind.toString() == "SINGLE_QUOTED_STRING_LITERAL") {
        0
    } else {
        1
    }
}
