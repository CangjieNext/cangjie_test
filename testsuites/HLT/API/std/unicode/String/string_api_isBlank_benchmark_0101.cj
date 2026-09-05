/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args --bench

import std.unittest.*
import std.unicode.*

@Test
class StringIsBlankBenchmark {
    private static const DATA_SIZE = 256 * 1024
    private static let EMPTY_STRINGS = Array<String>(DATA_SIZE) { _ => "" }
    private static let ASCII_STRINGS = Array<String>(DATA_SIZE) { _ => "    \t\n" }

    @TestCase
    @Bench
    func checkEmptyStrings(): Unit {
        var count = 0
        for (value in EMPTY_STRINGS) {
            if (value.isBlank()) {
                count++
            }
        }
        if (count != DATA_SIZE) {
            throw Exception("unexpected result")
        }
    }

    @TestCase
    @Bench
    func checkAsciiWhitespaceStrings(): Unit {
        var count = 0
        for (value in ASCII_STRINGS) {
            if (value.isBlank()) {
                count++
            }
        }
        if (count != DATA_SIZE) {
            throw Exception("unexpected result")
        }
    }
}