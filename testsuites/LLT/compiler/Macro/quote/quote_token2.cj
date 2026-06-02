// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan token_literal_value: ), fileID: 1, line: 9, column: 18
// ASSERT: scan token_literal_value: {, fileID: 1, line: 10, column: 32

internal import std.ast.*

main() {
    var rparen = Token(RPAREN)
    var tks = quote($(rparen + Token(LCURL)))
    tks.dump()
}
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

