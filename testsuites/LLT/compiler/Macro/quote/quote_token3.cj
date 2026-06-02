// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan description: sub, token_id: 13, token_literal_value: -
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 1
// ASSERT: scan description: sub, token_id: 13, token_literal_value: -
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 32
// ASSERT: scan description: sub, token_id: 13, token_literal_value: -
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 128

internal import std.ast.*

main() {
    let a: Int32 = -1
    var tks = quote($a)
    tks.dump()

    let b = -32
    tks = quote($b)
    tks.dump()

    let c: Int8 = -128
    tks = quote($c)
    tks.dump()
}
