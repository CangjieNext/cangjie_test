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
class TestParseExprFragment {
    let gqlSerializeAttrInput1: Tokens
    let changeTrailingExprInput1: Tokens
    let changeTrailingExprInput2: Tokens
    let changeTrailingExprInput3: Tokens
    let changeTrailingExprInput4: Tokens
    let changeTrailingExprInput5: Tokens
    let changeTrailingExprInput6: Tokens
    let changeTrailingExprInput7: Tokens
    let changeTrailingExprInput8: Tokens


    TestParseExprFragment() {
        this.gqlSerializeAttrInput1 = cangjieLex("GqlType=\"input\"")
        this.changeTrailingExprInput1 = cangjieLex(changeTrailingExprStr1)
        this.changeTrailingExprInput2 = cangjieLex(changeTrailingExprStr2)
        this.changeTrailingExprInput3 = cangjieLex(changeTrailingExprStr3)
        this.changeTrailingExprInput4 = cangjieLex(changeTrailingExprStr4)
        this.changeTrailingExprInput5 = cangjieLex(changeTrailingExprStr5)
        this.changeTrailingExprInput6 = cangjieLex(changeTrailingExprStr6)
        this.changeTrailingExprInput7 = cangjieLex(changeTrailingExprStr7)
        this.changeTrailingExprInput8 = cangjieLex(changeTrailingExprStr8)
    }

    @Bench
    func BenchmarkParseExprFragment_001(): Unit {
        var offset: Int64 = 0
        while(offset < gqlSerializeAttrInput1.size) {
            try {
                let (expr, off) = parseExprFragment(gqlSerializeAttrInput1, startFrom: offset)
                offset = off
            } catch (e: Exception) {
                ()
            }
        }
        ()
    }

    @Bench
    func BenchmarkParseExprFragment_changeTrailingExpr_001(): Unit {
        var (e, p) = parseExprFragment(changeTrailingExprInput1, startFrom: 0)
        while(p != changeTrailingExprInput1.size) {
            (e, p) = parseExprFragment(changeTrailingExprInput1, startFrom: p)
        }
    }
    @Bench
    func BenchmarkParseExprFragment_changeTrailingExpr_002(): Unit {
        var (e, p) = parseExprFragment(changeTrailingExprInput2, startFrom: 0)
        while(p != changeTrailingExprInput2.size) {
            (e, p) = parseExprFragment(changeTrailingExprInput2, startFrom: p)
        }
    }
    @Bench
    func BenchmarkParseExprFragment_changeTrailingExpr_003(): Unit {
        var (e, p) = parseExprFragment(changeTrailingExprInput3, startFrom: 0)
        while(p != changeTrailingExprInput3.size) {
            (e, p) = parseExprFragment(changeTrailingExprInput3, startFrom: p)
        }
    }
    @Bench
    func BenchmarkParseExprFragment_changeTrailingExpr_004(): Unit {
        var (e, p) = parseExprFragment(changeTrailingExprInput4, startFrom: 0)
        while(p != changeTrailingExprInput4.size) {
            (e, p) = parseExprFragment(changeTrailingExprInput4, startFrom: p)
        }
    }
    @Bench
    func BenchmarkParseExprFragment_changeTrailingExpr_005(): Unit {
        var (e, p) = parseExprFragment(changeTrailingExprInput5, startFrom: 0)
        while(p != changeTrailingExprInput5.size) {
            (e, p) = parseExprFragment(changeTrailingExprInput5, startFrom: p)
        }
    }
    @Bench
    func BenchmarkParseExprFragment_changeTrailingExpr_006(): Unit {
        var (e, p) = parseExprFragment(changeTrailingExprInput6, startFrom: 0)
        while(p != changeTrailingExprInput6.size) {
            (e, p) = parseExprFragment(changeTrailingExprInput6, startFrom: p)
        }
    }
    @Bench
    func BenchmarkParseExprFragment_changeTrailingExpr_007(): Unit {
        var (e, p) = parseExprFragment(changeTrailingExprInput7, startFrom: 0)
        while(p != changeTrailingExprInput7.size) {
            (e, p) = parseExprFragment(changeTrailingExprInput7, startFrom: p)
        }
    }
    @Bench
    func BenchmarkParseExprFragment_changeTrailingExpr_008(): Unit {
        var (e, p) = parseExprFragment(changeTrailingExprInput8, startFrom: 0)
        while(p != changeTrailingExprInput8.size) {
            (e, p) = parseExprFragment(changeTrailingExprInput8, startFrom: p)
        }
    }
}
