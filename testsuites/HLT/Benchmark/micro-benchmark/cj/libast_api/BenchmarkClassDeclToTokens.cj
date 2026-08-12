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

@Test 
@Measure[TimeNow(Nanos)]
class TestClassDeclToTokens {
    let cloneableInput1: ClassDecl
    let cloneableInput2: ClassDecl
    let cloneableInput3: ClassDecl
    let cloneableInput4: ClassDecl
    let protobufAttrInput1: ClassDecl
    let protobufAttrInput2: ClassDecl
    let protobufAttrInput3: ClassDecl
    let protobufAttrInput4: ClassDecl
    let scoperInput1: ClassDecl
    let scoperInput2: ClassDecl
    let storageInput1: ClassDecl
    let patcherInput1: ClassDecl
    let deleteStrategyInput1: ClassDecl
    let updateStrategyInput1: ClassDecl
    let equatableInput1: ClassDecl
    let genericSingleResourceInput1: ClassDecl
    let internalGenericListResourceInput1: ClassDecl
    let patchMetaInput1: ClassDecl
    let patchMetaInput2: ClassDecl
    let patchMetaInput3: ClassDecl
    let patchMetaInput4: ClassDecl
    let serializableInput1: ClassDecl
    let serializableInput2: ClassDecl
    let serializableInput3: ClassDecl

    let entryInput1: ClassDecl
    let entryInput2: ClassDecl
    let entryInput3: ClassDecl

    TestClassDeclToTokens() {
        this.cloneableInput1 = (parseDecl(cangjieLex(cloneableStr1)) as ClassDecl).getOrThrow()
        this.cloneableInput2 = (parseDecl(cangjieLex(cloneableStr2)) as ClassDecl).getOrThrow()
        this.cloneableInput3 = (parseDecl(cangjieLex(cloneableStr3)) as ClassDecl).getOrThrow()
        this.cloneableInput4 = (parseDecl(cangjieLex(cloneableStr4)) as ClassDecl).getOrThrow()
        this.protobufAttrInput1 = (parseDecl(cangjieLex(protobufAttrStr1)) as ClassDecl).getOrThrow()
        this.protobufAttrInput2 = (parseDecl(cangjieLex(protobufAttrStr2)) as ClassDecl).getOrThrow()
        this.protobufAttrInput3 = (parseDecl(cangjieLex(protobufAttrStr3)) as ClassDecl).getOrThrow()
        this.protobufAttrInput4 = (parseDecl(cangjieLex(protobufAttrStr4)) as ClassDecl).getOrThrow()
        this.scoperInput1 = (parseDecl(cangjieLex(scoperStr1)) as ClassDecl).getOrThrow()
        this.scoperInput2 = (parseDecl(cangjieLex(scoperStr2)) as ClassDecl).getOrThrow()
        this.storageInput1 = (parseDecl(cangjieLex(storageStr1)) as ClassDecl).getOrThrow()
        this.patcherInput1 = (parseDecl(cangjieLex(patcherStr1)) as ClassDecl).getOrThrow()
        this.deleteStrategyInput1 = (parseDecl(cangjieLex(deleteStrategyStr1)) as ClassDecl).getOrThrow()
        this.updateStrategyInput1 = (parseDecl(cangjieLex(updateStrategyStr1)) as ClassDecl).getOrThrow()
        this.equatableInput1 = (parseDecl(cangjieLex(equatableStr1)) as ClassDecl).getOrThrow()
        this.genericSingleResourceInput1 = (parseDecl(cangjieLex(genericSingleResourceStr1)) as ClassDecl).getOrThrow()
        this.internalGenericListResourceInput1 = (parseDecl(cangjieLex(internalGenericListResourceStr1)) as ClassDecl).getOrThrow()
        this.patchMetaInput1 = (parseDecl(cangjieLex(patchMetaStr1)) as ClassDecl).getOrThrow()
        this.patchMetaInput2 = (parseDecl(cangjieLex(patchMetaStr2)) as ClassDecl).getOrThrow()
        this.patchMetaInput3 = (parseDecl(cangjieLex(patchMetaStr3)) as ClassDecl).getOrThrow()
        this.patchMetaInput4 = (parseDecl(cangjieLex(patchMetaStr4)) as ClassDecl).getOrThrow()
        this.serializableInput1 = (parseDecl(cangjieLex(serializableStr1)) as ClassDecl).getOrThrow()
        this.serializableInput2 = (parseDecl(cangjieLex(serializableStr2)) as ClassDecl).getOrThrow()
        this.serializableInput3 = (parseDecl(cangjieLex(serializableStr3)) as ClassDecl).getOrThrow()

        this.entryInput1 = (parseDecl(cangjieLex(entryStr1)) as ClassDecl).getOrThrow()
        this.entryInput2 = (parseDecl(cangjieLex(entryStr2)) as ClassDecl).getOrThrow()
        this.entryInput3 = (parseDecl(cangjieLex(entryStr3)) as ClassDecl).getOrThrow()
    }

    @Bench
    func BenchmarkClassDeclToTokens_001():Unit {
        this.cloneableInput1.toTokens()
        ()
    }

    @Bench
    func BenchmarkClassDeclToTokens_002():Unit {
        this.cloneableInput2.toTokens()
        ()
    }
    
    @Bench
    func BenchmarkClassDeclToTokens_003():Unit {
        this.cloneableInput3.toTokens()
        ()
    }
    @Bench
    func BenchmarkClassDeclToTokens_004():Unit {
        this.cloneableInput4.toTokens()
        ()
    }
    @Bench
    func BenchmarkClassDeclToTokens_005():Unit {
        this.protobufAttrInput1.toTokens()
        ()
    }
    @Bench
    func BenchmarkClassDeclToTokens_006():Unit {
        this.protobufAttrInput2.toTokens()
        ()
    }
    @Bench
    func BenchmarkClassDeclToTokens_007():Unit {
        this.protobufAttrInput3.toTokens()
        ()
    }
    @Bench
    func BenchmarkClassDeclToTokens_008():Unit {
        this.protobufAttrInput4.toTokens()
        ()
    }
    @Bench
    func BenchmarkClassDeclToTokens_009():Unit {
        this.scoperInput1.toTokens()
        ()
    }    
    @Bench
    func BenchmarkClassDeclToTokens_010():Unit {
        this.scoperInput2.toTokens()
        ()
    }
    @Bench
    func BenchmarkClassDeclToTokens_011():Unit {
        this.storageInput1.toTokens()
        ()
    }
    @Bench
    func BenchmarkClassDeclToTokens_012():Unit {
        this.patcherInput1.toTokens()
        ()
    }
    @Bench
    func BenchmarkClassDeclToTokens_013():Unit {
        this.deleteStrategyInput1.toTokens()
        ()
    }
    @Bench
    func BenchmarkClassDeclToTokens_014():Unit {
        this.updateStrategyInput1.toTokens()
        ()
    }
    @Bench
    func BenchmarkClassDeclToTokens_015():Unit {
        this.equatableInput1.toTokens()
        ()
    }
    @Bench
    func BenchmarkClassDeclToTokens_016():Unit {
        this.genericSingleResourceInput1.toTokens()
        ()
    }
    @Bench
    func BenchmarkClassDeclToTokens_017():Unit {
        this.internalGenericListResourceInput1.toTokens()
        ()
    }
    @Bench
    func BenchmarkClassDeclToTokens_018():Unit {
        this.patchMetaInput1.toTokens()
        ()
    }

    @Bench
    func BenchmarkClassDeclToTokens_019():Unit {
        this.patchMetaInput2.toTokens()
        ()
    }
    
    @Bench
    func BenchmarkClassDeclToTokens_020():Unit {
        this.patchMetaInput3.toTokens()
        ()
    }
    @Bench
    func BenchmarkClassDeclToTokens_021():Unit {
        this.patchMetaInput4.toTokens()
        ()
    }
    @Bench
    func BenchmarkClassDeclToTokens_022():Unit {
        this.serializableInput1.toTokens()
        ()
    }

    @Bench
    func BenchmarkClassDeclToTokens_023():Unit {
        this.serializableInput2.toTokens()
        ()
    }
    
    @Bench
    func BenchmarkClassDeclToTokens_024():Unit {
        this.serializableInput3.toTokens()
        ()
    }



    @Bench
    func BenchmarkClassDeclToTokens_025():Unit {
        this.entryInput1.toTokens()
        ()
    }
    @Bench
    func BenchmarkClassDeclToTokens_026():Unit {
        this.entryInput2.toTokens()
        ()
    }
    @Bench
    func BenchmarkClassDeclToTokens_027():Unit {
        this.entryInput3.toTokens()
        ()
    }
}

@Test 
class TestClassDeclBodyDeclsToTokens {
    let gqlOperationInput1: ClassDecl
    let gqlOperationInput2: ClassDecl
    let gqlSerializeInput1: ClassDecl
    let gqlSerializeInput2: ClassDecl

    TestClassDeclBodyDeclsToTokens() {
        this.gqlOperationInput1 = (parseDecl(cangjieLex(gqlOperationStr1)) as ClassDecl).getOrThrow()
        this.gqlOperationInput2 = (parseDecl(cangjieLex(gqlOperationStr2)) as ClassDecl).getOrThrow()
        this.gqlSerializeInput1 = (parseDecl(cangjieLex(gqlSerializeStr1)) as ClassDecl).getOrThrow()
        this.gqlSerializeInput2 = (parseDecl(cangjieLex(gqlSerializeStr2)) as ClassDecl).getOrThrow()
       
    }

    @Bench
    func BenchmarkClassDeclToTokens_body_decls_001():Unit {
        var body = Tokens()
        for (item in gqlOperationInput1.body.decls) {
            match(item) {
                case ctor: PrimaryCtorDecl =>
                    body += ctor.toTokens()
                case _ =>
                    body += item.toTokens()
            }
        }
        ()
    }
    @Bench
    func BenchmarkClassDeclToTokens_body_decls_002():Unit {
        var body = Tokens()
        for (item in gqlOperationInput2.body.decls) {
            match(item) {
                case ctor: PrimaryCtorDecl =>
                    body += ctor.toTokens()
                case _ =>
                    body += item.toTokens()
            }
        }
        ()
    }
    @Bench
    func BenchmarkClassDeclToTokens_body_decls_003(): Unit {
        var body = Tokens()
        for (item in gqlSerializeInput1.body.decls) {
            if (let Some(ctor) <- (item as PrimaryCtorDecl)) { () }
            body += item.toTokens()
        }
        ()
    }
    @Bench
    func BenchmarkClassDeclToTokens_body_decls_004(): Unit {
        var body = Tokens()
        for (item in gqlSerializeInput2.body.decls) {
            if (let Some(ctor) <- (item as PrimaryCtorDecl)) { () }
            body += item.toTokens()
        }
        ()
    }
}