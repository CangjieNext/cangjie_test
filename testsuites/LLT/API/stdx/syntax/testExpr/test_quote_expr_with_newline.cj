/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/quote_expr_with_newline.cj
// (not Windows) EXEC: dos2unix quote_expr_with_newline.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*

@Test
func test_QuoteExpr_With_NewLine() {
    let res = parseFile("quote_expr_with_newline.cj")
    var diags = res.diags
    @Assert(diags.size, 0)

    let sourcefile : SourceFile = res.node.getOrThrow()
    @Expect(sourcefile.toString().contains(##"public macro Prop(input:Tokens):Tokens {
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
}"##))

    var _decl: MacroDecl = (sourcefile.topLevelDecls[0] as MacroDecl).getOrThrow()
    @Expect(_decl.toString(), ##"public macro Prop(input:Tokens):Tokens {
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
    @Assert(_decl.params.toString(), "(input:Tokens)")
    @Assert(_decl.retTyAnnotation.getOrThrow().toString(), "Tokens")
}
