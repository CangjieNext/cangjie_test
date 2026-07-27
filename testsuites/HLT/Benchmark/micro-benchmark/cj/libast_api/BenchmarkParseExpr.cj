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
class TestParseExpr {
    let watchAttrInput1: Tokens
    let watchAttrInput2: Tokens
    let storagePropAttrInput1: Tokens

    TestParseExpr() {
        this.watchAttrInput1 = cangjieLex("tabLengthChange")
        this.watchAttrInput2 = cangjieLex("onRefreshChanged")
        this.storagePropAttrInput1 = cangjieLex("\"isLogin\"")
    }

    @Bench
    func BenchmarkParseExpr_RefExpr_001() : Unit {
        let expr = (parseExpr(watchAttrInput1) as RefExpr).getOrThrow()
        ()
    }
    @Bench
    func BenchmarkParseExpr_RefExpr_002() : Unit {
        let expr = (parseExpr(watchAttrInput2) as RefExpr).getOrThrow()
        ()
    }
    @Bench
    func BenchmarkParseExpr_LitConstExpr_001() : Unit {
        let expr = (parseExpr(storagePropAttrInput1) as LitConstExpr).getOrThrow()
        ()
    }

}