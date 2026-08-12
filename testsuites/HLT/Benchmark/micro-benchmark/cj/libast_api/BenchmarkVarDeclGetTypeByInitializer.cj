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

extend VarDecl {
    func getTypeByInitializer(): Tokens {
        try {
            let v = this.declType
            return quote($v)
        } catch (e: Exception) {
            ()
        }

        let identifier = identifier.value
        let initValue = expr

        match (initValue) {
            case v: LitConstExpr =>
                match (v.literal.kind) {
                    case STRING_LITERAL => quote(String)
                    case BOOL_LITERAL => quote(Bool)
                    case FLOAT_LITERAL => quote(Float64)
                    case INTEGER_LITERAL => quote(Int64)
                    case CHAR_LITERAL => quote(Rune)
                    case _ => Tokens()
                }
            case _ => Tokens()
        }
    }
}

@Test
@Measure[TimeNow(Nanos)]
class TestVarDeclGetTypeByInitializer {
    let stateInput1: VarDecl
    let stateInput2: VarDecl
    let stateInput3: VarDecl
    let publishInput1: VarDecl
    let storagePropAttrInput1: VarDecl
    let observedInput1: ArrayList<VarDecl>
    let observedInput2: ArrayList<VarDecl>
    let observedInput3: ArrayList<VarDecl>
    let customDialogInput1: ArrayList<VarDecl>
    let componentInput1: ArrayList<VarDecl>
    let componentInput2: ArrayList<VarDecl>
    let componentInput3: ArrayList<VarDecl>
    let componentInput4: ArrayList<VarDecl>
    let componentInput5: ArrayList<VarDecl>
    let componentInput6: ArrayList<VarDecl> 

    TestVarDeclGetTypeByInitializer() {
        this.stateInput1 = (parseDecl(cangjieLex(stateStr1)) as VarDecl).getOrThrow()
        this.stateInput2 = (parseDecl(cangjieLex(stateStr2)) as VarDecl).getOrThrow()
        this.stateInput3 = (parseDecl(cangjieLex(stateStr3)) as VarDecl).getOrThrow()
        this.publishInput1 = (parseDecl(cangjieLex(publishStr1)) as VarDecl).getOrThrow()
        this.storagePropAttrInput1 = (parseDecl(cangjieLex(storagePropAttrStr1)) as VarDecl).getOrThrow()
        this.observedInput1 = getVarDecls((parseDecl(cangjieLex(observedStr1)) as ClassDecl).getOrThrow())
        this.observedInput2 = getVarDecls((parseDecl(cangjieLex(observedStr2)) as ClassDecl).getOrThrow())
        this.observedInput3 = getVarDecls((parseDecl(cangjieLex(observedStr3)) as ClassDecl).getOrThrow())
        this.customDialogInput1 = getVarDecls((parseDecl(cangjieLex(customDialogStr1)) as ClassDecl).getOrThrow())
        this.componentInput1 = getVarDecls((parseDecl(cangjieLex(componentStr1)) as ClassDecl).getOrThrow())
        this.componentInput2 = getVarDecls((parseDecl(cangjieLex(componentStr2)) as ClassDecl).getOrThrow())
        this.componentInput3 = getVarDecls((parseDecl(cangjieLex(componentStr3)) as ClassDecl).getOrThrow())
        this.componentInput4 = getVarDecls((parseDecl(cangjieLex(componentStr4)) as ClassDecl).getOrThrow())
        this.componentInput5 = getVarDecls((parseDecl(cangjieLex(componentStr5)) as ClassDecl).getOrThrow())
        this.componentInput6 = getVarDecls((parseDecl(cangjieLex(componentStr6)) as ClassDecl).getOrThrow())
    }

    @Bench
    func BenchmarkVarDeclGetTypeByInitializer_001() : Unit {
        let valType = stateInput1.getTypeByInitializer()
    }

    @Bench
    func BenchmarkVarDeclGetTypeByInitializer_002() : Unit {
        let valType = stateInput2.getTypeByInitializer()
    }
 
    @Bench
    func BenchmarkVarDeclGetTypeByInitializer_003() : Unit {
        let valType = stateInput3.getTypeByInitializer()
    }
    @Bench
    func BenchmarkVarDeclGetTypeByInitializer_004() : Unit {
        let valType = publishInput1.getTypeByInitializer()
    }
    @Bench
    func BenchmarkVarDeclGetTypeByInitializer_005() : Unit {
        let valType = storagePropAttrInput1.getTypeByInitializer()
    }
    @Bench
    func BenchmarkVarDeclsGetTypeByInitializer_001() : Unit {
        for (varDecl in observedInput1) {
            let valType = varDecl.getTypeByInitializer()
        }
    }
    @Bench
    func BenchmarkVarDeclsGetTypeByInitializer_002() : Unit {
        for (varDecl in observedInput2) {
            let valType = varDecl.getTypeByInitializer()
        }
    }
    @Bench
    func BenchmarkVarDeclsGetTypeByInitializer_003() : Unit {
        for (varDecl in observedInput3) {
            let valType = varDecl.getTypeByInitializer()
        }
    }
    @Bench
    func BenchmarkVarDeclsGetTypeByInitializer_004() : Unit {
        for (varDecl in customDialogInput1) {
            let valType = varDecl.getTypeByInitializer()
        }
    }
    @Bench
    func BenchmarkVarDeclsGetTypeByInitializer_005() : Unit {
        for (varDecl in componentInput1) {
            let valType = varDecl.getTypeByInitializer()
        }
    }
    @Bench
    func BenchmarkVarDeclsGetTypeByInitializer_006() : Unit {
        for (varDecl in componentInput2) {
            let valType = varDecl.getTypeByInitializer()
        }
    }
    @Bench
    func BenchmarkVarDeclsGetTypeByInitializer_007() : Unit {
        for (varDecl in componentInput3) {
            let valType = varDecl.getTypeByInitializer()
        }
    }
    @Bench
    func BenchmarkVarDeclsGetTypeByInitializer_008() : Unit {
        for (varDecl in componentInput4) {
            let valType = varDecl.getTypeByInitializer()
        }
    }
    @Bench
    func BenchmarkVarDeclsGetTypeByInitializer_009() : Unit {
        for (varDecl in componentInput5) {
            let valType = varDecl.getTypeByInitializer()
        }
    }
    @Bench
    func BenchmarkVarDeclsGetTypeByInitializer_010() : Unit {
        for (varDecl in componentInput6) {
            let valType = varDecl.getTypeByInitializer()
        }
    }
}
