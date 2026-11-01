/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: TryExpr) {
        ident.add("node")
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        try (certFile = File(certFilePath, Read)) {
            var privateKey = Option<PrivateKey>.None
            try (keyFile = File(keyFilePath, Read)) {
                let keyStr = String.fromUtf8(readToEnd(keyFile))
                privateKey = PrivateKey.decodeFromPem(keyStr)
            } catch (e: FSException | TlsException) {
                LOGGER.error("read pem file private_key.pem failed: ${e}")
                return config
            }

            let certStr = String.fromUtf8(readToEnd(certFile))
            let certs = x509.X509Certificate.decodeFromPem(certStr)
            if (let Some(v) <- privateKey) {
                var tlsConfig = TlsServerConfig(certs, v)
                if (supportHttp2) {
                    tlsConfig.supportedAlpnProtocols = ["h2"]
                }
                config = Some(tlsConfig)
            }
        } catch (e: FSException | TlsException) {
            LOGGER.error("read cert file cert.pem failed: ${e}")
        } catch (e: Exception) {
            LOGGER.error("")
        }
    )
    let expr = match (parseExpr(input) as TryExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, expr.toTokens())
    if (!flag) {
        return 1
    }
    if (expr.resourceSpec.size != 1) {
        return 2
    }
    if (expr.catchPatterns.size != 2) {
        return 3
    }
    expr.traverse(myVisitor)
    if (myVisitor.ident.size != 1) {
        return 4
    }
    expr.dump()
    return 0
}

// ASSERT: scan TryExpr {
// ASSERT: scan -keywordT: Token {
// ASSERT: scan value: "try"
// ASSERT: scan kind: TRY
// ASSERT: scan -resourceSpec: 0, VarDecl {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "certFile"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "File"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "certFilePath"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 1, Argument {
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Read"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -tryBlock: Block {
// ASSERT: scan -nodes: 0, VarDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "var"
// ASSERT: scan kind: VAR
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "privateKey"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: MemberAccess {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Option"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan typeArguments: 0, RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "PrivateKey"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -field: Token {
// ASSERT: scan value: "None"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -nodes: 1, TryExpr {
// ASSERT: scan -keywordT: Token {
// ASSERT: scan value: "try"
// ASSERT: scan kind: TRY
// ASSERT: scan -resourceSpec: 0, VarDecl {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "keyFile"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "File"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "keyFilePath"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 1, Argument {
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Read"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -tryBlock: Block {
// ASSERT: scan -nodes: 0, VarDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "let"
// ASSERT: scan kind: LET
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "keyStr"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: CallExpr {
// ASSERT: scan -callFunc: MemberAccess {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "String"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -field: Token {
// ASSERT: scan value: "fromUtf8"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "readToEnd"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "keyFile"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -nodes: 1, AssignExpr {
// ASSERT: scan -leftExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "privateKey"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -rightExpr: CallExpr {
// ASSERT: scan -callFunc: MemberAccess {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "PrivateKey"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -field: Token {
// ASSERT: scan value: "decodeFromPem"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "keyStr"
// ASSERT: scan kind: IDENTIFIER
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
// ASSERT: scan value: "FSException"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -types: 1, RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "TlsException"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -catchBlocks: 0, Block {
// ASSERT: scan -nodes: 0, CallExpr {
// ASSERT: scan -callFunc: MemberAccess {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "LOGGER"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -field: Token {
// ASSERT: scan value: "error"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "read pem file private_key.pem failed: ${e}"
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -nodes: 1, ReturnExpr {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "return"
// ASSERT: scan kind: RETURN
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "config"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -nodes: 2, VarDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "let"
// ASSERT: scan kind: LET
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "certStr"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: CallExpr {
// ASSERT: scan -callFunc: MemberAccess {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "String"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -field: Token {
// ASSERT: scan value: "fromUtf8"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "readToEnd"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "certFile"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -nodes: 3, VarDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "let"
// ASSERT: scan kind: LET
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "certs"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: CallExpr {
// ASSERT: scan -callFunc: MemberAccess {
// ASSERT: scan -baseExpr: MemberAccess {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "x509"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -field: Token {
// ASSERT: scan value: "X509Certificate"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -field: Token {
// ASSERT: scan value: "decodeFromPem"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "certStr"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -nodes: 4, IfExpr {
// ASSERT: scan -keywordI: Token {
// ASSERT: scan value: "if"
// ASSERT: scan kind: IF
// ASSERT: scan -condition: LetPatternExpr {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "let"
// ASSERT: scan kind: LET
// ASSERT: scan -pattern: EnumPattern {
// ASSERT: scan -constructor: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Some"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -patterns: 0, VarOrEnumPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "v"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -backArrow: Token {
// ASSERT: scan value: "<-"
// ASSERT: scan kind: BACKARROW
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "privateKey"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -ifBlock: Block {
// ASSERT: scan -nodes: 0, VarDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "var"
// ASSERT: scan kind: VAR
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "tlsConfig"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "TlsServerConfig"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "certs"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 1, Argument {
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "v"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -nodes: 1, IfExpr {
// ASSERT: scan -keywordI: Token {
// ASSERT: scan value: "if"
// ASSERT: scan kind: IF
// ASSERT: scan -condition: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "supportHttp2"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -ifBlock: Block {
// ASSERT: scan -nodes: 0, AssignExpr {
// ASSERT: scan -leftExpr: MemberAccess {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "tlsConfig"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -field: Token {
// ASSERT: scan value: "supportedAlpnProtocols"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -rightExpr: ArrayLiteral {
// ASSERT: scan -elements: 0, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "h2"
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -nodes: 2, AssignExpr {
// ASSERT: scan -leftExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "config"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -rightExpr: CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Some"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "tlsConfig"
// ASSERT: scan kind: IDENTIFIER
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
// ASSERT: scan value: "FSException"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -types: 1, RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "TlsException"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -catchBlocks: 0, Block {
// ASSERT: scan -nodes: 0, CallExpr {
// ASSERT: scan -callFunc: MemberAccess {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "LOGGER"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -field: Token {
// ASSERT: scan value: "error"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "read cert file cert.pem failed: ${e}"
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -keywordsC: 1, Token {
// ASSERT: scan value: "catch"
// ASSERT: scan kind: CATCH
// ASSERT: scan -catchPatterns: 1, ExceptTypePattern {
// ASSERT: scan -pattern: VarPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "e"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -types: 0, RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Exception"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -catchBlocks: 1, Block {
// ASSERT: scan -nodes: 0, CallExpr {
// ASSERT: scan -callFunc: MemberAccess {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "LOGGER"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -field: Token {
// ASSERT: scan value: "error"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: ""
// ASSERT: scan kind: STRING_LITERAL
