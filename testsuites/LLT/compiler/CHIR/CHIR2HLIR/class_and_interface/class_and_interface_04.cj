// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0

// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    let N = 100

    var i = 0
    var sum = 0
    while (i < N) {
        var j = 0
        while (j < N) {
            sum = sum + Complex(i, j).modulus2()
            j = j + 1
        }
        i = i + 1
    }
    if (sum == 65670000) {
        return 0
    }
    return 1
}

class Complex {
    public let re: Int64
    public let im: Int64

    public init(re_: Int64, im_: Int64) {
        re = re_
        im = im_
    }

    public func modulus2(): Int64 {
        return re * re + im * im
    }
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
