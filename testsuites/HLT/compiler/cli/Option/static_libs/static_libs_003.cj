/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not MAC) EXEC: %compiler %import-cangjie-stdx %cmp_opt %dy_std %f -o %output
// (not MAC and not Windows) EXEC: %ldd %output | compare %f
// ASSERT: scan libcangjie-std-core.so
// ASSERT: scan libcangjie-std-math.so

import std.math.*
import stdx.encoding.base64.*

main() {
    var a = lcm(-3, 5)
    var str = toBase64String([1, 2, 3])
    return a - 15
}
