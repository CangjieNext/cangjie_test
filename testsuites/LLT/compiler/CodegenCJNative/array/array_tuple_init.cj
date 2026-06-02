// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC-PIPE-0: %run %run_opt %n.%suffix

interface I {}

class A0 <: I {
    var a = 0
}

class A <: I {
    static let a = A()
}

type tag = UInt32

main() {
    var a = A.a
    var aaa: Array<(tag, I)> = [
        (0, A.a),
        (1, A.a),
        (2, A.a),
        (3, A.a),
        (4, A.a),
        (5, A0()),
        (6, A.a),
        (7, A.a)
    ]
    if (aaa[0][0] != 0 || aaa[1][0] != 1 || aaa[2][0] != 2 || aaa[3][0] != 3 || aaa[4][0] != 4 || aaa[5][0] != 5 ||
        aaa[6][0] != 6 || aaa[7][0] != 7) {
        return 1
    }
    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
