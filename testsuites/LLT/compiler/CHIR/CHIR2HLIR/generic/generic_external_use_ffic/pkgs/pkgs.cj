// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgs

foreign func native_entry(c: Int32): Int32

func ark_entry(a: Int32, b: Int32): Int32 {
    unsafe { return native_entry(a + b) }
}

public class B<T> {
    public func bar() {
        let a: Int32 = 1
        let b: Int32 = a
        unsafe { return native_entry(a + b) }
    }
}

public class A<T> {
    public func goo() {
        unsafe { return native_entry(10 + 8) }
    }
    public func noo() {
        return ark_entry(40, 2)
    }
}

public class C<T> {
    public var a: B<T> = B<T>()
}
