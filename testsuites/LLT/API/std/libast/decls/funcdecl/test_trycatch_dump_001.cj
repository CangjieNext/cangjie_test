/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*

var res = 0

main() {
    let input = quote(
         func x(){
            unsafe{ test() }
            try { 
            } catch(e: ASTException) {
            } catch(_) {
            } finally{
            }
         }
    )
    let decl = parseDecl(input)
    decl.dump()
    return 0
}

// ASSERT: scan FuncDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "func"
// ASSERT: scan kind: FUNC
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "x"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, Block {
// ASSERT: scan -nodes: 0, CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "test"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -nodes: 1, TryExpr {
// ASSERT: scan -keywordT: Token {
// ASSERT: scan value: "try"
// ASSERT: scan kind: TRY
// ASSERT: scan -tryBlock: Block {
// ASSERT: scan -keywordsC: 0, Token {
// ASSERT: scan value: "catch"
// ASSERT: scan kind: CATCH
// ASSERT: scan -catchPatterns: 0, ExceptTypePattern {
// ASSERT: scan -pattern: VarPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "e"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -types: 0, RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "ASTException"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -catchBlocks: 0, Block {
// ASSERT: scan -keywordsC: 1, Token {
// ASSERT: scan value: "catch"
// ASSERT: scan kind: CATCH
// ASSERT: scan -catchPatterns: 1, WildcardPattern {
// ASSERT: scan -wildcard: Token {
// ASSERT: scan value: "_"
// ASSERT: scan kind: WILDCARD
// ASSERT: scan -catchBlocks: 1, Block {
// ASSERT: scan -keywordF: Token {
// ASSERT: scan value: "finally"
// ASSERT: scan kind: FINALLY
// ASSERT: scan -finallyBlock: Block {
