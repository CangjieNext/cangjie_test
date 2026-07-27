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
public class TestMacroGeneratorBody {
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

    TestMacroGeneratorBody() {
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
    }

    public func body(interfaceNames: Collection<Tokens>, classDecl: ClassDecl): Unit {
        for (interfaceName in interfaceNames) {
            if (interfaceName.size == 0) {
                continue
            }
            var refType = RefType(interfaceName)
            classDecl.superTypes.add(refType)
        }
		classDecl.upperBound = Token(TokenKind.UPPERBOUND)
        var tks = classDecl.toTokens()
        var output = Tokens()
        for (i in 0..tks.size - 2) {
            output.append(tks[i])
        }
        output.append(quote(}))
        ()
    }

    @Bench
    func BenchmarkMacroGeneratorBody_001():Unit {
        let interfaceName = quote(Cloneable<$(cloneableInput1.identifier)>)
        let interfaceNames = [interfaceName]
        body(interfaceNames, this.cloneableInput1)
    }

    @Bench
    func BenchmarkMacroGeneratorBody_002():Unit {
        let interfaceName = quote(Cloneable<$(cloneableInput2.identifier)>)
        let interfaceNames = [interfaceName]
        body(interfaceNames, this.cloneableInput2)
    }
    
    @Bench
    func BenchmarkMacroGeneratorBody_003():Unit {
        let interfaceName = quote(Cloneable<$(cloneableInput3.identifier)>)
        let interfaceNames = [interfaceName]
        body(interfaceNames, this.cloneableInput3)
    }
    @Bench
    func BenchmarkMacroGeneratorBody_004():Unit {
        let interfaceName = quote(Cloneable<$(cloneableInput4.identifier)>)
        let interfaceNames = [interfaceName]
        body(interfaceNames, this.cloneableInput4)
    }
    @Bench
    func BenchmarkMacroGeneratorBody_005():Unit {
        let interfaceName = quote(Protobufable)
        let interfaceNames = [interfaceName]
        body(interfaceNames, this.protobufAttrInput1)
    }
    @Bench
    func BenchmarkMacroGeneratorBody_006():Unit {
        let interfaceName = quote(Protobufable)
        let interfaceNames = [interfaceName]
        body(interfaceNames, this.protobufAttrInput2)
    }
    @Bench
    func BenchmarkMacroGeneratorBody_007():Unit {
        let interfaceName = quote(Protobufable)
        let interfaceNames = [interfaceName]
        body(interfaceNames, this.protobufAttrInput3)
    }
    @Bench
    func BenchmarkMacroGeneratorBody_008():Unit {
        let interfaceName = quote(Protobufable)
        let interfaceNames = [interfaceName]
        body(interfaceNames, this.protobufAttrInput4)
    }
    @Bench
    func BenchmarkMacroGeneratorBody_009():Unit {
        let interfaceName = quote(Scoper)
        let interfaceNames = [interfaceName]
        body(interfaceNames, this.scoperInput1)
    }    
    @Bench
    func BenchmarkMacroGeneratorBody_010():Unit {
        let interfaceName = quote(Scoper)
        let interfaceNames = [interfaceName]
        body(interfaceNames, this.scoperInput2)
    }
    @Bench
    func BenchmarkMacroGeneratorBody_011():Unit {
        let interfaceName = quote(Storage)
        let interfaceNames = [interfaceName]
        body(interfaceNames, this.storageInput1)
    }
    @Bench
    func BenchmarkMacroGeneratorBody_012():Unit {
        let interfaceName = quote(Patcher)
        let interfaceNames = [interfaceName]
        body(interfaceNames, this.patcherInput1)
    }
    @Bench
    func BenchmarkMacroGeneratorBody_013():Unit {
        let interfaceName = quote(DeleteStrategy)
        let interfaceNames = [interfaceName]
        body(interfaceNames, this.deleteStrategyInput1)
    }
    @Bench
    func BenchmarkMacroGeneratorBody_014():Unit {
        let interfaceName = quote(UpdateStrategy)
        let interfaceNames = [interfaceName]
        body(interfaceNames, this.updateStrategyInput1)
    }
    @Bench
    func BenchmarkMacroGeneratorBody_015():Unit {
        let interfaceName = quote(Equatable<$(equatableInput1.identifier)>)
        let interfaceNames = [interfaceName]
        body(interfaceNames, this.equatableInput1)
    }
    @Bench
    func BenchmarkMacroGeneratorBody_016():Unit {
        let interfaceNames = [
            quote(Serializable<$(genericSingleResourceInput1.identifier)>),
            quote(JsonSerializable),
            quote(ObjectKind),
            quote(Cloneable<$(genericSingleResourceInput1.identifier)>),
            quote(RuntimeObject),
            quote(IObjectMeta),
            quote(ObjectMetaAccessor),
            quote(ObjectClassAccessor)
        ]
        body(interfaceNames, this.genericSingleResourceInput1)
    }
    @Bench
    func BenchmarkMacroGeneratorBody_017():Unit {
        let interfaceNames = [
            quote(ObjectKind),
            quote(Cloneable<$(internalGenericListResourceInput1.identifier)>),
            quote(RuntimeObject),
            quote(ListInterface),
            quote(ListMetaAccessor),
            quote(ObjectClassAccessor),
            quote(Appendable)
        ]
        body(interfaceNames, this.internalGenericListResourceInput1)

    }
    @Bench
    func BenchmarkMacroGeneratorBody_018():Unit {
        let interfaceNames = [
            quote(LookupPatchMeta),
            quote(LookupPatchMetaAccessor)
        ]
        body(interfaceNames, this.patchMetaInput1)
    }

    @Bench
    func BenchmarkMacroGeneratorBody_019():Unit {
        let interfaceNames = [
            quote(LookupPatchMeta),
            quote(LookupPatchMetaAccessor)
        ]
        body(interfaceNames, this.patchMetaInput2)
    }
    @Bench
    func BenchmarkMacroGeneratorBody_020():Unit {
        let interfaceNames = [
            quote(LookupPatchMeta),
            quote(LookupPatchMetaAccessor)
        ]
        body(interfaceNames, this.patchMetaInput3)
    }    
    @Bench
    func BenchmarkMacroGeneratorBody_021():Unit {
        let interfaceNames = [
            quote(LookupPatchMeta),
            quote(LookupPatchMetaAccessor)
        ]
        body(interfaceNames, this.patchMetaInput4)
    }
    @Bench
    func BenchmarkMacroGeneratorBody_022():Unit {
        let interfaceName = quote(Serializable<$(serializableInput1.identifier)>)
        let interfaceNames = [interfaceName]
        body(interfaceNames, this.serializableInput1)
    }
    @Bench
    func BenchmarkMacroGeneratorBody_023():Unit {
        let interfaceName = quote(Serializable<$(serializableInput2.identifier)>)
        let interfaceNames = [interfaceName]
        body(interfaceNames, this.serializableInput2)
    }   
     @Bench
    func BenchmarkMacroGeneratorBody_024():Unit {
        let interfaceName = quote(Serializable<$(serializableInput3.identifier)>)
        let interfaceNames = [interfaceName]
        body(interfaceNames, this.serializableInput3)
    }
}
