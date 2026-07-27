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
class TestCallExpr {
    let componentInput1: ArrayList<ArrayList<Tokens> > = ArrayList<ArrayList<Tokens> >()
    let componentInput2: ArrayList<ArrayList<Tokens> > = ArrayList<ArrayList<Tokens> >()
    let componentInput3: ArrayList<ArrayList<Tokens> > = ArrayList<ArrayList<Tokens> >()

    TestCallExpr() {
        let visitor1 = VisitBuilderSimple2()
        let visitor2 = VisitBuilderSimple2()
        let visitor3 = VisitBuilderSimple2()
        
        let bd1 = getFuncDeclBlockNodes((parseDecl(cangjieLex(componentStr1)) as ClassDecl).getOrThrow())
        for (input in bd1) {
            match (input[0]) {
                case value: Expr =>
                    value.traverse(visitor1)
                    this.componentInput1.add(visitor1.tokens)
                case _ => ()
            }
        }
        let bd2 = getFuncDeclBlockNodes((parseDecl(cangjieLex(componentStr2)) as ClassDecl).getOrThrow())
        for (input in bd2) {
            match (input[0]) {
                case value: Expr =>
                    value.traverse(visitor2)
                    this.componentInput2.add(visitor2.tokens)
                case _ => ()
            }
        }
        let bd3 = getFuncDeclBlockNodes((parseDecl(cangjieLex(componentStr3)) as ClassDecl).getOrThrow())
        for (input in bd3) {
            match (input[0]) {
                case value: Expr =>
                    value.traverse(visitor3)
                    this.componentInput3.add(visitor3.tokens)
                case _ => ()
            }
        }
    }

    @Bench
    func BenchmarkCallExprWithQuote_001():Unit {
        for (tokens in componentInput1) {
            for (token in tokens) {
                 var callBind = CallExpr(quote(bind($token,this)))
            }
        }
        ()
    }
    @Bench
    func BenchmarkCallExprWithQuote_002():Unit {
        for (tokens in componentInput2) {
            for (token in tokens) {
                 var callBind = CallExpr(quote(bind($token,this)))
            }
        }
        ()
    }
    @Bench
    func BenchmarkCallExprWithQuote_003():Unit {
        for (tokens in componentInput3) {
            for (token in tokens) {
                 var callBind = CallExpr(quote(bind($token,this)))
            }
        }
        ()
    }
}
