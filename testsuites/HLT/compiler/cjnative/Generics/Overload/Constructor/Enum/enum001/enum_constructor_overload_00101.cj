/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output

enum A {
    a
    | a(Int64)
    | a(Int64, Int64)
}

main(): Int64 {
    var i = A.a
    var j = A.a(1)
    var k = A.a(1, 1)
    return 0
}
