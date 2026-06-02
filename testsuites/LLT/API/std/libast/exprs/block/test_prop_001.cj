// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output

import std.ast.*
import std.collection.*

main() {
    let block = Block()
    var lb = block.lBrace
    block.rBrace = Token(RCURL)
    var rb = block.rBrace
    block.nodes = ArrayList()

    if (lb == Token() && rb != Token()) {
        return 0
    }
    1
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
