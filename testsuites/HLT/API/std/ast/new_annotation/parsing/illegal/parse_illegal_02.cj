// LEVEL: 2
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 

import std.ast.*

main() {
    var input: Tokens = quote(@!=a
@!Anno2["2"] 
public class C1<T> {
    var a = 0
})
    try {
        parseDecl(input)
    } catch (_) {
        return 0
    }
    return 1
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
