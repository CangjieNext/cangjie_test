// EXEC: %compiler %cmp_opt_chir2hlir  %coverage_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    var input = quote(internal import std.collection.{HashMap as a, collection as b})
    let fileNode = parseProgram(input)
    let imports = fileNode.importLists
    let imp = imports[0]
    let f = imp.keywordI
    if (f.value != "import") {
        return 1
    }
    if (imp.content.prefixPaths[1].value != "collection") {
        return 2
    }

    if (imp.content.items[0].identifier.value != "HashMap") {
        return 3
    }

    if (imp.content.items[0].importAlias[1].value != "a") {
        return 4
    }

    if (imports.size != 1) {
        return 6
    }

    if (imp.content.items[1].identifier.value != "collection") {
        return 7
    }

    let comp = "internal import std.collection.{ HashMap as a, collection as b }"
    var output = imports.toTokens().toString()
    if (!output.contains(comp)) {
        return 8
    }

    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
