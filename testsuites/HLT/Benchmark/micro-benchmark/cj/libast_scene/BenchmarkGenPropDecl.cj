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
class TestGenPropDecl {
    let stateInput1: VarDecl
    let stateInput2: VarDecl
    let stateInput3: VarDecl
    let publishInput1: VarDecl
    let storagePropAttrInput1: VarDecl

    TestGenPropDecl() {
        this.stateInput1 = (parseDecl(cangjieLex(stateStr1)) as VarDecl).getOrThrow()
        this.stateInput2 = (parseDecl(cangjieLex(stateStr2)) as VarDecl).getOrThrow()
        this.stateInput3 = (parseDecl(cangjieLex(stateStr3)) as VarDecl).getOrThrow()
        this.publishInput1 = (parseDecl(cangjieLex(publishStr1)) as VarDecl).getOrThrow()
        this.storagePropAttrInput1 = (parseDecl(cangjieLex(storagePropAttrStr1)) as VarDecl).getOrThrow()
    }
    func mangle(name: String): String {
        "stateVarDecl_" + name + "_"
    }

    func generateAssociatedToken(identTokStr: String): Token {
        Token(TokenKind.IDENTIFIER, mangle(identTokStr))
    }

    func genPropDecl(varDecl: VarDecl): Tokens {
        let varDeclModifiers = varDecl.modifiers
        let varDeclKeyWord = varDecl.keyword
        var identTok: Token = varDecl.identifier
        var identTokStr: String = identTok.value
        var identTokenAssociated: Token = generateAssociatedToken(identTokStr)
        var valType = varDecl.getTypeByInitializer()

        var setBody = Tokens()

        setBody = setBody + quote(
            this.$identTokenAssociated.set(v)
        )

        var modifier = quote(private)

        var setFunc = quote(
                set(v) {
                    $setBody
                }
            )

        if (varDeclKeyWord.value == "var") {
            quote(
                $modifier mut prop $identTok: $valType
                {
                    get() {
                        return this.$identTokenAssociated.get()
                    }
                    $setFunc
                }
            )
        } else {
            quote(
                $modifier prop $identTok: $valType
                {
                    get() {
                        return this.$identTokenAssociated.get()
                    }
                    $setFunc
                }
            )
        }
    }

    @Bench
    func BenchmarkGenPropDecl_001():Unit {
        let propDecl = genPropDecl(stateInput1)
    }
    @Bench
    func BenchmarkGenPropDecl_002():Unit {
        let propDecl = genPropDecl(stateInput2)
    }
    @Bench
    func BenchmarkGenPropDecl_003():Unit {
        let propDecl = genPropDecl(stateInput3)
    }
    @Bench
    func BenchmarkGenPropDecl_004():Unit {
        let propDecl = genPropDecl(publishInput1)
    }
    @Bench
    func BenchmarkGenPropDecl_005():Unit {
        let propDecl = genPropDecl(storagePropAttrInput1)
    }
}