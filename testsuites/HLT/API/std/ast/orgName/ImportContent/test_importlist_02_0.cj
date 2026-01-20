/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %use_ast %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

var input: Tokens = quote(import std.ast.a.*)

@Test
class test_01{
    @TestCase[
    importList in [
        parseProgram(input).importLists[0],
        ImportList(input)
    ]
]
func test_importList(importList: ImportList) {
    @Assert(importList.modifier.value, "")
    @Assert(importList.keywordI.value, "import")
    @Assert(importList.isImportMulti(), false)
    @Assert(importList.content.toTokens().toString(), "std.ast.a.*")
    match(importList.content.importKind) {
        case ImportKind.All => ()
        case _ => @Assert(false)
    }
    @Expect(importList.content.prefixPaths.toString(), "std ast a")
    @Assert(importList.content.prefixDots.toString(), "...")
    @Assert(importList.content.identifier.value, "*") // 并未提供单独的字段�理*，当前只能存放在identifier�
    @Assert(importList.content.importAlias.toString(), "")
    @Assert(importList.content.lBrace.value, "")
    @Assert(importList.content.rBrace.value, "")
    @Assert(importList.content.items.size, 0)
    @Assert(importList.content.commas.toString(), "")
    @Assert(importList.content.isImportAlias(), false)
    @Assert(importList.content.isImportAll(), true)
    @Assert(importList.content.isImportMulti(), false)
    @Assert(importList.content.isImportSingle(), false)
    @Assert(importList.content.orgName.value, "")
    @Assert(importList.content.orgSeparator.value, "")
}
}