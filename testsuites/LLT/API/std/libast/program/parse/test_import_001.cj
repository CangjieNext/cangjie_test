// EXEC: %compiler %cmp_opt_chir2hlir  %coverage_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

func test(input: Tokens) {
    let fileNode = parseProgram(input)
    let imports = fileNode.importLists
    var output = imports[0].toTokens()
    let flag = compareTokens(input, output)
    if (!flag) {
        return 1
    }
    return 0
}

main(): Int64 {
    var input = quote(internal import std.{collection.HashMap, collection.ArrayList})
    var a = test(input)
    if (a != 0) {
        return 3
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
