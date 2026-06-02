// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

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

/* SCAN
description: integer_literal, token_id: 139, token_literal_value: 3, fileID: 26, line: 40, column: 26
description: integer_literal, token_id: 139, token_literal_value: 3, fileID: 26, line: 50, column: 26
description: integer_literal, token_id: 139, token_literal_value: 3, fileID: 26, line: 60, column: 26
description: integer_literal, token_id: 139, token_literal_value: 3, fileID: 26, line: 70, column: 26
description: sub, token_id: 13, token_literal_value: -, fileID: 26, line: 38, column: 36
description: integer_literal, token_id: 139, token_literal_value: 3, fileID: 26, line: 38, column: 65
description: sub, token_id: 13, token_literal_value: -, fileID: 26, line: 48, column: 36
description: integer_literal, token_id: 139, token_literal_value: 3, fileID: 26, line: 48, column: 65
description: sub, token_id: 13, token_literal_value: -, fileID: 26, line: 58, column: 36
description: integer_literal, token_id: 139, token_literal_value: 3, fileID: 26, line: 58, column: 65
description: sub, token_id: 13, token_literal_value: -, fileID: 26, line: 68, column: 36
description: integer_literal, token_id: 139, token_literal_value: 3, fileID: 26, line: 68, column: 65
description: integer_literal, token_id: 139, token_literal_value: 3, fileID: 26, line: 77, column: 26
description: integer_literal, token_id: 139, token_literal_value: 3, fileID: 26, line: 84, column: 26
description: integer_literal, token_id: 139, token_literal_value: 3, fileID: 26, line: 91, column: 26
description: integer_literal, token_id: 139, token_literal_value: 3, fileID: 26, line: 98, column: 26
description: float_literal, token_id: 141, token_literal_value: 3.14, fileID: 26, line: 114, column: 26
description: float_literal, token_id: 141, token_literal_value: 3.140000, fileID: 26, line: 124, column: 26
description: float_literal, token_id: 141, token_literal_value: 3.140625, fileID: 26, line: 134, column: 26
description: sub, token_id: 13, token_literal_value: -, fileID: 26, line: 112, column: 36
description: float_literal, token_id: 141, token_literal_value: 3.14, fileID: 26, line: 112, column: 65
description: sub, token_id: 13, token_literal_value: -, fileID: 26, line: 122, column: 36
description: float_literal, token_id: 141, token_literal_value: 3.140000, fileID: 26, line: 122, column: 65
description: sub, token_id: 13, token_literal_value: -, fileID: 26, line: 132, column: 36
description: float_literal, token_id: 141, token_literal_value: 3.140625, fileID: 26, line: 132, column: 65
description: char_literal, token_id: 146, token_literal_value: a, fileID: 26, line: 148, column: 26
*/

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */