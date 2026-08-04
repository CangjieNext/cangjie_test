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
class TestGqlOperation {
    let gqlOperationInput1: Tokens
    let gqlOperationInput2: Tokens
    TestGqlOperation() {
        this.gqlOperationInput1 = cangjieLex(gqlOperationStr1)
        this.gqlOperationInput2 = cangjieLex(gqlOperationStr2)
    }
    func gqlOperation(input: Tokens): Tokens {
        let decl = parseDecl(input)
        var body = Tokens()
        if (let Some(cd) <- (decl as ClassDecl)) {
            let modifiers = cd.modifiers.toTokens()
            let identifier = cd.identifier
            let superTypes = cd.superTypes.toTokens()

            for (item in cd.body.decls) {
                match(item) {
                    case ctor: PrimaryCtorDecl =>
                        body += ctor.toTokens()
                    case _ =>
                        body += item.toTokens()
                }
            }
        }
        body    
    }
    
    @Bench
    func BenchmarkGqlOperation_001():Unit {
        let body = gqlOperation(gqlOperationInput1)
    }
    @Bench
    func BenchmarkGqlOperation_002():Unit {
        let body = gqlOperation(gqlOperationInput2)
    }
}