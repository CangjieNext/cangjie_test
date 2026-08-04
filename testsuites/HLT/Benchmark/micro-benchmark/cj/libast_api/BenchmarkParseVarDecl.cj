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
class TestParseVarDecl {
    
    let stateInput1: Tokens
    let stateInput2: Tokens
    let stateInput3: Tokens
    let publishInput1: Tokens
    let isFragementInput1: Tokens
    let watchAttrOuterInput1: Tokens
    let storagePropAttrInput1: Tokens

    TestParseVarDecl() {
        this.stateInput1 = cangjieLex(stateStr1)
        this.stateInput2 = cangjieLex(stateStr2)
        this.stateInput3 = cangjieLex(stateStr3)
        this.publishInput1 = cangjieLex(publishStr1)
        this.isFragementInput1 = cangjieLex(isFragementStr1)
        this.watchAttrOuterInput1 = cangjieLex(watchAttrOuterStr1)
        this.storagePropAttrInput1 = cangjieLex(storagePropAttrStr1)
    }

    @Bench
    func BenchmarkParseVarDecl_001() : Unit {
        let varDecl = (parseDecl(stateInput1) as VarDecl).getOrThrow()
    }

    @Bench
    func BenchmarkParseVarDecl_002() : Unit {
        let varDecl = (parseDecl(stateInput2) as VarDecl).getOrThrow()
    }
 
    @Bench
    func BenchmarkParseVarDecl_003() : Unit {
        let varDecl = (parseDecl(stateInput3) as VarDecl).getOrThrow()
    }
    @Bench
    func BenchmarkParseVarDecl_004() : Unit {
        let varDecl = (parseDecl(publishInput1) as VarDecl).getOrThrow()
    }
    @Bench
    func BenchmarkParseVarDecl_005() : Unit {
        let varDecl = (parseDecl(isFragementInput1) as VarDecl).getOrThrow()
    }
    @Bench
    func BenchmarkParseVarDecl_006() : Unit {
        let varDecl = (parseDecl(watchAttrOuterInput1) as VarDecl).getOrThrow()
    }
    @Bench
    func BenchmarkParseVarDecl_007() : Unit {
        let varDecl = (parseDecl(storagePropAttrInput1) as VarDecl).getOrThrow()
    }
}