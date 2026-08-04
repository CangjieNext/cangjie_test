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
class TestFuncParamsTypeNodeTokensToString {
    let scoperInlineInput1: Tokens = Tokens()
    let scoperInput1: Tokens = Tokens()
    let scoperInput2: Tokens = Tokens()
    let storageInput1: Tokens = Tokens()
    let patcherInput1: Tokens = Tokens()
    let deleteStrategyInput1: Tokens = Tokens()
    let updateStrategyInput1: Tokens = Tokens()
    let genericSingleResourceInput1: Tokens = Tokens()
    let serializableInput1: Tokens = Tokens()
    let serializableInput2: Tokens = Tokens()
    let serializableInput3: Tokens = Tokens()
    let deleteStrategyInlineInput1: Tokens = Tokens()

    TestFuncParamsTypeNodeTokensToString() {
        let fp1 = getFuncParamsFromFuncDecl((parseDecl(cangjieLex(scoperInlineStr1)) as FuncDecl).getOrThrow())
        let fp2 = getFuncParamsFromClassDecl((parseDecl(cangjieLex(scoperStr1)) as ClassDecl).getOrThrow())
        let fp3 = getFuncParamsFromClassDecl((parseDecl(cangjieLex(scoperStr2)) as ClassDecl).getOrThrow())
        let fp4 = getFuncParamsFromClassDecl((parseDecl(cangjieLex(storageStr1)) as ClassDecl).getOrThrow())
        let fp5 = getFuncParamsFromClassDecl((parseDecl(cangjieLex(patcherStr1)) as ClassDecl).getOrThrow())
        let fp6 = getFuncParamsFromClassDecl((parseDecl(cangjieLex(deleteStrategyStr1)) as ClassDecl).getOrThrow())
        let fp7 = getFuncParamsFromClassDecl((parseDecl(cangjieLex(updateStrategyStr1)) as ClassDecl).getOrThrow())
        let fp8 = getFuncParamsFromClassDecl((parseDecl(cangjieLex(genericSingleResourceStr1)) as ClassDecl).getOrThrow())
        let fp9 = getFuncParamsFromClassDecl((parseDecl(cangjieLex(serializableStr1)) as ClassDecl).getOrThrow())
        let fp10 = getFuncParamsFromClassDecl((parseDecl(cangjieLex(serializableStr2)) as ClassDecl).getOrThrow())
        let fp11 = getFuncParamsFromClassDecl((parseDecl(cangjieLex(serializableStr3)) as ClassDecl).getOrThrow())
        let fp12 = getFuncParamsFromFuncDecl((parseDecl(cangjieLex(deleteStrategyInlineStr1)) as FuncDecl).getOrThrow())
        for (param in fp1) {
            scoperInlineInput1.append(param.paramType.toTokens())
        }
        for (param in fp2) {
            scoperInput1.append(param.paramType.toTokens())
        }
        for (param in fp3) {
            scoperInput2.append(param.paramType.toTokens())
        }
        for (param in fp4) {
            storageInput1.append(param.paramType.toTokens())
        }
        for (param in fp5) {
            patcherInput1.append(param.paramType.toTokens())
        }
        for (param in fp6) {
            deleteStrategyInput1.append(param.paramType.toTokens())
        }
        for (param in fp7) {
            updateStrategyInput1.append(param.paramType.toTokens())
        }
        for (param in fp8) {
            genericSingleResourceInput1.append(param.paramType.toTokens())
        }
        for (param in fp9) {
            serializableInput1.append(param.paramType.toTokens())
        }
        for (param in fp10) {
            serializableInput2.append(param.paramType.toTokens())
        }
        for (param in fp11) {
            serializableInput3.append(param.paramType.toTokens())
        }
        for (param in fp12) {
            deleteStrategyInlineInput1.append(param.paramType.toTokens())
        }
    }
    @Bench 
    func BenchmarkTokensToString1_FuncParams_paramType_001(): Unit {
        let str = scoperInlineInput1.toString()
        ()
    }
    @Bench 
    func BenchmarkTokensToString1_FuncParams_paramType_002(): Unit {
        let str = scoperInput1.toString()
        ()
    }
    @Bench 
    func BenchmarkTokensToString1_FuncParams_paramType_003(): Unit {
        let str = scoperInput2.toString()
        ()
    }
    @Bench 
    func BenchmarkTokensToString1_FuncParams_paramType_004(): Unit {
        let str = storageInput1.toString()
        ()
    }
    @Bench 
    func BenchmarkTokensToString1_FuncParams_paramType_005(): Unit {
        let str = patcherInput1.toString()
        ()
    }
    @Bench 
    func BenchmarkTokensToString1_FuncParams_paramType_006(): Unit {
        let str = deleteStrategyInput1.toString()
        ()
    }
    @Bench 
    func BenchmarkTokensToString1_FuncParams_paramType_007(): Unit {
        let str = updateStrategyInput1.toString()
        ()
    }
    @Bench 
    func BenchmarkTokensToString1_FuncParams_paramType_008(): Unit {
        let str = genericSingleResourceInput1.toString()
        ()
    }
    @Bench 
    func BenchmarkTokensToString1_FuncParams_paramType_009(): Unit {
        let str = serializableInput1.toString()
        ()
    }
    @Bench 
    func BenchmarkTokensToString1_FuncParams_paramType_010(): Unit {
        let str = serializableInput2.toString()
        ()
    }
    @Bench 
    func BenchmarkTokensToString1_FuncParams_paramType_011(): Unit {
        let str = serializableInput3.toString()
        ()
    }
    @Bench 
    func BenchmarkTokensToString1_FuncParams_paramType_012(): Unit {
        let str = deleteStrategyInlineInput1.toString()
        ()
    }

}
