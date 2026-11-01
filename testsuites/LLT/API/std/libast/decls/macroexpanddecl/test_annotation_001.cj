/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
 
import std.ast.*
 
main() {
    var input : Tokens = quote(@Deprecated["123"]
@Anno1["1"]
@!Anno2["2"]
public class C1<T> {
    var a = 0
})
 
    var decl = MacroExpandDecl(input)
    // decl.annotations.add(Annotation(quote(@Deprecated["123"])))
    println(decl.toTokens())
    decl.dump()
    println("decl.annotations.size: ${decl.annotations.size}")
    decl.annotations[0].at.dump()
 
}
 
// ASSERT: scan @Deprecated["123"]
// ASSERT: scan @Anno1["1"]
 
// ASSERT: scan decl.annotations.size: 1
 
// ASSERT: scan -annotations: 0, Annotation {
// ASSERT: scan -identifier: Deprecated
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "123"
// ASSERT: scan kind: STRING_LITERAL
