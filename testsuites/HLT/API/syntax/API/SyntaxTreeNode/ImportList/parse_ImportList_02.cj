/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ImportList_02.cj
// (CJNATIVE and not OHOS and not iOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS and not iOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.syntax.*

@Test
class test_01{
    @TestCase
func test_ImportList_02() {
    let res = parseFile("./ImportList_02.cj")
    var diags = res.diags
    @Assert(diags.size, 0)

    let sourcefile: SourceFile = res.node.getOrThrow()
    @Expect(sourcefile.toString().contains(##"public import a.*
public import {
    std.time,
    std.fs as fileSystem,
    std.io.*,
}"##))
    @Assert(sourcefile.importLists.size, 2)
    var import_1: ImportList = sourcefile.importLists[0]
    var import_2: ImportList = sourcefile.importLists[1]
    @Assert(import_1.contents is ImportAll)
    match (import_1.kind) {
        case ImportKind.All => ()
        case _ => @Assert(false)
    }
    match (import_1.modifier.getOrThrow().kind) {
        case ModifierKind.Public => ()
        case _ => @Assert(false)
    }
    @Assert(import_1.toString(), ##"public import a.*"##)

    @Assert(import_2.contents is ImportMulti)
    match (import_2.kind) {
        case ImportKind.Multi => ()
        case _ => @Assert(false)
    }
    match (import_2.modifier.getOrThrow().kind) {
        case ModifierKind.Public => ()
        case _ => @Assert(false)
    }
    @Expect(import_2.toString(), ##"public import {
    std.time,
    std.fs as fileSystem,
    std.io.*,
}"##)
}
}