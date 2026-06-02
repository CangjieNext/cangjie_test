// (not Windows)EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// (not Windows)RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*

main(): Unit {
    var content = """
interface fatherInterface<T> where T <: Int32{
  static func foo1(): Int8
  static func foo3(): Int8
  static func foo2(): Int8{foo1()}
}
"""
    let seed_tokens: Tokens = cangjieLex(content)
    let program = parseProgram(seed_tokens)
    println(program.toTokens().toString())
}

/* SCAN-IN
interface fatherInterface < T > where T <: Int32 {
    static func foo1(): Int8
    static func foo3(): Int8
    static func foo2(): Int8 {
        foo1()
    }
}

*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
