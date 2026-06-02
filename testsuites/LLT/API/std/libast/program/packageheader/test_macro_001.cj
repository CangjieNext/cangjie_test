// DEPENDENCE: ./test_macro_define.cj
// EXEC: %compiler %cmp_opt_chir2hlir  %coverage_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*
internal import std.fs.*
internal import std.io.*

main() {
    let path: String = "./test_macro_define.cj"
    let file: File = File(path, Read)
    let reader: StringReader<File> = StringReader(file)
    let code: String = reader.readToEnd()

    let tokens: Tokens = cangjieLex(code)
    let fileNode = parseProgram(tokens)
    var packageSpec = fileNode.packageHeader
    let imports = fileNode.importLists
    var modPos = imports[0].content.prefixPaths[0].pos
    if (modPos.line != 6 || modPos.column != 17) {
        return 1
    }
    var pkgName = imports[0].content.identifier.pos
    if (pkgName.line != 6 || pkgName.column != 25) {
        return 3
    }
    var mulPos = imports[1].content.importAlias[1].pos
    if (mulPos.line != 7 || mulPos.column != 25) {
        return 5
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
