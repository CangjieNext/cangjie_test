// DEPENDENCE: sourceFile/prop_decl_with_mut.cj
// (not Windows) EXEC: dos2unix prop_decl_with_mut.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*

@Test
func test_PropDecl_01() {
    let res = parseFile("prop_decl_with_mut.cj")
    var diags = res.diags
    @Assert(diags.size, 0)

    let sourcefile : SourceFile = res.node.getOrThrow()
    @Expect(sourcefile.toString().contains(##"public interface I1 <: S1 {
    public static mut prop p1: Int64 {
        get() {0}
        set(v) {}
    }
    public static prop p2: R {
        get() { R() }
    }
}"##))

    var interfaceDecl: InterfaceDecl = (sourcefile.topLevelDecls[0] as InterfaceDecl).getOrThrow()

    @Assert(interfaceDecl.body.memberDecls.size, 2)
    let prop_1 = (interfaceDecl.body.memberDecls[0] as PropDecl).getOrThrow()
    let prop_2 = (interfaceDecl.body.memberDecls[1] as PropDecl).getOrThrow()
    @Assert(prop_1.toString(), ##"public static mut prop p1: Int64 {
        get() {0}
        set(v) {}
    }"##)
    @Assert(prop_1.name, "p1")
    @Assert(prop_1.getter.isSome())
    @Assert(prop_1.getter.getOrThrow().toString(), "get() {0}")
    @Assert(prop_1.setter.isSome())
    @Assert(prop_1.setter.getOrThrow().toString(), "set(v) {}")
    @Assert(prop_1.tyAnnotation.toString(), "Int64")
    @Assert(prop_1.tyAnnotation is AtomicType)
    @Assert(prop_1.isMut)

    @Assert(prop_2.toString(), ##"public static prop p2: R {
        get() { R() }
    }"##)
    @Assert(prop_2.name, "p2")
    @Assert(prop_2.getter.isSome())
    @Assert(prop_2.getter.getOrThrow().toString(), "get() { R() }")
    @Assert(prop_2.setter.isNone())
    @Assert(prop_2.tyAnnotation.toString(), "R")
    @Assert(prop_2.tyAnnotation is CompositeType)
    @Assert(prop_2.isMut, false)
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
