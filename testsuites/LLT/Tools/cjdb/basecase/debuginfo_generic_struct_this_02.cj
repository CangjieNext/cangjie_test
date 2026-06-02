// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

struct S<T> {
    var a: T
    init(para: T) {
        a = para
    }

    func foo() {
        return 0
    }
}

main() {
    var a = S<Int64>(100)
    a.foo()
    0
}
