// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and CJNATIVE) EXEC-PIPE: %compiler %cmp_opt %f -o %output --lto=full -V 2>&1 | compare %f
// (Linux and CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args
// (Linux and CJNATIVE) ASSERT: scan -l:libcangjie-std-ast.so

internal import std.ast.*

main() {
    let tks: Tokens = quote(foo + bar + 42) // 使用 quote 构造出 Tokens
    println("=== tks dump: ===")
    tks.dump() // 打印出 Tokens
    var newTks = Tokens(); // 初始化 newTks
    for (i in 0..tks.size) {
        newTks = newTks + tks[i] // Tokens 实现了操作符重载
    }
    newTks = newTks + Token(ADD) // Token 构造函数
    newTks = newTks + Token(IDENTIFIER, "baz")
    println("=== newTks dump: ===")
    newTks.dump() // 打印拼接后的 Tokens
    return 0
}
