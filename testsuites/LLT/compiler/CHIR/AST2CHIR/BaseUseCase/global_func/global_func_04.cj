// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC-1: %run %run_opt %output

main() {
    var a = 1
    var b: Int32 = 2
    a = a + Int64(b) * 1 / 2 - 1 // a = 0
    a = a % 2 // a = 0
    a = 1 ** UInt64(a) // a = 0
    a = ((a & 1) | 1) ^ 0 // a = 1
    a = (a << 1) >> 1
    return a
}
