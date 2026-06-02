/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*

main(){
    let tok1 = quote(let _s1 = '')
    let tok2 = quote(let _s2 = 'abc')
    let tok3 = quote(let _s3 = '仓"颉"\r\n')

    let expr1 = parseDecl(tok1)
    let expr2 = parseDecl(tok2)
    let expr3 = parseDecl(tok3)
    expr1.dump()
    expr2.dump()
    expr3.dump()
    0
}

// ASSERT: scan-3 SINGLE_QUOTED_STRING_LITERAL
// ASSERT: scan \"仓\"颉\"\\r\\n\"
