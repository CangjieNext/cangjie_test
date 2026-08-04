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
class TestGenerateBuilderParam {
    let builderInput1: ArrayList<FuncParam>
    let builderInput2: ArrayList<FuncParam>
    let builderInput3: ArrayList<FuncParam>

    TestGenerateBuilderParam() {
        this.builderInput1 = (parseDecl(cangjieLex(builderStr1)) as FuncDecl).getOrThrow().funcParams
        this.builderInput2 = (parseDecl(cangjieLex(builderStr2)) as FuncDecl).getOrThrow().funcParams
        this.builderInput3 = (parseDecl(cangjieLex(builderStr3)) as FuncDecl).getOrThrow().funcParams
    }

    func generateBuilderParam(param: FuncParam): Tokens {
        let paramType = param.paramType
        param.paramType = RefType(quote(ObservedProperty<$paramType>))
        param.toTokens()
    }

    @Bench 
    func BenchmarkGenerateBuilderParam_001():Unit {
        var entryParam = Tokens()
        var innerParam = Tokens()
        for (item in builderInput1) {
            innerParam += quote($item)
            entryParam += generateBuilderParam(item)
        }
    }
    @Bench 
    func BenchmarkGenerateBuilderParam_002():Unit {
        var entryParam = Tokens()
        var innerParam = Tokens()
        for (item in builderInput2) {
            innerParam += quote($item)
            entryParam += generateBuilderParam(item)
        }
    }
    @Bench 
    func BenchmarkGenerateBuilderParam_003():Unit {
        var entryParam = Tokens()
        var innerParam = Tokens()
        for (item in builderInput3) {
            innerParam += quote($item)
            entryParam += generateBuilderParam(item)
        }
    }
}