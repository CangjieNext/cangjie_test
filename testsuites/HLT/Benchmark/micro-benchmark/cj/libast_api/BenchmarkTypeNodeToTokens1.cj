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
class TestVarDeclTypeToTokens {
    let watchAttrOuterInput1: VarDecl
    let storagePropAttrInput1: VarDecl

    TestVarDeclTypeToTokens() {
        this.watchAttrOuterInput1 = (parseDecl(cangjieLex(watchAttrOuterStr1)) as VarDecl).getOrThrow()
        this.storagePropAttrInput1 = (parseDecl(cangjieLex(storagePropAttrStr1)) as VarDecl).getOrThrow()
    }

    @Bench
    func BenchmarkTypeNodeToTokens1_VarDecl_declType_001():Unit {
        this.watchAttrOuterInput1.declType.toTokens()
        ()
    }
    @Bench
    func BenchmarkTypeNodeToTokens1_VarDecl_declType_002():Unit {
        this.storagePropAttrInput1.declType.toTokens()
        ()
    } 

}

@Test
@Measure[TimeNow(Nanos)]
class TestVarDeclsTypeToTokens {
    let cloneableInput1: ArrayList<VarDecl>
    let cloneableInput2: ArrayList<VarDecl>
    let cloneableInput3: ArrayList<VarDecl>
    let cloneableInput4: ArrayList<VarDecl>
    let scoperInput1: ArrayList<VarDecl>
    let scoperInput2: ArrayList<VarDecl>
    let deleteStrategyInput1: ArrayList<VarDecl>
    let updateStrategyInput1: ArrayList<VarDecl>
    let equatableInput1: ArrayList<VarDecl>
    let genericSingleResourceInput1: ArrayList<VarDecl>
    let internalGenericListResourceInput1: ArrayList<VarDecl>
    let patchMetaInput1: ArrayList<VarDecl>
    let patchMetaInput2: ArrayList<VarDecl>
    let patchMetaInput3: ArrayList<VarDecl>
    let patchMetaInput4: ArrayList<VarDecl>
    let serializableInput1: ArrayList<VarDecl>
    let serializableInput2: ArrayList<VarDecl>
    let serializableInput3: ArrayList<VarDecl>

    let customDialogInput1: ArrayList<VarDecl>
    let componentInput1: ArrayList<VarDecl>
    let componentInput2: ArrayList<VarDecl>
    let componentInput3: ArrayList<VarDecl>
    let componentInput4: ArrayList<VarDecl>
    let componentInput5: ArrayList<VarDecl>
    let componentInput6: ArrayList<VarDecl>

    TestVarDeclsTypeToTokens() {
        this.cloneableInput1 = getVarDeclsFromClassDecl((parseDecl(cangjieLex(cloneableStr1)) as ClassDecl).getOrThrow())
        this.cloneableInput2 = getVarDeclsFromClassDecl((parseDecl(cangjieLex(cloneableStr2)) as ClassDecl).getOrThrow())
        this.cloneableInput3 = getVarDeclsFromClassDecl((parseDecl(cangjieLex(cloneableStr3)) as ClassDecl).getOrThrow())
        this.cloneableInput4 = getVarDeclsFromClassDecl((parseDecl(cangjieLex(cloneableStr4)) as ClassDecl).getOrThrow())
        this.scoperInput1 = getVarDeclsFromClassDecl((parseDecl(cangjieLex(scoperStr1)) as ClassDecl).getOrThrow())
        this.scoperInput2 = getVarDeclsFromClassDecl((parseDecl(cangjieLex(scoperStr2)) as ClassDecl).getOrThrow())
        this.deleteStrategyInput1 = getVarDeclsFromClassDecl((parseDecl(cangjieLex(deleteStrategyStr1)) as ClassDecl).getOrThrow())
        this.updateStrategyInput1 = getVarDeclsFromClassDecl((parseDecl(cangjieLex(updateStrategyStr1)) as ClassDecl).getOrThrow())
        this.equatableInput1 = getVarDeclsFromClassDecl((parseDecl(cangjieLex(equatableStr1)) as ClassDecl).getOrThrow())
        this.genericSingleResourceInput1 = getVarDeclsFromClassDecl((parseDecl(cangjieLex(genericSingleResourceStr1)) as ClassDecl).getOrThrow())
        this.internalGenericListResourceInput1 = getVarDeclsFromClassDecl((parseDecl(cangjieLex(internalGenericListResourceStr1)) as ClassDecl).getOrThrow())
        this.patchMetaInput1 = getVarDeclsFromClassDecl((parseDecl(cangjieLex(patchMetaStr1)) as ClassDecl).getOrThrow())
        this.patchMetaInput2 = getVarDeclsFromClassDecl((parseDecl(cangjieLex(patchMetaStr2)) as ClassDecl).getOrThrow())
        this.patchMetaInput3 = getVarDeclsFromClassDecl((parseDecl(cangjieLex(patchMetaStr3)) as ClassDecl).getOrThrow())
        this.patchMetaInput4 = getVarDeclsFromClassDecl((parseDecl(cangjieLex(patchMetaStr4)) as ClassDecl).getOrThrow())
        this.serializableInput1 = getVarDeclsFromClassDecl((parseDecl(cangjieLex(serializableStr1)) as ClassDecl).getOrThrow())
        this.serializableInput2 = getVarDeclsFromClassDecl((parseDecl(cangjieLex(serializableStr2)) as ClassDecl).getOrThrow())
        this.serializableInput3 = getVarDeclsFromClassDecl((parseDecl(cangjieLex(serializableStr3)) as ClassDecl).getOrThrow())
    
        this.customDialogInput1 = getVarDecls((parseDecl(cangjieLex(customDialogStr1)) as ClassDecl).getOrThrow())
        this.componentInput1 = getVarDecls((parseDecl(cangjieLex(componentStr1)) as ClassDecl).getOrThrow())
        this.componentInput2 = getVarDecls((parseDecl(cangjieLex(componentStr2)) as ClassDecl).getOrThrow())
        this.componentInput3 = getVarDecls((parseDecl(cangjieLex(componentStr3)) as ClassDecl).getOrThrow())
        this.componentInput4 = getVarDecls((parseDecl(cangjieLex(componentStr4)) as ClassDecl).getOrThrow())
        this.componentInput5 = getVarDecls((parseDecl(cangjieLex(componentStr5)) as ClassDecl).getOrThrow())
        this.componentInput6 = getVarDecls((parseDecl(cangjieLex(componentStr6)) as ClassDecl).getOrThrow())
    }

    @Bench
    func BenchmarkTypeNodeToTokens1_VarDecls_type_001():Unit{
        for (varDecl in this.cloneableInput1) {
            varDecl.declType.toTokens()
        }
        ()
    }

    @Bench
    func BenchmarkTypeNodeToTokens1_VarDecls_type_002():Unit{
        for (varDecl in this.cloneableInput2) {
            varDecl.declType.toTokens()
        }
        ()
    }    

    @Bench
    func BenchmarkTypeNodeToTokens1_VarDecls_type_003():Unit{
        for (varDecl in this.cloneableInput3) {
            varDecl.declType.toTokens()
        }
        ()
    }
    @Bench
    func BenchmarkTypeNodeToTokens1_VarDecls_type_004():Unit{
        for (varDecl in this.cloneableInput4) {
            varDecl.declType.toTokens()
        }
        ()
    }

    @Bench
    func BenchmarkTypeNodeToTokens1_VarDecls_type_005():Unit{
        for (varDecl in this.scoperInput1) {
            varDecl.declType.toTokens()
        }
        ()
    }
    @Bench
    func BenchmarkTypeNodeToTokens1_VarDecls_type_006():Unit{
        for (varDecl in this.scoperInput2) {
            varDecl.declType.toTokens()
        }
        ()
    }
    @Bench
    func BenchmarkTypeNodeToTokens1_VarDecls_type_007():Unit{
        for (varDecl in this.deleteStrategyInput1) {
            varDecl.declType.toTokens()
        }
        ()
    }
    @Bench
    func BenchmarkTypeNodeToTokens1_VarDecls_type_008():Unit{
        for (varDecl in this.updateStrategyInput1) {
            varDecl.declType.toTokens()
        }
        ()
    }
    @Bench
    func BenchmarkTypeNodeToTokens1_VarDecls_type_009():Unit{
        for (varDecl in this.equatableInput1) {
            varDecl.declType.toTokens()
        }
        ()
    }
    @Bench
    func BenchmarkTypeNodeToTokens1_VarDecls_type_010():Unit{
        for (varDecl in this.genericSingleResourceInput1) {
            varDecl.declType.toTokens()
        }
        ()
    }
    @Bench
    func BenchmarkTypeNodeToTokens1_VarDecls_type_011():Unit{
        for (varDecl in this.internalGenericListResourceInput1) {
            varDecl.declType.toTokens()
        }
        ()
    }
    @Bench
    func BenchmarkTypeNodeToTokens1_VarDecls_type_012():Unit{
        for (varDecl in this.patchMetaInput1) {
            varDecl.declType.toTokens()
        }
        ()
    }
    @Bench
    func BenchmarkTypeNodeToTokens1_VarDecls_type_013():Unit{
        for (varDecl in this.patchMetaInput2) {
            varDecl.declType.toTokens()
        }
        ()
    }
    @Bench
    func BenchmarkTypeNodeToTokens1_VarDecls_type_014():Unit{
        for (varDecl in this.patchMetaInput3) {
            varDecl.declType.toTokens()
        }
        ()
    }
    @Bench
    func BenchmarkTypeNodeToTokens1_VarDecls_type_015():Unit{
        for (varDecl in this.patchMetaInput4) {
            varDecl.declType.toTokens()
        }
        ()
    }
    @Bench
    func BenchmarkTypeNodeToTokens1_VarDecls_type_016():Unit{
        for (varDecl in this.serializableInput1) {
            varDecl.declType.toTokens()
        }
        ()
    }
    @Bench
    func BenchmarkTypeNodeToTokens1_VarDecls_type_017():Unit{
        for (varDecl in this.serializableInput2) {
            varDecl.declType.toTokens()
        }
        ()
    }    

    @Bench
    func BenchmarkTypeNodeToTokens1_VarDecls_type_018():Unit{
        for (varDecl in this.serializableInput3) {
            varDecl.declType.toTokens()
        }
        ()
    }



    @Bench 
    func BenchmarkTypeNodeToTokens1_VarDecls_type_019():Unit {
        for (varDecl in customDialogInput1) {
            varDecl.declType.toTokens()
        }
        ()
    }
    @Bench 
    func BenchmarkTypeNodeToTokens1_VarDecls_type_020():Unit {
        for (varDecl in componentInput1) {
            varDecl.declType.toTokens()
        }
        ()
    }
    @Bench 
    func BenchmarkTypeNodeToTokens1_VarDecls_type_021():Unit {
        for (varDecl in componentInput2) {
            varDecl.declType.toTokens()
        }
        ()
    }
    @Bench 
    func BenchmarkTypeNodeToTokens1_VarDecls_type_022():Unit {
        for (varDecl in componentInput3) {
            try{
                varDecl.declType.toTokens()
            } catch (e: Exception) {
                ()
            }
        }
        ()
    }
    @Bench 
    func BenchmarkTypeNodeToTokens1_VarDecls_type_023():Unit {
        for (varDecl in componentInput4) {
            varDecl.declType.toTokens()
        }
        ()
    }
    @Bench 
    func BenchmarkTypeNodeToTokens1_VarDecls_type_024():Unit {
        for (varDecl in componentInput5) {
            varDecl.declType.toTokens()
        }
        ()
    }
    @Bench 
    func BenchmarkTypeNodeToTokens1_VarDecls_type_025():Unit {
        for (varDecl in componentInput6) {
            varDecl.declType.toTokens()
        }
        ()
    }
}


