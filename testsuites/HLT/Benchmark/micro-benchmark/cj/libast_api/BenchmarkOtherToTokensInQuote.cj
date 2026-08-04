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
class TestOtherToTokensInQuote {
    let gqlSerializeInput2: ClassDecl
    let gqlSerializeInput3: EnumDecl
    let gqlSerializeInput4: EnumDecl
    let builderInput1: ArrayList<FuncParam>
    let builderInput2: ArrayList<FuncParam>
    let builderInput3: ArrayList<FuncParam>
    let observedInput1: ArrayList<Decl>
    let observedInput2: ArrayList<Decl>
    let observedInput3: ArrayList<Decl>
    let customDialogInput1: ArrayList<Decl>
    let componentInput1: ArrayList<Decl>
    let componentInput2: ArrayList<Decl>
    let componentInput3: ArrayList<Decl>
    let componentInput4: ArrayList<Decl>
    let componentInput5: ArrayList<Decl>
    let componentInput6: ArrayList<Decl>


    TestOtherToTokensInQuote() {
        this.gqlSerializeInput2 = (parseDecl(cangjieLex(gqlSerializeStr2)) as ClassDecl).getOrThrow()
        this.gqlSerializeInput3 = (parseDecl(cangjieLex(gqlSerializeStr3)) as EnumDecl).getOrThrow()
        this.gqlSerializeInput4 = (parseDecl(cangjieLex(gqlSerializeStr4)) as EnumDecl).getOrThrow()
        this.builderInput1 = (parseDecl(cangjieLex(builderStr1)) as FuncDecl).getOrThrow().funcParams
        this.builderInput2 = (parseDecl(cangjieLex(builderStr2)) as FuncDecl).getOrThrow().funcParams
        this.builderInput3 = (parseDecl(cangjieLex(builderStr3)) as FuncDecl).getOrThrow().funcParams
        this.observedInput1 = (parseDecl(cangjieLex(observedStr1)) as ClassDecl).getOrThrow().body.decls
        this.observedInput2 = (parseDecl(cangjieLex(observedStr2)) as ClassDecl).getOrThrow().body.decls
        this.observedInput3 = (parseDecl(cangjieLex(observedStr3)) as ClassDecl).getOrThrow().body.decls
        this.customDialogInput1 = (parseDecl(cangjieLex(customDialogStr1)) as ClassDecl).getOrThrow().body.decls
        this.componentInput1 = (parseDecl(cangjieLex(componentStr1)) as ClassDecl).getOrThrow().body.decls
        this.componentInput2 = (parseDecl(cangjieLex(componentStr2)) as ClassDecl).getOrThrow().body.decls
        this.componentInput3 = (parseDecl(cangjieLex(componentStr3)) as ClassDecl).getOrThrow().body.decls
        this.componentInput4 = (parseDecl(cangjieLex(componentStr4)) as ClassDecl).getOrThrow().body.decls
        this.componentInput5 = (parseDecl(cangjieLex(componentStr5)) as ClassDecl).getOrThrow().body.decls
        this.componentInput6 = (parseDecl(cangjieLex(componentStr6)) as ClassDecl).getOrThrow().body.decls

    }


    @Bench
    func BenchmarkOtherToTokensInQuote_ClassDecl_body_decls_001():Unit {
        let classBody = quote($observedInput1)
        ()
    }
    @Bench
    func BenchmarkOtherToTokensInQuote_ClassDecl_body_decls_002():Unit {
        let classBody = quote($observedInput2)
        ()
    }
    @Bench
    func BenchmarkOtherToTokensInQuote_ClassDecl_body_decls_003():Unit {
        let classBody = quote($observedInput3)
        ()
    }
    
    // in func handleClassBody
    @Bench 
    func BenchmarkOtherToTokensInQuote_ClassDecl_body_decls_004():Unit {
        for (decl in customDialogInput1) {
            let ret = quote(
                $decl
            )
        }
        ()
    }
    @Bench 
    func BenchmarkOtherToTokensInQuote_ClassDecl_body_decls_005():Unit {
        for (decl in componentInput1) {
            let ret = quote(
                $decl
            )
        }
        ()
    }
    @Bench 
    func BenchmarkOtherToTokensInQuote_ClassDecl_body_decls_006():Unit {
        for (decl in componentInput2) {
            let ret = quote(
                $decl
            )
        }
        ()
    }
    @Bench 
    func BenchmarkOtherToTokensInQuote_ClassDecl_body_decls_007():Unit {
        for (decl in componentInput3) {
            let ret = quote(
                $decl
            )
        }
        ()
    }
    @Bench 
    func BenchmarkOtherToTokensInQuote_ClassDecl_body_decls_008():Unit {
        for (decl in componentInput4) {
            let ret = quote(
                $decl
            )
        }
        ()
    }
    @Bench 
    func BenchmarkOtherToTokensInQuote_ClassDecl_body_decls_009():Unit {
        for (decl in componentInput5) {
            let ret = quote(
                $decl
            )
        }
        ()
    }
    @Bench 
    func BenchmarkOtherToTokensInQuote_ClassDecl_body_decls_010():Unit {
        for (decl in componentInput6) {
            let ret = quote(
                $decl
            )
        }
        ()
    }


    @Bench
    func BenchmarkOtherToTokensInQuote_ClassDecl_superTypes_001():Unit {
        if (gqlSerializeInput2.superTypes.size != 0) {
            let superTypes = quote($(gqlSerializeInput2.superTypes))
        }
        ()
    }


    @Bench
    func BenchmarkOtherToTokensInQuote_EnumDecl_constructors_001(): Unit {
        var body = Tokens()
        for (ctor in gqlSerializeInput3.constructors) {
            body += quote(| $ctor
            )
        }
    }
    @Bench
    func BenchmarkOtherToTokensInQuote_EnumDecl_constructors_002(): Unit {
        var body = Tokens()
        for (ctor in gqlSerializeInput4.constructors) {
            body += quote(| $ctor
            )
        }
    }


    @Bench
    func BenchmarkOtherToTokensInQuote_EnumDecl_decls_001(): Unit {
        var body = Tokens()
        for (decl in gqlSerializeInput4.decls) {
            body += quote(
                $decl
            )
        }
    }


    @Bench
    func BenchmarkOtherToTokensInQuote_FuncPArams_001(): Unit {
        var innerParam = Tokens()
        for (item in builderInput1) {
            innerParam += quote($item)
        }
        ()
    }
    @Bench
    func BenchmarkOtherToTokensInQuote_FuncPArams_002(): Unit {
        var innerParam = Tokens()
        for (item in builderInput2) {
            innerParam += quote($item)
        }
        ()
    }
    @Bench
    func BenchmarkOtherToTokensInQuote_FuncPArams_003(): Unit {
        var innerParam = Tokens()
        for (item in builderInput3) {
            innerParam += quote($item)
        }
        ()
    }

}