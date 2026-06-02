// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan """\n  abc"""
// ASSERT: scan description: double_quoted_string_literal

internal import std.ast.*

main() {
    let tk1 = quote("""
  abc"""
)
    let str = tk1.toString()
    println(str)
    let tk2 = str.toTokens()
    tk2.dump()
}
