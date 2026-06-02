/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output
// RUN-EXEC-PIPE-1: %run_stdx %output %run_args 2>&1 | compare %f
// ASSERT: scan gA==
// ASSERT: scan Invalid utf8 byte sequence.

import std.time.*
import stdx.encoding.base64.*

var a = 0

main(): Int64 {
    println(toBase64String([0b10000000]))
    println(String.fromUtf8(fromBase64String(toBase64String([0b10000000])).getOrThrow()))
    return 0
}
