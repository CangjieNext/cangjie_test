// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgs

func foo() {
    let a = 1
    let b = a
    return b
}

public class B<T> {
    public func bar() {
        let a = 1
        let b = a
        foo()
    }
}

public class A<T> {
    public var a: B<Int32> = B<Int32>()
    public func goo() {
        a.bar()
    }
}

public class C<T> {
    public var a: B<T> = B<T>()
}
