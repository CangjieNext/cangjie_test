/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: file仓颉.cj
// (CJNATIVE and not OHOS and not iOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS and not iOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.syntax.*

@Test
func test_file_003() {
    let res = parseFile("./file仓颉.cj")
    var diags = res.diags
    @Assert(diags.size, 0)

    let sourcefile: SourceFile = res.node.getOrThrow()
    let str = ##"macro package define"##
    @Assert(sourcefile.toString().contains(str))
    @Assert(sourcefile.name, "file仓颉.cj")
    println(sourcefile.path)
    @Assert(sourcefile.path.contains("file仓颉.cj"))
    @Assert(sourcefile.pkgHeader.isSome())
    let pkgHeader = sourcefile.pkgHeader.getOrThrow()
    @Assert(pkgHeader.accessModifier.isNone())
    @Assert(pkgHeader.isMacroPkg, true)
    @Assert(pkgHeader.packageNameIdentifiers, ["define"])
    @Assert(sourcefile.topLevelDecls.size, 0)
}
