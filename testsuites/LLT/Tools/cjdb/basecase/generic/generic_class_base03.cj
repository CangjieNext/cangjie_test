// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

public class Foo<T> {
    public func foo(): Int64 {
        return 1
    }
}

class C1 {}

main() {
    let b1 = Foo<C1>().foo() //expr Foo<C1>().foo()
    let b2 = Foo<Int64>().foo()
    0
}
