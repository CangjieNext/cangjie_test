/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

main() {
    let decl = FuncDecl(
        quote(func testFunc(testCfunc: CFunc<(CPointer<UInt8>, CPointer<Int64>) -> CPointer<UInt8>>) {}))
    let typ = decl.funcParams[0].paramType
    typ.dump()
}

// ASSERT: scan RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "CFunc"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -typeArguments: 0, FuncType {
// ASSERT: scan -types: 0, RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "CPointer"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -typeArguments: 0, PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "UInt8"
// ASSERT: scan kind: UINT8
// ASSERT: scan -types: 1, RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "CPointer"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -typeArguments: 0, PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int64"
// ASSERT: scan kind: INT64
// ASSERT: scan -ARROW: Token {
// ASSERT: scan value: "->"
// ASSERT: scan kind: ARROW
// ASSERT: scan -returnType: RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "CPointer"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -typeArguments: 0, PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "UInt8"
// ASSERT: scan kind: UINT8
