// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

struct S<T> {
    var a: Array<T>
    init(para: T) {
        a = [para, para]
    }

    mut func foo(para: T) {
        a = [para, para, para]
    }

    func goo() {
        var b = a
    }
}


main() {
    var s = S<Int64>(50)
    s.foo(60)
    s.goo()
    return 0
}
