/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (CJNATIVE and not OHOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.syntax.*

@Test
class test_01{
    @TestCase
func test_MacroDecl_04() {
    let _quote = quote(public macro Prop(input:Tokens):Tokens {
    let v = parseDecl(input)
    @getIdent[ident](input)
    return quote(
        \$(input)
        public prop \$(ident): \$(decl.declType) {
            get() {
                this.\$(v.identifier)
            }
        }
    )
})
    let res = parseTokens(_quote)
    let sourceNode: SyntaxTreeNode = res.node.getOrThrow()

    var _decl: MacroDecl = (sourceNode as MacroDecl).getOrThrow()
    @Expect(_decl.toString(), ##"public macro Prop(input: Tokens): Tokens {
    let v = parseDecl(input)
    @getIdent[ident](input)
    return quote(
    $(input)
    public prop $(ident): $(decl.declType) {
        get() {
            this.$(v.identifier)
        }
    }
    )
}"##)
    @Assert(_decl.name, "Prop")
    @Expect(_decl.body.toString(), ##"{
    let v = parseDecl(input)
    @getIdent[ident](input)
    return quote(
    $(input)
    public prop $(ident): $(decl.declType) {
        get() {
            this.$(v.identifier)
        }
    }
    )
}"##)
    @Assert(_decl.annotations.toString(), ##"[]"##)
    @Assert(_decl.modifiers.toString(), ##"[public]"##)
    @Assert(_decl.params.params.toString(), "[input: Tokens]")
    @Assert(_decl.retTyAnnotation.getOrThrow().toString(), "Tokens")
}
}