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
// TIMEOUT: 1800

import std.ast.*
import std.collection.*
import std.runtime.*

@Test
@Measure[TimeNow(Nanos)]
class TestParseClassDecl {
    
    let cloneableInput1: Tokens
    let cloneableInput2: Tokens
    let cloneableInput3: Tokens
    let cloneableInput4: Tokens
    let protobufAttrInput1: Tokens
    let protobufAttrInput2: Tokens
    let protobufAttrInput3: Tokens
    let protobufAttrInput4: Tokens
    let scoperInput1: Tokens
    let scoperInput2: Tokens
    let storageInput1: Tokens
    let patcherInput1: Tokens
    let deleteStrategyInput1: Tokens
    let updateStrategyInput1: Tokens
    let equatableInput1: Tokens
    let genericSingleResourceInput1: Tokens
    let internalGenericListResourceInput1: Tokens
    let patchMetaInput1: Tokens
    let patchMetaInput2: Tokens
    let patchMetaInput3: Tokens
    let patchMetaInput4: Tokens
    let serializableInput1: Tokens
    let serializableInput2: Tokens
    let serializableInput3: Tokens

    let gqlOperationInput1: Tokens
    let gqlOperationInput2: Tokens
    let gqlSerializeInput1: Tokens
    let gqlSerializeInput2: Tokens
    let entryInput1: Tokens
    let entryInput2: Tokens
    let entryInput3: Tokens
    let entryInput4: Tokens
    let observedInput1: Tokens
    let observedInput2: Tokens
    let observedInput3: Tokens
    let customDialogInput1: Tokens
    let componentInput1: Tokens
    let componentInput2: Tokens
    let componentInput3: Tokens
    let componentInput4: Tokens
    let componentInput5: Tokens
    let componentInput6: Tokens

    TestParseClassDecl() {
        this.cloneableInput1 = cangjieLex(cloneableStr1)
        this.cloneableInput2 = cangjieLex(cloneableStr2)
        this.cloneableInput3 = cangjieLex(cloneableStr3)
        this.cloneableInput4 = cangjieLex(cloneableStr4)
        this.protobufAttrInput1 = cangjieLex(protobufAttrStr1)
        this.protobufAttrInput2 = cangjieLex(protobufAttrStr2)
        this.protobufAttrInput3 = cangjieLex(protobufAttrStr3)
        this.protobufAttrInput4 = cangjieLex(protobufAttrStr4)
        this.scoperInput1 = cangjieLex(scoperStr1)
        this.scoperInput2 = cangjieLex(scoperStr2)
        this.storageInput1 = cangjieLex(storageStr1)
        this.patcherInput1 = cangjieLex(patcherStr1)
        this.deleteStrategyInput1 = cangjieLex(deleteStrategyStr1)
        this.updateStrategyInput1 = cangjieLex(updateStrategyStr1)
        this.equatableInput1 = cangjieLex(equatableStr1)
        this.genericSingleResourceInput1 = cangjieLex(genericSingleResourceStr1)
        this.internalGenericListResourceInput1 = cangjieLex(internalGenericListResourceStr1)
        this.patchMetaInput1 = cangjieLex(patchMetaStr1)
        this.patchMetaInput2 = cangjieLex(patchMetaStr2)
        this.patchMetaInput3 = cangjieLex(patchMetaStr3)
        this.patchMetaInput4 = cangjieLex(patchMetaStr4)
        this.serializableInput1 = cangjieLex(serializableStr1)
        this.serializableInput2 = cangjieLex(serializableStr2)
        this.serializableInput3 = cangjieLex(serializableStr3)

        this.gqlOperationInput1 = cangjieLex(gqlOperationStr1)
        this.gqlOperationInput2 = cangjieLex(gqlOperationStr2)
        this.gqlSerializeInput1 = cangjieLex(gqlSerializeStr1)
        this.gqlSerializeInput2 = cangjieLex(gqlSerializeStr2)
        this.entryInput1 = cangjieLex(entryStr1)
        this.entryInput2 = cangjieLex(entryStr2)
        this.entryInput3 = cangjieLex(entryStr3)
        this.entryInput4 = cangjieLex(entryStr4)
        this.observedInput1 = cangjieLex(observedStr1)
        this.observedInput2 = cangjieLex(observedStr2)
        this.observedInput3 = cangjieLex(observedStr3)
        this.customDialogInput1 = cangjieLex(customDialogStr1)
        this.componentInput1 = cangjieLex(componentStr1)
        this.componentInput2 = cangjieLex(componentStr2)
        this.componentInput3 = cangjieLex(componentStr3)
        this.componentInput4 = cangjieLex(componentStr4)
        this.componentInput5 = cangjieLex(componentStr5)
        this.componentInput6 = cangjieLex(componentStr6)
    }

    @Bench
    func BenchmarkParseClassDecl_001() : Unit {
        blackBox((parseDecl(cloneableInput1) as ClassDecl).getOrThrow())
        ()
    }

    @Bench
    func BenchmarkParseClassDecl_002() : Unit {
        blackBox((parseDecl(cloneableInput2) as ClassDecl).getOrThrow())
        ()
    }
 
    @Bench
    func BenchmarkParseClassDecl_003() : Unit {
        blackBox((parseDecl(cloneableInput3) as ClassDecl).getOrThrow())
        ()
    }
    @Bench
    func BenchmarkParseClassDecl_004() : Unit {
        blackBox((parseDecl(cloneableInput4) as ClassDecl).getOrThrow())
        ()
    }
    @Bench
    func BenchmarkParseClassDecl_005() : Unit {
        blackBox((parseDecl(protobufAttrInput1) as ClassDecl).getOrThrow())
        ()
    }
    @Bench
    func BenchmarkParseClassDecl_006() : Unit {
        blackBox((parseDecl(protobufAttrInput2) as ClassDecl).getOrThrow())
        ()
    }
    @Bench
    func BenchmarkParseClassDecl_007() : Unit {
        blackBox((parseDecl(protobufAttrInput3) as ClassDecl).getOrThrow())
        ()
    }
    @Bench
    func BenchmarkParseClassDecl_008() : Unit {
        blackBox((parseDecl(protobufAttrInput4) as ClassDecl).getOrThrow())
        ()
    }
    @Bench
    func BenchmarkParseClassDecl_009() : Unit {
        blackBox((parseDecl(scoperInput1) as ClassDecl).getOrThrow())
        ()
    }
    @Bench
    func BenchmarkParseClassDecl_010() : Unit {
        blackBox((parseDecl(scoperInput2) as ClassDecl).getOrThrow())
        ()
    }   
    @Bench
    func BenchmarkParseClassDecl_011() : Unit {
        blackBox((parseDecl(storageInput1) as ClassDecl).getOrThrow())
        ()
    }   
    @Bench
    func BenchmarkParseClassDecl_012() : Unit {
        blackBox((parseDecl(patcherInput1) as ClassDecl).getOrThrow())
        ()
    }
    @Bench
    func BenchmarkParseClassDecl_013() : Unit {
        blackBox((parseDecl(deleteStrategyInput1) as ClassDecl).getOrThrow())
        ()
    }
    @Bench
    func BenchmarkParseClassDecl_014() : Unit {
        blackBox((parseDecl(updateStrategyInput1) as ClassDecl).getOrThrow())
        ()
    }
    @Bench
    func BenchmarkParseClassDecl_015() : Unit {
        blackBox((parseDecl(equatableInput1) as ClassDecl).getOrThrow())
        ()
    }
    @Bench
    func BenchmarkParseClassDecl_016() : Unit {
        blackBox((parseDecl(genericSingleResourceInput1) as ClassDecl).getOrThrow())
        ()
    }
    @Bench
    func BenchmarkParseClassDecl_017() : Unit {
        blackBox((parseDecl(internalGenericListResourceInput1) as ClassDecl).getOrThrow())
        ()
    }
    @Bench
    func BenchmarkParseClassDecl_018() : Unit {
        blackBox((parseDecl(patchMetaInput1) as ClassDecl).getOrThrow())
        ()
    }
    @Bench
    func BenchmarkParseClassDecl_019() : Unit {
        blackBox((parseDecl(patchMetaInput2) as ClassDecl).getOrThrow())
        ()
    }
    @Bench
    func BenchmarkParseClassDecl_020() : Unit {
        blackBox((parseDecl(patchMetaInput3) as ClassDecl).getOrThrow())
        ()
    }
    @Bench
    func BenchmarkParseClassDecl_021() : Unit {
        blackBox((parseDecl(patchMetaInput4) as ClassDecl).getOrThrow())
        ()
    }
    @Bench
    func BenchmarkParseClassDecl_022() : Unit {
        blackBox((parseDecl(serializableInput1) as ClassDecl).getOrThrow())
        ()
    }

    @Bench
    func BenchmarkParseClassDecl_023() : Unit {
        blackBox((parseDecl(serializableInput2) as ClassDecl).getOrThrow())
        ()
    }
 
    @Bench
    func BenchmarkParseClassDecl_024() : Unit {
        blackBox((parseDecl(serializableInput3) as ClassDecl).getOrThrow())
        ()
    }
    


    @Bench
    func BenchmarkParseClassDecl_025() : Unit {
        blackBox((parseDecl(gqlOperationInput1) as ClassDecl).getOrThrow())
    }
    @Bench
    func BenchmarkParseClassDecl_026() : Unit {
        blackBox((parseDecl(gqlOperationInput2) as ClassDecl).getOrThrow())
    }
    @Bench
    func BenchmarkParseClassDecl_027() : Unit {
        blackBox((parseDecl(gqlSerializeInput1) as ClassDecl).getOrThrow())
    }

    @Bench
    func BenchmarkParseClassDecl_028() : Unit {
        blackBox((parseDecl(gqlSerializeInput2) as ClassDecl).getOrThrow())
    }
    @Bench
    func BenchmarkParseClassDecl_029() : Unit {
        blackBox((parseDecl(entryInput1) as ClassDecl).getOrThrow())
    }

    @Bench
    func BenchmarkParseClassDecl_030() : Unit {
        blackBox((parseDecl(entryInput2) as ClassDecl).getOrThrow())
    }
    @Bench
    func BenchmarkParseClassDecl_031() : Unit {
        blackBox((parseDecl(entryInput3) as ClassDecl).getOrThrow())
    }

    @Bench
    func BenchmarkParseClassDecl_032() : Unit {
        blackBox((parseDecl(entryInput4) as ClassDecl).getOrThrow())
    }
    @Bench
    func BenchmarkParseClassDecl_033() : Unit {
        blackBox((parseDecl(observedInput1) as ClassDecl).getOrThrow())
    }

    @Bench
    func BenchmarkParseClassDecl_034() : Unit {
        blackBox((parseDecl(observedInput2) as ClassDecl).getOrThrow())
    }
    @Bench
    func BenchmarkParseClassDecl_035() : Unit {
        blackBox((parseDecl(observedInput3) as ClassDecl).getOrThrow())
    }
    @Bench
    func BenchmarkParseClassDecl_036() : Unit {
        blackBox((parseDecl(customDialogInput1) as ClassDecl).getOrThrow())
    }
    @Bench
    func BenchmarkParseClassDecl_037() : Unit {
        blackBox((parseDecl(componentInput1) as ClassDecl).getOrThrow())
    }

    @Bench
    func BenchmarkParseClassDecl_038() : Unit {
        blackBox((parseDecl(componentInput2) as ClassDecl).getOrThrow())
    }
    @Bench
    func BenchmarkParseClassDecl_039() : Unit {
        blackBox((parseDecl(componentInput3) as ClassDecl).getOrThrow())
    }

    @Bench
    func BenchmarkParseClassDecl_040() : Unit {
        blackBox((parseDecl(componentInput4) as ClassDecl).getOrThrow())
    }   
    @Bench
    func BenchmarkParseClassDecl_041() : Unit {
        blackBox((parseDecl(componentInput5) as ClassDecl).getOrThrow())
    }

    @Bench
    func BenchmarkParseClassDecl_042() : Unit {
        blackBox((parseDecl(componentInput6) as ClassDecl).getOrThrow())
    }
}
