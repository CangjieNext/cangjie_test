/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args
import std.random.*

main() {
    var r = Random(UInt64(65))
    var r1 = Random()
    var seed1: UInt64 = 18446744073709551615
    var seed2: UInt64 = 1
    r = Random(seed1)
    r = Random(seed2)
    r1 = Random(seed1)
    r1 = Random(seed2)

    return 0
}
