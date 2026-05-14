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

// Verifies DiagnosticEmitter's TruncateLongSourceLine behaviour introduced
// in the issue-3128 fix (PR 1625, src/Basic/DiagnosticEmitter.cpp).
//
// LINE_TRUNCATE_THRESHOLD = 200 bytes. A source line longer than this is
// abbreviated: leading and/or trailing content beyond ±80 bytes of the
// error caret is replaced with "...". Short lines (≤200 bytes) are passed
// through unchanged.
//
// This test builds an arithmetic expression line of ~212 bytes containing
// a syntax error (`+%`) at the end. The rendered diagnostic line must begin
// with the truncation marker "..." because the line exceeds the threshold
// and the caret is more than 80 bytes from the start.
main() {
    // 50 × " + 1" = 200 bytes appended to "let a = 1" (9 bytes) → 209 bytes
    // then " +%" → total ~212 bytes; triggers TruncateLongSourceLine.
    var code = "let a = 1"
    for (_ in 0..50) {
        code = code + " + 1"
    }
    code = code + " +%"
    parseProgram(cangjieLex(code))
    0
}

// ASSERT: scan expected expression after '+', found '%'
// ASSERT: scan ...1 + 1
// ASSERT: scan parsing program error.
