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
public class TestParseMethodsForTokens {
    let scoperInlineInput1: Tokens
    let deleteStrategyInlineInput1: Tokens
    let updateStrategyInlineInput1: Tokens

    TestParseMethodsForTokens() {
        this.scoperInlineInput1 = cangjieLex(scoperInlineStr1)
        this.deleteStrategyInlineInput1 = cangjieLex(deleteStrategyInlineStr1)
        this.updateStrategyInlineInput1 = cangjieLex(updateStrategyInlineStr1)
    }

    public static func parseMethodsForTokens(tokens: Tokens): Unit {
        var funcDecl = (parseDecl(tokens) as FuncDecl).getOrThrow()

        var methodIdentifier = Tokens().append(funcDecl.identifier)
        var params = funcDecl.funcParams
        for (param in params) {
            methodIdentifier.append(param.paramType.toTokens())
        }

        let name = methodIdentifier.toString()
        let isStatic = judgeModifiersHasStatic(funcDecl.modifiers.toTokens())
        ()
    }
    @Bench
    func BenchmarkParseMethodsForTokens_001():Unit {
        parseMethodsForTokens(scoperInlineInput1)
    }

    @Bench
    func BenchmarkParseMethodsForTokens_002():Unit {
        parseMethodsForTokens(deleteStrategyInlineInput1)
    }
    @Bench
    func BenchmarkParseMethodsForTokens_003():Unit {
        parseMethodsForTokens(updateStrategyInlineInput1)
    }
}
