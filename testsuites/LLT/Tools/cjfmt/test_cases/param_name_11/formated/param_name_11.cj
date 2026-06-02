// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func test(a: (c: Int64, d: Int64), b: Int64): Int64 {
    return a[0] + a[1] - 2 * b
}

let a: (c: (Int64, Int64), d: Int64) -> Int64 = test

main() {
    return a((1, 1), 1)
}
