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
public class TestRefType {
    let cloneableInput1: Array<Tokens>
    let cloneableInput2: Array<Tokens>
    let cloneableInput3: Array<Tokens>
    let cloneableInput4: Array<Tokens>
    let protobufAttrInput: Array<Tokens>
    let deleteStrategyInput: Array<Tokens>
    let genericSingleResourceInput1: Array<Tokens>
    let internalGenericListResourceInput1: Array<Tokens>
    let patchMetaInput: Array<Tokens>

    let builderInput1: ArrayList<Tokens> = ArrayList<Tokens>()
    let builderInput2: ArrayList<Tokens> = ArrayList<Tokens>()
    let builderInput3: ArrayList<Tokens> = ArrayList<Tokens>()

    TestRefType() {
        let cloneableID1 = (parseDecl(cangjieLex(cloneableStr1)) as ClassDecl).getOrThrow().identifier
        let cloneableID2 = (parseDecl(cangjieLex(cloneableStr2)) as ClassDecl).getOrThrow().identifier
        let cloneableID3 = (parseDecl(cangjieLex(cloneableStr3)) as ClassDecl).getOrThrow().identifier
        let cloneableID4 = (parseDecl(cangjieLex(cloneableStr4)) as ClassDecl).getOrThrow().identifier

        this.cloneableInput1 = [quote(Cloneable<$cloneableID1>)]
        this.cloneableInput2 = [quote(Cloneable<$cloneableID2>)]
        this.cloneableInput3 = [quote(Cloneable<$cloneableID3>)]
        this.cloneableInput4 = [quote(Cloneable<$cloneableID4>)]
        this.protobufAttrInput = [quote(Protobufable)]
        this.deleteStrategyInput = [quote(DeleteStrategy)]

        let genericSingleResourceID1 = (parseDecl(cangjieLex(genericSingleResourceStr1)) as ClassDecl).getOrThrow().identifier
        this.genericSingleResourceInput1 = [
            quote(Serializable<$genericSingleResourceID1>),
            quote(JsonSerializable),
            quote(ObjectKind),
            quote(Cloneable<$genericSingleResourceID1>),
            quote(RuntimeObject),
            quote(IObjectMeta),
            quote(ObjectMetaAccessor),
            quote(ObjectClassAccessor)
        ]
        
        let internalGenericListResourceID1 = (parseDecl(cangjieLex(internalGenericListResourceStr1)) as ClassDecl).getOrThrow().identifier
        this.internalGenericListResourceInput1 = [
            quote(ObjectKind),
            quote(Cloneable<$internalGenericListResourceID1>),
            quote(RuntimeObject),
            quote(ListInterface),
            quote(ListMetaAccessor),
            quote(ObjectClassAccessor),
            quote(Appendable)
        ]
        
        this.patchMetaInput = [
            quote(LookupPatchMeta),
            quote(LookupPatchMetaAccessor)
        ]

        let fp1 = (parseDecl(cangjieLex(builderStr1)) as FuncDecl).getOrThrow().funcParams
        for (param in fp1) {
            this.builderInput1.add(quote(ObservedProperty<$(param.paramType)>))
        }
        let fp2 = (parseDecl(cangjieLex(builderStr2)) as FuncDecl).getOrThrow().funcParams
        for (param in fp2) {
            this.builderInput2.add(quote(ObservedProperty<$(param.paramType)>))
        }
        let fp3 = (parseDecl(cangjieLex(builderStr3)) as FuncDecl).getOrThrow().funcParams
        for (param in fp3) {
            this.builderInput3.add(quote(ObservedProperty<$(param.paramType)>))
        }
    }


    @Bench
    func BenchmarkRefType_001():Unit {
        for (interfaceName in cloneableInput1) {
            if (interfaceName.size == 0) {
                continue
            }
            var refType = RefType(interfaceName)
        }
        ()
    }

    @Bench
    func BenchmarkRefType_002():Unit {
        for (interfaceName in cloneableInput2) {
            if (interfaceName.size == 0) {
                continue
            }
            var refType = RefType(interfaceName)
        }
        ()
    }
    
    @Bench
    func BenchmarkRefType_003():Unit {
        for (interfaceName in cloneableInput3) {
            if (interfaceName.size == 0) {
                continue
            }
            var refType = RefType(interfaceName)
        }
        ()
    }
    @Bench
    func BenchmarkRefType_004():Unit {
        for (interfaceName in cloneableInput4) {
            if (interfaceName.size == 0) {
                continue
            }
            var refType = RefType(interfaceName)
        }
        ()
    }
    @Bench
    func BenchmarkRefType_005():Unit {
        for (interfaceName in protobufAttrInput) {
            if (interfaceName.size == 0) {
                continue
            }
            var refType = RefType(interfaceName)
        }

    }

    @Bench
    func BenchmarkRefType_006():Unit {
        for (interfaceName in deleteStrategyInput) {
            if (interfaceName.size == 0) {
                continue
            }
            var refType = RefType(interfaceName)
        }
        ()
    }

    @Bench
    func BenchmarkRefType_007():Unit {
        for (interfaceName in genericSingleResourceInput1) {
            if (interfaceName.size == 0) {
                continue
            }
            var refType = RefType(interfaceName)
        }
        ()
    }
    @Bench
    func BenchmarkRefType_008():Unit {
        for (interfaceName in internalGenericListResourceInput1) {
            if (interfaceName.size == 0) {
                continue
            }
            var refType = RefType(interfaceName)
        }
        ()
    }
    @Bench
    func BenchmarkRefType_009():Unit {
        for (interfaceName in patchMetaInput) {
            if (interfaceName.size == 0) {
                continue
            }
            var refType = RefType(interfaceName)
        }
        ()
    }

    
    @Bench
    func BenchmarkRefType_010(): Unit {
        for (tokens in builderInput1) {
            RefType(tokens)
        }
        ()
    }
    @Bench
    func BenchmarkRefType_011(): Unit {
        for (tokens in builderInput2) {
            RefType(tokens)
        }
        ()
    }
    @Bench
    func BenchmarkRefType_012(): Unit {
        for (tokens in builderInput3) {
            RefType(tokens)
        }
        ()
    }
}
