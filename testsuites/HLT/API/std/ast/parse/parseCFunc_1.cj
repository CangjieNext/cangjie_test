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

main() {
    let tok1 = parseExpr(quote(dummyFn(CFunc<() -> Unit>(CPointer<Unit>()))))
    let tok2 = parseExpr(cangjieLex("dummyFn(CFunc<() -> Unit>(CPointer<Unit>()))"))
    tok1.beginPos
    tok1.endPos
    tok1.dump()
    tok1.toTokens()
    tok2.beginPos
    tok2.endPos
    tok2.dump()
    tok2.toTokens()
    0
}
