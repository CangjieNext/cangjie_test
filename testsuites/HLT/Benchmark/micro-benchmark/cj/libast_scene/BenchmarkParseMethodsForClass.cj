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
class TestParseMethodsForClass {
    let scoperInput1: ClassDecl
    let scoperInput2: ClassDecl
    let storageInput1: ClassDecl
    let patcherInput1: ClassDecl
    let deleteStrategyInput1: ClassDecl
    let updateStrategyInput1: ClassDecl
    let genericSingleResourceInput1: ClassDecl
    let serializableInput1: ClassDecl
    let serializableInput2: ClassDecl
    let serializableInput3: ClassDecl

    TestParseMethodsForClass() {
        this.scoperInput1 = (parseDecl(cangjieLex(scoperStr1)) as ClassDecl).getOrThrow()
        this.scoperInput2 = (parseDecl(cangjieLex(scoperStr2)) as ClassDecl).getOrThrow()
        this.storageInput1 = (parseDecl(cangjieLex(storageStr1)) as ClassDecl).getOrThrow()
        this.patcherInput1 = (parseDecl(cangjieLex(patcherStr1)) as ClassDecl).getOrThrow()
        this.deleteStrategyInput1 = (parseDecl(cangjieLex(deleteStrategyStr1)) as ClassDecl).getOrThrow()
        this.updateStrategyInput1 = (parseDecl(cangjieLex(updateStrategyStr1)) as ClassDecl).getOrThrow()
        this.genericSingleResourceInput1 = (parseDecl(cangjieLex(genericSingleResourceStr1)) as ClassDecl).getOrThrow()
        this.serializableInput1 = (parseDecl(cangjieLex(serializableStr1)) as ClassDecl).getOrThrow()
        this.serializableInput2 = (parseDecl(cangjieLex(serializableStr2)) as ClassDecl).getOrThrow()
        this.serializableInput3 = (parseDecl(cangjieLex(serializableStr3)) as ClassDecl).getOrThrow()
    }

    public static func parseMethodsForClass(classDecl:ClassDecl) {
        let bodyTokens = classDecl.body.decls
        for (token in bodyTokens) {
            var funcDecl = match (token as FuncDecl) {
                case Some(v) => v
                case None => continue
            }

            var methodIdentifier = Tokens().append(funcDecl.identifier)

            var params = funcDecl.funcParams
            for (param in params) {
                methodIdentifier.append(param.paramType.toTokens())
            }

            let name = methodIdentifier.toString()
            let isStatic = judgeModifiersHasStatic(funcDecl.modifiers.toTokens())
        }
        ()
    }

    @Bench
    func BenchmarkParseMethodsForClass_001():Unit {
        parseMethodsForClass(scoperInput1)
    }

    @Bench
    func BenchmarkParseMethodsForClass_002():Unit {
        parseMethodsForClass(scoperInput2)
    }
    @Bench
    func BenchmarkParseMethodsForClass_003():Unit {
        parseMethodsForClass(storageInput1)
    }

    @Bench
    func BenchmarkParseMethodsForClass_004():Unit {
        parseMethodsForClass(patcherInput1)
    }
    @Bench
    func BenchmarkParseMethodsForClass_005():Unit {
        parseMethodsForClass(deleteStrategyInput1)
    }

    @Bench
    func BenchmarkParseMethodsForClass_006():Unit {
        parseMethodsForClass(updateStrategyInput1)
    }
    @Bench
    func BenchmarkParseMethodsForClass_007():Unit {
        parseMethodsForClass(genericSingleResourceInput1)
    }

    @Bench
    func BenchmarkParseMethodsForClass_008():Unit {
        parseMethodsForClass(serializableInput1)
    }
    @Bench
    func BenchmarkParseMethodsForClass_009():Unit {
        parseMethodsForClass(serializableInput2)
    }

    @Bench
    func BenchmarkParseMethodsForClass_010():Unit {
        parseMethodsForClass(serializableInput3)
    }

}
