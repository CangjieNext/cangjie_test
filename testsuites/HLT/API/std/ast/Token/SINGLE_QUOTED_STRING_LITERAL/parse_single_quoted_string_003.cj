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
    let tok = quote(
let s1 = ''
let s2 = 'abc'
let s3 = '"仓"颉\r\n'

main() {
    let _s1 = ''
    let _s2 = 'abc'
    let _s3 = '"仓"颉\r\n'
    0
})
    let pro = parseProgram(tok)
    pro.dump()
    0
}

// ASSERT: scan-6 SINGLE_QUOTED_STRING_LITERAL
// ASSERT: scan-2 \"\"仓\"颉\\r\\n\"
