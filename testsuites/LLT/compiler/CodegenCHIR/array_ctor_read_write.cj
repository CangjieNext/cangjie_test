// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj %disableReflection -o %n.%suffix
// EXEC-23: %run %run_opt %n.%suffix

var k = 3

main() {
    let a = [1, 2]
    let b = Array<Int64>(5, {x: Int64 => k})
    b[4] = b[4] * 6
    a[1] + b[3] + b[4]
    // i.e., 2+3+18=23
}
