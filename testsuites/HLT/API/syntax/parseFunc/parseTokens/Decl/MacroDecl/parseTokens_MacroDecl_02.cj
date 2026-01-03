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
func test_MacroDecl_02() {
    let _quote = quote(@Deprecated["a"]
public macro M1(input: Tokens, tok: Tokens) {
    input + tok
})
    let res = parseTokens(_quote)
    let sourceNode: SyntaxTreeNode = res.node.getOrThrow()

    var _decl: MacroDecl = (sourceNode as MacroDecl).getOrThrow()
    @Assert(_decl.toString(), ##"@Deprecated["a"]
public macro M1(input: Tokens, tok: Tokens) {
    input + tok
}"##)
    @Assert(_decl.body.toString(), ##"{
    input + tok
}"##)
    @Assert(_decl.name, "M1")
    @Assert(_decl.annotations.toString(), ##"[@Deprecated["a"]]"##)
    @Assert(_decl.modifiers.toString(), ##"[public]"##)
    @Assert(_decl.params.params.toString(), "[input: Tokens, tok: Tokens]")
    @Assert(_decl.retTyAnnotation.isNone())
}
}