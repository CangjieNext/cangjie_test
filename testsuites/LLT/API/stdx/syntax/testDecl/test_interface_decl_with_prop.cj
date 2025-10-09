// DEPENDENCE: sourceFile/interface_decl_with_prop.cj
// (not Windows) EXEC: dos2unix interface_decl_with_prop.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*

@Test
func test_InterfaceDecl_01() {
    let res = parseFile("interface_decl_with_prop.cj")
    var diags = res.diags
    @Assert(diags.size, 0)

    let sourcefile : SourceFile = res.node.getOrThrow()
    sourcefile.toString() |> println
    @Expect(sourcefile.toString().contains(##"@Deprecated["aaa"]
public interface I1<T> <: S1<T> where T <: I2<T> {
    static mut prop p1: Int64
    func foo(): Int64
}"##))

    var interfaceDecl: InterfaceDecl = (sourcefile.topLevelDecls[0] as InterfaceDecl).getOrThrow()
    @Expect(interfaceDecl.toString(), ##"@Deprecated["aaa"]
public interface I1<T> <: S1<T> where T <: I2<T> {
    static mut prop p1: Int64
    func foo(): Int64
}"##)
    @Assert(interfaceDecl.body.memberDecls.size, 2)
    @Assert(interfaceDecl.body.memberDecls[0] is PropDecl)
    @Assert(interfaceDecl.body.memberDecls[0].toString(), ##"static mut prop p1: Int64"##)
    @Assert(interfaceDecl.body.memberDecls[1] is FuncDecl)
    @Assert(interfaceDecl.body.memberDecls[1].toString(), ##"func foo(): Int64"##)

    @Assert(interfaceDecl.name, "I1")
    @Assert(interfaceDecl.genericConstraints.isSome())
    @Assert(interfaceDecl.genericConstraints.getOrThrow().toString(), "where T <: I2<T>")
    @Assert(interfaceDecl.genericParams.size, 1)
    @Assert(interfaceDecl.genericParams[0].toString(), "T")
    @Assert(interfaceDecl.superTyAnnotations.size, 1)
    @Assert(interfaceDecl.superTyAnnotations[0].toString(), "S1<T>")
    @Assert(interfaceDecl.annotations.size, 1)
    @Assert(interfaceDecl.annotations[0].toString(), ##"@Deprecated["aaa"]"##)
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
