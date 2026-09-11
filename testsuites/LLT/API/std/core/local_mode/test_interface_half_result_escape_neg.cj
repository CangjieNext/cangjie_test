/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 0
// DEPENDENCE: ./local_mode_utils.cj
// EXPECTED-COMPILE-FAIL (T411): passing Iterator<String> @local? result to heapOnly(Iterator<String>) must report a mode mismatch at the escape
// DISABLED-EXEC: %compiler %cmp_opt ./local_mode_utils.cj %f -o %output
// DISABLED-EXEC: %run %run_opt %output %run_args

import std.core.*

func heapOnly(iterator: Iterator<String>): Unit {
    let _ = iterator
}

func triggerHalfEscape(): Unit {
    let localText: String @local! = "a"
    let localIterator: Iterator<String> @local? = localText.lines()
    heapOnly(localIterator)
}

main(): Int64 {
    triggerHalfEscape()
    0
}
