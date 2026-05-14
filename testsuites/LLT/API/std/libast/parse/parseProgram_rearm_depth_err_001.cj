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

// Verifies NestingScope re-arm behaviour: within a single parseProgram call,
// two independent top-level declarations each with deeply nested types trigger
// parse_exceeded_max_nesting_depth exactly once each (total: 2 occurrences).
//
// The NestingScope depth counter decrements to zero as the first deep region
// unwinds (RAII destructors), then re-arms naturally when a second deep region
// drives the counter back up to MAX+1. A simple "already reported" flag would
// silence the second region — the depth==MAX+1 check avoids that.
//
// The ASSERT scan-2 below verifies the diagnostic fires twice, not once.
main() {
    // First top-level decl: 300 levels of S<...> type nesting → triggers error
    var code = "var x: "
    for (_ in 0..300) { code = code + "S<" }
    code = code + "Int64"
    for (_ in 0..300) { code = code + ">" }
    // Second top-level decl: 300 levels of T<...> type nesting → re-triggers error
    code = code + " = 0\nvar y: "
    for (_ in 0..300) { code = code + "T<" }
    code = code + "Int64"
    for (_ in 0..300) { code = code + ">" }
    code = code + " = 0"
    parseProgram(cangjieLex(code))
    0
}

// ASSERT: scan-2 exceeded maximum nesting depth while parsing
// ASSERT: scan An exception has occurred:
// ASSERT: scan parsing program error.
