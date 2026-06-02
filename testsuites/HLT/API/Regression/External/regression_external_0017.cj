/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args
import std.ast.*

main() {
    let input = quote(
    public operator func ==(data:A):Bool{
        return true
    }
 )
    input.dump()
    let a = parseDecl(input)
    println("=====================")
    let aTks = a.toTokens()
    aTks.dump()
    parseDecl(aTks)
    0
}
