/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: MacroExpandDecl_03.cj
// (CJNATIVE and not OHOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.ast.Tokens
import stdx.syntax.*

@Test
func test_MacroExpandDecl_03() {
    let res = parseFile("./MacroExpandDecl_03.cj")
    var diags = res.diags
    @Assert(diags.size, 0)

    let sourcefile: SourceFile = res.node.getOrThrow()
    @Expect(sourcefile.toString().contains(##"@p1.M1[tok1](@Deprecated["a"] class C1 {
    public C1(var a: Int64) {}
})
@M1[a: tok1, b: tok2]
@Deprecated["a"]
class C1<T, U> <: I1 & C2<T> where T <: I1 & I2, U <: I3 {
    public C1(var a: T, public let b: U) {}
}
@M_A_B(class C1 {})
@M1
@Deprecated["a"]
class C1 <: C2 {
    init() {
        super()
    }
    func foo() {
        return 100
    }
}"##))

    var decl_1: MacroExpandDecl = (sourcefile.topLevelDecls[0] as MacroExpandDecl).getOrThrow()
    @Expect(decl_1.toString(), ##"@p1.M1[tok1](@Deprecated["a"] class C1 {
    public C1(var a: Int64) {}
})"##)
    @Assert(decl_1.calleeMacro.toString(), "p1.M1")
    @Assert(decl_1.macroAttrs.toString(), "tok1")
    match (decl_1.macroInputs) {
        case WithParens(Tokens) => @Expect(Tokens.toString(), ##"@Deprecated["a"] class C1 {
    public C1(var a: Int64) { }
}"##)
        case _ => @Assert(false)
    }

    var decl_2: MacroExpandDecl = (sourcefile.topLevelDecls[1] as MacroExpandDecl).getOrThrow()
    @Expect(decl_2.toString(), ##"@M1[a: tok1, b: tok2]
@Deprecated["a"]
class C1<T, U> <: I1 & C2<T> where T <: I1 & I2, U <: I3 {
    public C1(var a: T, public let b: U) {}
}"##)
    @Assert(decl_2.calleeMacro.toString(), "M1")
    @Assert(decl_2.macroAttrs.toString(), "a: tok1, b: tok2")
    match (decl_2.macroInputs) {
        case WithoutParens(Decl) =>
            @Expect(Decl.toString(), ##"@Deprecated["a"]
class C1<T, U> <: I1 & C2<T> where T <: I1 & I2, U <: I3 {
    public C1(var a: T, public let b: U) {}
}"##)
            @Expect(Decl.annotations.toString(), ##"[@Deprecated["a"]]"##)
        case _ => @Assert(false)
    }

    var decl_3: MacroExpandDecl = (sourcefile.topLevelDecls[2] as MacroExpandDecl).getOrThrow()
    @Expect(decl_3.toString(), ##"@M_A_B(class C1 {})"##)
    @Assert(decl_3.calleeMacro.toString(), "M_A_B")
    @Assert(decl_3.macroAttrs.toString(), "")
    match (decl_3.macroInputs) {
        case WithParens(Tokens) => @Expect(Tokens.toString(), ##"class C1 { }"##)
        case _ => @Assert(false)
    }

    var decl_4: MacroExpandDecl = (sourcefile.topLevelDecls[3] as MacroExpandDecl).getOrThrow()
    @Expect(decl_4.toString(), ##"@M1
@Deprecated["a"]
class C1 <: C2 {
    init() {
        super()
    }
    func foo() {
        return 100
    }
}"##)
    @Assert(decl_4.calleeMacro.toString(), "M1")
    @Assert(decl_4.macroAttrs.toString(), "")
    match (decl_4.macroInputs) {
        case WithoutParens(Decl) =>
            @Assert(Decl is ClassDecl)
            @Assert(Decl.toString(), ##"@Deprecated["a"]
class C1 <: C2 {
    init() {
        super()
    }
    func foo() {
        return 100
    }
}"##)
            @Expect(Decl.annotations.toString(), ##"[@Deprecated["a"]]"##)
        case _ => @Assert(false)
    }
}
