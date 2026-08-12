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
class TestGetOptionBaseType {
    let gqlSerializeInput1: ArrayList<TypeNode>
    let gqlSerializeInput2: ArrayList<TypeNode>

    TestGetOptionBaseType() {
        this.gqlSerializeInput1 = getCtorParamType((parseDecl(cangjieLex(gqlSerializeStr1)) as ClassDecl).getOrThrow())
        this.gqlSerializeInput2 = getCtorParamType((parseDecl(cangjieLex(gqlSerializeStr2)) as ClassDecl).getOrThrow())
    }

    public func getOptionBaseType(node: TypeNode): Tokens {
        match(node) {
            case pt: PrefixType => return pt.baseType.toTokens()
            case rt: RefType =>
                if (rt.identifier.value == "Option") {
                    return rt.typeArguments.toTokens()
                } else {
                    return node.toTokens()
                }
            case _ => return node.toTokens()
        }
    }


    @Bench
    func BenchmarkGetOptionBaseType_ctor_funcParams_type_toTokens_001(): Unit {
        for (item in gqlSerializeInput1) {
            getOptionBaseType(item)
        }
        ()
    }

    @Bench
    func BenchmarkGetOptionBaseType_ctor_funcParams_type_toTokens_002(): Unit {
        for (item in gqlSerializeInput2) {
            getOptionBaseType(item)
        }
        ()
    }
}