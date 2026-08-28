/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*
internal import std.collection.*

main(): Int64 {
    var cnt = 0
    let tokens1 = quote( 
        try {
            let lastElement = arrayTest[3]
        } catch {
            print("exception info:" + e)
        } finally {
            let a1 = 1
            let a2 = 2
        } catch (e: Exception) {
            print("Other")
        }
    )
    try {
        let tryExpr1 = TryExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(
        catch (e: Exception) {
            print("Other")
        }
    )
    try {
        let tryExpr2 = TryExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let tryExpr3 = TryExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let tryExpr4 = TryExpr(quote())
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let tryExpr5 = TryExpr(quote(try{}catch(_){1}))
        let tryExpr55 = TryExpr()
        tryExpr5.tryBlock = tryExpr55.tryBlock
        tryExpr5.tryBlock.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let tryExpr6 = TryExpr(quote(try{}catch(_){}))
        let tryExpr66 = TryExpr()
        tryExpr6.catchPatterns = tryExpr66.catchPatterns
        println(tryExpr6.catchPatterns.size)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let tryExpr7 = TryExpr(quote(try{}catch(_){}))
        let tryExpr77 = TryExpr()
        tryExpr7.catchBlocks = tryExpr77.catchBlocks
        println(tryExpr7.catchBlocks.size)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let tryExpr8 = TryExpr(quote(try{}catch(_){}))
        tryExpr8.keywordF.dump()
        tryExpr8.keywordF = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let tryExpr9 = TryExpr(quote(try{}catch(_){}))
        let tryExpr99 = TryExpr()
        tryExpr9.keywordsC = tryExpr99.keywordsC
        println(tryExpr9.keywordsC.size)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let tryExpr10 = TryExpr(quote(try{}catch(_){}))
        tryExpr10.keywordT.dump()
        tryExpr10.keywordT = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let tryExpr11 = TryExpr(quote(try{}catch(_){}))
        tryExpr11.resourceSpec = ArrayList<VarDecl>([VarDecl(quote(var a: Int64))])
        println(tryExpr11.resourceSpec.size)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let tryExpr12 = TryExpr(quote(try{}catch(_){}))
        tryExpr12.finallyBlock.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let tryExpr13 = TryExpr(quote(try{}catch(_){}))
        tryExpr13.finallyBlock = Block()
        tryExpr13.finallyBlock.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/*SCAN-IN
expected '(' after 'catch', found '{'
*/
/*SCAN-IN
expected expression after '', found '<EOF>'
*/
// ASSERT: scan 0
// ASSERT: scan 0
/*SCAN-IN
description: illegal, token_id: 162, token_literal_value:
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be FINALLY
*/
/*SCAN-IN
description: try, token_id: 101, token_literal_value: try
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be TRY
*/
// ASSERT: scan 1
/*SCAN-IN
ASTException: Cannot get finally block from current TryExpr
*/
// ASSERT: scan ASTException: Cannot get finally block from current TryExpr
// ASSERT: scan cnt = 6