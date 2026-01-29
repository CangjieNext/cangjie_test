/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

import std.ast.{Visitor, ImportContent, ImportList, ImportKind}

class MyVisitor1 <: Visitor {
    public override func visit(_: ImportContent) {
        println("Visiting ImportContent")
    }

    public override func visit(_: ImportList) {
        println("Visiting ImportList")
    }
}

class MyVisitor2 <: Visitor {
    public override func visit(_: ImportContent) {
        breakTraverse()
        println("Visiting ImportContent")
    }

    public override func visit(_: ImportList) {
        breakTraverse()
        println("Visiting ImportList")
    }
}

main(): Unit {
    let importContent0 = ImportContent()
    let importContent1 = ImportContent()
    let importContent2 = ImportContent()

    let importContent = ImportContent()
    importContent.importKind = ImportKind.Multi
    importContent.items.add(importContent0)
    importContent.items.add(importContent1)
    importContent.items.add(importContent2)

    let importList = ImportList()
    importList.content = importContent
    importList.traverse(MyVisitor1())
    println()
    importList.traverse(MyVisitor2())
}

/* SCAN
Visiting ImportList
Visiting ImportContent
Visiting ImportContent
Visiting ImportContent
Visiting ImportContent

Visiting ImportList
*/