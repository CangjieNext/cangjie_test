package inc

public interface I1 {
    func foo(): Int64 {
        2
    }
}
public interface I2 {
    static func bar(): Int64 {
        -1
    }
}

public open class A {}

extend A {
    public func foo(): Int64 {
        1
    }
}

public open class B <: A {}
extend B <: I1 {}

main() {
    let b: I1 = B()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
