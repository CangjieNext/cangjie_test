// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %output

struct RA {
    var k = 9
}

class CA {}

main() {
    var a = RA()
    a = a
    var b = 5
    b = b
    var c = CA()
    c = c
    a.k - 9
}
