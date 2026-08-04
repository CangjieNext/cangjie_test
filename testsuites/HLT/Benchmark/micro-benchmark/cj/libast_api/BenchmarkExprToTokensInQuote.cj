/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: inputs.cj utils.cj visitors.cj
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping --no-sub-pkg %cmp_utest_opt -Woff=all %f inputs.cj utils.cj visitors.cj -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run %run_opt %output %run_utest_opt %run_args --bench --no-color

import std.ast.*
import std.collection.*

@Test 
@Measure[TimeNow(Nanos)]
class TestExprToTokens {
    let handleRenderInput1: Expr
    let handleRenderInput2: Expr
    let handleRenderInput3: Expr
    let handleRenderInput4: Expr
    let handleRenderInput5: Expr
    let handleRenderInput6: Expr
    let handleRenderInput7: Expr
    let handleRenderInput8: Expr
    let handleRenderInput9: Expr
    let handleRenderInput10: Expr
    let handleRenderInput11: Expr

    TestExprToTokens() {
        this.handleRenderInput1 = parseExpr(cangjieLex(handleRenderStr1))
        this.handleRenderInput2 = parseExpr(cangjieLex(handleRenderStr2))
        this.handleRenderInput3 = parseExpr(cangjieLex(handleRenderStr3))
        this.handleRenderInput4 = parseExpr(cangjieLex(handleRenderStr4))
        this.handleRenderInput5 = parseExpr(cangjieLex(handleRenderStr5))
        this.handleRenderInput6 = parseExpr(cangjieLex(handleRenderStr6))
        this.handleRenderInput7 = parseExpr(cangjieLex(handleRenderStr7))
        this.handleRenderInput8 = parseExpr(cangjieLex(handleRenderStr8))
        this.handleRenderInput9 = parseExpr(cangjieLex(handleRenderStr9))
        this.handleRenderInput10 = parseExpr(cangjieLex(handleRenderStr10))
        this.handleRenderInput11 = parseExpr(cangjieLex(handleRenderStr11))
       
    }

    @Bench 
    func BenchmarkExprToTokensInQuote_expr_001(): Unit {
        var ret = quote($handleRenderInput1)
        ()
    }
    @Bench 
    func BenchmarkExprToTokensInQuote_expr_002(): Unit {
        var ret = quote($handleRenderInput2)
        ()
    }
    @Bench 
    func BenchmarkExprToTokensInQuote_expr_003(): Unit {
        var ret = quote($handleRenderInput3)
        ()
    }
    @Bench 
    func BenchmarkExprToTokensInQuote_expr_004(): Unit {
        var ret = quote($handleRenderInput4)
        ()
    }
    @Bench 
    func BenchmarkExprToTokensInQuote_expr_005(): Unit {
        var ret = quote($handleRenderInput5)
        ()
    }
    @Bench 
    func BenchmarkExprToTokensInQuote_expr_006(): Unit {
        var ret = quote($handleRenderInput6)
        ()
    }
    @Bench 
    func BenchmarkExprToTokensInQuote_expr_007(): Unit {
        var ret = quote($handleRenderInput7)
        ()
    }
    @Bench 
    func BenchmarkExprToTokensInQuote_expr_008(): Unit {
        var ret = quote($handleRenderInput8)
        ()
    }
    @Bench 
    func BenchmarkExprToTokensInQuote_expr_009(): Unit {
        var ret = quote($handleRenderInput9)
        ()
    }
    @Bench 
    func BenchmarkExprToTokensInQuote_expr_010(): Unit {
        var ret = quote($handleRenderInput10)
        ()
    }
    @Bench 
    func BenchmarkExprToTokensInQuote_expr_011(): Unit {
        var ret = quote($handleRenderInput11)
        ()
    }

}

@Test 
class TestExprsToTokensInQuote {
    let componentInput1: ArrayList<ArrayList<Expr> > = ArrayList<ArrayList<Expr> >()
    let componentInput2: ArrayList<ArrayList<Expr> > = ArrayList<ArrayList<Expr> >()
    let componentInput3: ArrayList<ArrayList<Expr> > = ArrayList<ArrayList<Expr> >()

    TestExprsToTokensInQuote() {
        let visitor1 = VisitBuilderSimple1()
        let visitor2 = VisitBuilderSimple1()
        let visitor3 = VisitBuilderSimple1()
        
        let bd1 = getFuncDeclBlockNodes((parseDecl(cangjieLex(componentStr1)) as ClassDecl).getOrThrow())
        for (input in bd1) {
            match (input[0]) {
                case value: Expr =>
                    value.traverse(visitor1)
                    this.componentInput1.add(visitor1.exprs)
                case _ => ()
            }
        }
        let bd2 = getFuncDeclBlockNodes((parseDecl(cangjieLex(componentStr2)) as ClassDecl).getOrThrow())
        for (input in bd2) {
            match (input[0]) {
                case value: Expr =>
                    value.traverse(visitor2)
                    this.componentInput2.add(visitor2.exprs)
                case _ => ()
            }
        }
        let bd3 = getFuncDeclBlockNodes((parseDecl(cangjieLex(componentStr3)) as ClassDecl).getOrThrow())
        for (input in bd3) {
            match (input[0]) {
                case value: Expr =>
                    value.traverse(visitor3)
                    this.componentInput3.add(visitor3.exprs)
                case _ => ()
            }
        } 
    }

    @Bench 
    func BenchmarkExprToTokensInQuote_exprs_001(): Unit {
        for (exprs in componentInput1) {
            for (expr in exprs) {
                 var callBind = quote($expr)
            }
        }
        ()
    }
    @Bench 
    func BenchmarkExprToTokensInQuote_exprs_002(): Unit {
        for (exprs in componentInput2) {
            for (expr in exprs) {
                 var callBind = quote($expr)
            }
        }
        ()
    }
    @Bench 
    func BenchmarkExprToTokensInQuote_exprs_003(): Unit {
        for (exprs in componentInput3) {
            for (expr in exprs) {
                 var callBind = quote($expr)
            }
        }
        ()
    }

}

@Test 
class TestCallExprToTokens {
    let generateArgsInput1: CallExpr
    let generateArgsInput2: CallExpr
    let generateArgsInput3: CallExpr
    let generateArgsInput4: CallExpr
    let generateArgsInput5: CallExpr
    let generateArgsInput6: CallExpr

    TestCallExprToTokens() {
        this.generateArgsInput1 = (parseExpr(cangjieLex(generateArgsStr1)) as CallExpr).getOrThrow()
        this.generateArgsInput2 = (parseExpr(cangjieLex(generateArgsStr2)) as CallExpr).getOrThrow()
        this.generateArgsInput3 = (parseExpr(cangjieLex(generateArgsStr3)) as CallExpr).getOrThrow()
        this.generateArgsInput4 = (parseExpr(cangjieLex(generateArgsStr4)) as CallExpr).getOrThrow()
        this.generateArgsInput5 = (parseExpr(cangjieLex(generateArgsStr5)) as CallExpr).getOrThrow()
        this.generateArgsInput6 = (parseExpr(cangjieLex(generateArgsStr6)) as CallExpr).getOrThrow()
    }

    @Bench 
    func BenchmarkExprToTokensInQuote_CallExpr_001():Unit {
        let baseExpr = generateArgsInput1.callFunc
        let args = generateArgsInput1.arguments
        var componentArg = quote($baseExpr)
        for (arg in args) {
            let argValue = arg.expr
            let argName = arg.identifier
            componentArg = componentArg + quote($argName) + quote($argValue)
        }
        ()
    }

    @Bench 
    func BenchmarkExprToTokensInQuote_CallExpr_002():Unit {
        let baseExpr = generateArgsInput2.callFunc
        let args = generateArgsInput2.arguments
        var componentArg = quote($baseExpr)
        for (arg in args) {
            let argValue = arg.expr
            let argName = arg.identifier
            componentArg = componentArg + quote($argName) + quote($argValue)
        }
        ()
    }
    @Bench 
    func BenchmarkExprToTokensInQuote_CallExpr_003():Unit {
        let baseExpr = generateArgsInput3.callFunc
        let args = generateArgsInput3.arguments
        var componentArg = quote($baseExpr)
        for (arg in args) {
            let argValue = arg.expr
            let argName = arg.identifier
            componentArg = componentArg + quote($argName) + quote($argValue)
        }
        ()
    }
    @Bench 
    func BenchmarkExprToTokensInQuote_CallExpr_004():Unit {
        let baseExpr = generateArgsInput4.callFunc
        let args = generateArgsInput4.arguments
        var componentArg = quote($baseExpr)
        for (arg in args) {
            let argValue = arg.expr
            let argName = arg.identifier
            componentArg = componentArg + quote($argName) + quote($argValue)
        }
        ()
    }
    @Bench 
    func BenchmarkExprToTokensInQuote_CallExpr_005():Unit {
        let baseExpr = generateArgsInput5.callFunc
        let args = generateArgsInput5.arguments
        var componentArg = quote($baseExpr)
        for (arg in args) {
            let argValue = arg.expr
            let argName = arg.identifier
            componentArg = componentArg + quote($argName) + quote($argValue)
        }
        ()
    }
    @Bench 
    func BenchmarkExprToTokensInQuote_CallExpr_006():Unit {
        let baseExpr = generateArgsInput6.callFunc
        let args = generateArgsInput6.arguments
        var componentArg = quote($baseExpr)
        for (arg in args) {
            let argValue = arg.expr
            let argName = arg.identifier
            componentArg = componentArg + quote($argName) + quote($argValue)
        }
        ()
    }

}