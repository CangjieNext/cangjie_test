// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

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

/* SCAN-IN
ASTException: 
[31merror[0m: expected '(' after 'catch', found '{'
  [36m| [0m
  [36m| [0m} catch {[0m
  [36m| [0m  [36m~~~~~[0m [31m^ expected '(' here[0m
  [36m| [0m  [36m|[0m
  [36m| [0m  [36mafter this[0m
  [36m| [0m

parsing expr error.
ASTException: 
[31merror[0m: expected expression after '', found keyword 'catch'
  [36m| [0m
  [36m| [0mcatch(e: Exception) {[0m
  [36m| [0m[31m^^^^^ expected expression here[0m
  [36m| [0m

parsing expr error.
ASTException: 
[31merror[0m: expected expression after '', found '<EOF>'
 [36m==>[0m :1:1:

parsing expr error.
Block {
}
0
0
description: illegal, token_id: 156, token_literal_value: , fileID: 0, line: 0, column: 0
ASTException: Illegal TokenKind, TokenKind should be FINALLY
0
description: try, token_id: 101, token_literal_value: try, fileID: 1, line: 104, column: 39
ASTException: Illegal TokenKind, TokenKind should be TRY
1
ASTException: Cannot get finally block from current TryExpr
Block {
}
cnt = 6
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
