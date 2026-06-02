// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import define.*

struct A<T> {
    @M[func test(a: T, b!: Int64 = 1) { 0 }]
    func test(a: T, b!: Int64 = 1) {
        0
    }

    @M[var i: Int64 = 1]
    var i: Int64 = 1
}

main() {
    return 0
}
