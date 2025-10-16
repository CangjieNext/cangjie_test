package inc

public class A {}

extend A {
    public func foo(): Int32 {
        Int32(9)
    }
    public func nut() {
        foo()
    }
}

main() {

}

extend A {
    public func foo(x: Int64): Int64 {
        Int64(9)
    }
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
