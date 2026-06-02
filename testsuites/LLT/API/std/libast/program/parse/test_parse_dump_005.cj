// DEPENDENCE: ./test_parse_dump_005_dep.cj %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output > %n.txt
// EXEC: %diff %n.expect %n.txt

internal import std.ast.*
internal import std.fs.*
internal import std.io.*

main() {
    let path: String = "./test_parse_dump_005_dep.cj"
    let file: File = File(path, Read)
    let reader: StringReader<File> = StringReader(file)
    let code: String = reader.readToEnd()

    let tokens: Tokens = cangjieLex(code)
    let program = parseProgram(tokens)
    program.dump()
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
