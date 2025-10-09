/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: file002.cj
// (CJNATIVE and not OHOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.syntax.*

@Test
func test_file_002() {
    let res = parseFile("./file002.cj")
    var diags = res.diags
    @Assert(diags.size, 0)

    let sourcefile: SourceFile = res.node.getOrThrow()
    let str = ##"public package longpackagename_for_just_testing_0000000001

private func foo() {}"##
    @Assert(sourcefile.toString().replace("\n",""), str.replace("\n",""))
    @Assert(sourcefile.name, "file002.cj")
    println(sourcefile.path)
    @Assert(sourcefile.path.contains("file002.cj"))
    @Assert(sourcefile.pkgHeader.isSome())
    let pkgHeader = sourcefile.pkgHeader.getOrThrow()
    @Assert(pkgHeader.accessModifier.isSome())
    match (pkgHeader.accessModifier.getOrThrow().kind) {
        case Public => ()
        case _ => @Assert(false)
    }
    @Assert(pkgHeader.isMacroPkg, false)
    @Assert(pkgHeader.packageNameIdentifiers, ["longpackagename_for_just_testing_0000000001"])
    @Assert(sourcefile.topLevelDecls.size, 1)
}
