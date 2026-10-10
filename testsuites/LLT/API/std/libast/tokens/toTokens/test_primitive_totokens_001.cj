/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args | compare %f

import std.ast.*

main(): Int64 {
    var tok = Int64(3).toTokens()
    tok.dump()

    tok = Int32(3).toTokens()
    tok.dump()

    tok = Int16(3).toTokens()
    tok.dump()

    tok = Int8(3).toTokens()
    tok.dump()

    tok = Int64(-3).toTokens()
    tok.dump()

    tok = Int32(-3).toTokens()
    tok.dump()

    tok = Int16(-3).toTokens()
    tok.dump()

    tok = Int8(-3).toTokens()
    tok.dump()

    tok = UInt64(3).toTokens()
    tok.dump()

    tok = UInt32(3).toTokens()
    tok.dump()

    tok = UInt16(3).toTokens()
    tok.dump()

    tok = UInt8(3).toTokens()
    tok.dump()

    tok = Float64(3.14).toTokens()
    tok.dump()

    tok = Float32(3.14).toTokens()
    tok.dump()

    tok = Float16(3.14).toTokens()
    tok.dump()

    tok = Float64(-3.14).toTokens()
    tok.dump()

    tok = Float32(-3.14).toTokens()
    tok.dump()

    tok = Float16(-3.14).toTokens()
    tok.dump()

    tok = (r'a').toTokens()
    tok.dump()

    return 0
}

// ASSERT: scan description: integer_literal, token_id: 139, token_literal_value: 3
// ASSERT: scan description: integer_literal, token_id: 139, token_literal_value: 3
// ASSERT: scan description: integer_literal, token_id: 139, token_literal_value: 3
// ASSERT: scan description: integer_literal, token_id: 139, token_literal_value: 3
// ASSERT: scan description: sub, token_id: 13, token_literal_value: -
// ASSERT: scan description: integer_literal, token_id: 139, token_literal_value: 3
// ASSERT: scan description: sub, token_id: 13, token_literal_value: -
// ASSERT: scan description: integer_literal, token_id: 139, token_literal_value: 3
// ASSERT: scan description: sub, token_id: 13, token_literal_value: -
// ASSERT: scan description: integer_literal, token_id: 139, token_literal_value: 3
// ASSERT: scan description: sub, token_id: 13, token_literal_value: -
// ASSERT: scan description: integer_literal, token_id: 139, token_literal_value: 3
// ASSERT: scan description: integer_literal, token_id: 139, token_literal_value: 3
// ASSERT: scan description: integer_literal, token_id: 139, token_literal_value: 3
// ASSERT: scan description: integer_literal, token_id: 139, token_literal_value: 3
// ASSERT: scan description: integer_literal, token_id: 139, token_literal_value: 3
// ASSERT: scan description: float_literal, token_id: 141, token_literal_value: 3.14
// ASSERT: scan description: float_literal, token_id: 141, token_literal_value: 3.140000
// ASSERT: scan description: float_literal, token_id: 141, token_literal_value: 3.140625
// ASSERT: scan description: sub, token_id: 13, token_literal_value: -
// ASSERT: scan description: float_literal, token_id: 141, token_literal_value: 3.14
// ASSERT: scan description: sub, token_id: 13, token_literal_value: -
// ASSERT: scan description: float_literal, token_id: 141, token_literal_value: 3.140000
// ASSERT: scan description: sub, token_id: 13, token_literal_value: -
// ASSERT: scan description: float_literal, token_id: 141, token_literal_value: 3.140625
// ASSERT: scan description: char_literal, token_id: 146, token_literal_value: a
