// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

interface B<T> {}

class C<T> <: B<T> {
    var v1: T
    init(k: T) {
        v1 = k
    }
    func test(a: T): T {
        return a
    }
}

main(): Int64 {
    var ans1 = C<Int32>(2)
    if (ans1.test(3) == 3) {
        return 0;
    }
    return 1
}
