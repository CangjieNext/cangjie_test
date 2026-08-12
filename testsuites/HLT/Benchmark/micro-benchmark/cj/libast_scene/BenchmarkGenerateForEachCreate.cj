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
class TestGenerateForEachCreate {
    let forEachCreateInput1: CallExpr
    let forEachCreateInput2: CallExpr
    let forEachCreateInput3: CallExpr
    let forEachCreateInput4: CallExpr
    let forEachCreateInput5: CallExpr
    let forEachCreateInput6: CallExpr
    let forEachCreateInput7: CallExpr
    let forEachCreateInput8: CallExpr

    TestGenerateForEachCreate() {
        this.forEachCreateInput1 = (parseExpr(cangjieLex(forEachCreateLambdaStr1)) as CallExpr).getOrThrow()
        this.forEachCreateInput2 = (parseExpr(cangjieLex(forEachCreateLambdaStr2)) as CallExpr).getOrThrow()
        this.forEachCreateInput3 = (parseExpr(cangjieLex(forEachCreateLambdaStr3)) as CallExpr).getOrThrow()
        this.forEachCreateInput4 = (parseExpr(cangjieLex(forEachCreateLambdaStr4)) as CallExpr).getOrThrow()
        this.forEachCreateInput5 = (parseExpr(cangjieLex(forEachCreateLambdaStr5)) as CallExpr).getOrThrow()
        this.forEachCreateInput6 = (parseExpr(cangjieLex(forEachCreateLambdaStr6)) as CallExpr).getOrThrow()
        this.forEachCreateInput7 = (parseExpr(cangjieLex(forEachCreateLambdaStr7)) as CallExpr).getOrThrow()
        this.forEachCreateInput8 = (parseExpr(cangjieLex(forEachCreateLambdaStr8)) as CallExpr).getOrThrow()
    }

    func generateForEachCreateOrLate(callExpr: CallExpr): Unit {
        let baseExpr = callExpr.callFunc
        let paraExpr = callExpr.arguments[1].expr
        let lamExpr = match (paraExpr) {
            case v: LambdaExpr => v
            case _ => return
        }
        var res = quote($baseExpr)
        var dataParam = Tokens()
        for(param in lamExpr.funcParams){
            dataParam = dataParam + quote($param)
        }
        for (idx in 0..callExpr.arguments.size) {
            let para = callExpr.arguments[idx]
            let paraExpr = para.expr
            if (idx == 1) {
                res = res + dataParam
            } else {
                res = res + quote($para)
            }
        }
        ()
    }

    @Bench
    func BenchmarkGenerateForEachCreate_001(): Unit {
        generateForEachCreateOrLate(forEachCreateInput1)
    }
    @Bench
    func BenchmarkGenerateForEachCreate_002(): Unit {
        generateForEachCreateOrLate(forEachCreateInput2)
    }
    @Bench
    func BenchmarkGenerateForEachCreate_003(): Unit {
        generateForEachCreateOrLate(forEachCreateInput3)
    }
    @Bench
    func BenchmarkGenerateForEachCreate_004(): Unit {
        generateForEachCreateOrLate(forEachCreateInput4)
    }
    @Bench
    func BenchmarkGenerateForEachCreate_005(): Unit {
        generateForEachCreateOrLate(forEachCreateInput5)
    }
    @Bench
    func BenchmarkGenerateForEachCreate_006(): Unit {
        generateForEachCreateOrLate(forEachCreateInput6)
    }
    @Bench
    func BenchmarkGenerateForEachCreate_007(): Unit {
        generateForEachCreateOrLate(forEachCreateInput7)
    }
    @Bench
    func BenchmarkGenerateForEachCreate_008(): Unit {
        generateForEachCreateOrLate(forEachCreateInput8)
    }
}
