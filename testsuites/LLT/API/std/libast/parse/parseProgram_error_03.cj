/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %noColor 2>&1 | compare %f

internal import std.ast.*

// Deep type nesting (`S<S<...<S<String>>>>`) used to recurse unbounded
// through ParserImpl::ParseType / ParseQualifiedType / ParseRefType and
// exhaust the 128 KB Cangjie coroutine stack inside libcangjie-std-ast,
// surfacing as SIGSEGV (see UsersForum issue 3128:
// regression_fuzz_0017.cj reproducer). The fix bounds the parser depth
// at MAX_PARSER_NESTING_DEPTH = 256 and emits parse_exceeded_max_nesting_depth.
main() {
    var code = "var x: "
    let depth = 300
    for (_ in 0..depth) {
        code = code + "S<"
    }
    code = code + "String"
    for (_ in 0..depth) {
        code = code + ">"
    }
    code = code + " = m"
    parseProgram(cangjieLex(code))
    0
}

// ASSERT: scan exceeded maximum nesting depth while parsing
// ASSERT: scan An exception has occurred:
// ASSERT: scan parsing program error.
