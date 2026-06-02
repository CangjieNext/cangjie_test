// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan expected ';' or '<NL>', found ','

internal import std.ast.*
internal import std.collection.*

main() {
    let input = quote(
class Exml {
    private static let entities = HashMap<String, Rune*Int64>(
            [("quot", ('"', 6)), ("amp", ('&', 5)), ("apos", ('\'', 6)),
             ("lt", ('<', 4)), ("gt", ('>', 4))])
}
    )
    try {
        let node = parseDecl(input)
    } catch (e: IllegalArgumentException) {
    }

    0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
