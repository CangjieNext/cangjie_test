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
class TestParseFuncDecl {
    
    let scoperInlineInput1: Tokens
    let deleteStrategyInlineInput1: Tokens
    let symmetryAttrInput1: Tokens
    let builderInput1: Tokens
    let builderInput2: Tokens
    let builderInput3: Tokens
    let builderInput4: Tokens

    TestParseFuncDecl() {
        this.scoperInlineInput1 = cangjieLex(scoperInlineStr1)
        this.deleteStrategyInlineInput1 = cangjieLex(deleteStrategyInlineStr1)
        this.symmetryAttrInput1 = cangjieLex(symmetryAttrStr1)
        this.builderInput1 = cangjieLex(builderStr1)
        this.builderInput2 = cangjieLex(builderStr2)
        this.builderInput3 = cangjieLex(builderStr3)
        this.builderInput4 = cangjieLex(builderStr4)
    }

 
    @Bench
    func BenchmarkParseFuncDecl001() : Unit {
        let funcDecl = (parseDecl(scoperInlineInput1) as FuncDecl).getOrThrow()
        ()
    }
    @Bench
    func BenchmarkParseFuncDecl002() : Unit {
        let funcDecl = (parseDecl(deleteStrategyInlineInput1) as FuncDecl).getOrThrow()
        ()
    }
    @Bench
    func BenchmarkParseFuncDecl003() : Unit {
        let funcDecl = (parseDecl(symmetryAttrInput1) as FuncDecl).getOrThrow()
        ()
    } 

    @Bench
    func BenchmarkParseFuncDecl004() : Unit {
        let funcDecl = (parseDecl(builderInput1) as FuncDecl).getOrThrow()
    }

    @Bench
    func BenchmarkParseFuncDecl005() : Unit {
        let funcDecl = (parseDecl(builderInput2) as FuncDecl).getOrThrow()
    }
 
    @Bench
    func BenchmarkParseFuncDecl006() : Unit {
        let funcDecl = (parseDecl(builderInput3) as FuncDecl).getOrThrow()
    }
    @Bench
    func BenchmarkParseFuncDecl007() : Unit {
        let funcDecl = (parseDecl(builderInput4) as FuncDecl).getOrThrow()
    }
}