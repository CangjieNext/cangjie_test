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
class TestFuncParamsTypeToTokens {
    let scoperInlineInput1: ArrayList<FuncParam>
    let scoperInput1: ArrayList<FuncParam>
    let scoperInput2: ArrayList<FuncParam>
    let storageInput1: ArrayList<FuncParam>
    let patcherInput1: ArrayList<FuncParam>
    let deleteStrategyInput1: ArrayList<FuncParam>
    let deleteStrategyInlineInput1: ArrayList<FuncParam>
    let updateStrategyInput1: ArrayList<FuncParam>
    let genericSingleResourceInput1: ArrayList<FuncParam>
    let serializableInput1: ArrayList<FuncParam>
    let serializableInput2: ArrayList<FuncParam>
    let serializableInput3: ArrayList<FuncParam>

    TestFuncParamsTypeToTokens() {
        this.scoperInlineInput1 = getFuncParamsFromFuncDecl((parseDecl(cangjieLex(scoperInlineStr1)) as FuncDecl).getOrThrow())
        this.scoperInput1 = getFuncParamsFromClassDecl((parseDecl(cangjieLex(scoperStr1)) as ClassDecl).getOrThrow())
        this.scoperInput2 = getFuncParamsFromClassDecl((parseDecl(cangjieLex(scoperStr2)) as ClassDecl).getOrThrow())
        this.storageInput1 = getFuncParamsFromClassDecl((parseDecl(cangjieLex(storageStr1)) as ClassDecl).getOrThrow())
        this.patcherInput1 = getFuncParamsFromClassDecl((parseDecl(cangjieLex(patcherStr1)) as ClassDecl).getOrThrow())
        this.deleteStrategyInput1 = getFuncParamsFromClassDecl((parseDecl(cangjieLex(deleteStrategyStr1)) as ClassDecl).getOrThrow())
        this.deleteStrategyInlineInput1 = getFuncParamsFromFuncDecl((parseDecl(cangjieLex(deleteStrategyInlineStr1)) as FuncDecl).getOrThrow())
        this.updateStrategyInput1 = getFuncParamsFromClassDecl((parseDecl(cangjieLex(updateStrategyStr1)) as ClassDecl).getOrThrow())
        this.genericSingleResourceInput1 = getFuncParamsFromClassDecl((parseDecl(cangjieLex(genericSingleResourceStr1)) as ClassDecl).getOrThrow())
        this.serializableInput1 = getFuncParamsFromClassDecl((parseDecl(cangjieLex(serializableStr1)) as ClassDecl).getOrThrow())
        this.serializableInput2 = getFuncParamsFromClassDecl((parseDecl(cangjieLex(serializableStr2)) as ClassDecl).getOrThrow())
        this.serializableInput3 = getFuncParamsFromClassDecl((parseDecl(cangjieLex(serializableStr3)) as ClassDecl).getOrThrow())
    }

  
    @Bench
    func BenchmarkTypeNodeToTokens2_FuncParams_type_001():Unit{
        for (param in this.scoperInlineInput1) {
            param.paramType.toTokens()
        }
        ()
    }
    @Bench
    func BenchmarkTypeNodeToTokens2_FuncParams_type_002():Unit{
        for (param in this.scoperInput1) {
            param.paramType.toTokens()
        }
        ()
    }
    @Bench
    func BenchmarkTypeNodeToTokens2_FuncParams_type_003():Unit{
        for (param in this.scoperInput2) {
            param.paramType.toTokens()
        }
        ()
    }
    @Bench
    func BenchmarkTypeNodeToTokens2_FuncParams_type_004():Unit{
        for (param in this.storageInput1) {
            param.paramType.toTokens()
        }
        ()
    }
    @Bench
    func BenchmarkTypeNodeToTokens2_FuncParams_type_005():Unit{
        for (param in this.patcherInput1) {
            param.paramType.toTokens()
        }
        ()
    }
    @Bench
    func BenchmarkTypeNodeToTokens2_FuncParams_type_006():Unit{
        for (param in this.deleteStrategyInput1) {
            param.paramType.toTokens()
        }
        ()
    }
    @Bench
    func BenchmarkTypeNodeToTokens2_FuncParams_type_007():Unit{
        for (param in this.deleteStrategyInlineInput1) {
            param.paramType.toTokens()
        }
        ()
    }
    @Bench
    func BenchmarkTypeNodeToTokens2_FuncParams_type_008():Unit{
        for (param in this.updateStrategyInput1) {
            param.paramType.toTokens()
        }
        ()
    }
    @Bench
    func BenchmarkTypeNodeToTokens2_FuncParams_type_009():Unit{
        for (param in this.genericSingleResourceInput1) {
            param.paramType.toTokens()
        }
        ()
    }
    @Bench
    func BenchmarkTypeNodeToTokens2_FuncParams_type_010():Unit{
        for (param in this.serializableInput1) {
            param.paramType.toTokens()
        }
        ()
    }
    @Bench
    func BenchmarkTypeNodeToTokens2_FuncParams_type_011():Unit{
        for (param in this.serializableInput2) {
            param.paramType.toTokens()
        }
        ()
    }
    @Bench
    func BenchmarkTypeNodeToTokens2_FuncParams_type_012():Unit{
        for (param in this.serializableInput3) {
            param.paramType.toTokens()
        }
        ()
    }
}

@Test
@Measure[TimeNow(Nanos)]
class TestClassDeclSuperTypesToTokens {
    let gqlOperationInput1: ClassDecl
    let gqlOperationInput2: ClassDecl

    TestClassDeclSuperTypesToTokens() {
        this.gqlOperationInput1 = (parseDecl(cangjieLex(gqlOperationStr1)) as ClassDecl).getOrThrow()
        this.gqlOperationInput2 = (parseDecl(cangjieLex(gqlOperationStr2)) as ClassDecl).getOrThrow()
    }

    @Bench
    func BenchmarkTypeNodeToTokens2_ClassDecl_superTypes_001():Unit {
        this.gqlOperationInput1.superTypes.toTokens()
        ()
    }
    @Bench
    func BenchmarkTypeNodeToTokens2_ClassDecl_superTypes_002():Unit {
        this.gqlOperationInput2.superTypes.toTokens()
        ()
    }
}