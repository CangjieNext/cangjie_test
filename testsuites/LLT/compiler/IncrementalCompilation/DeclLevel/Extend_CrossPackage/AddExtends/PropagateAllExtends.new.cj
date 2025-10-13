package inc

public struct A {}
public interface I1 {}

extend A {
    public func jar(): Int64 {
        3
    }
}
extend A {
    public func fimpl() {
        3
    }
    public prop f: Int64 {
        get() {
            fimpl()
        }
    }
}

extend A {}
extend A <: I1 {
    public func joom() {
        1.1
    }
}
main() {
    let a = A()
    a.jar() - a.f
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
