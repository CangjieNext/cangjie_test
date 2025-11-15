// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package lib.pkgA

public interface I2 {
    static func myPrintln1() {
        println(11)
        0
    }
    static func myPrintln2() {
        println(22)
        0
    }
}

public interface IBase<T> where T <: I2 {
    func foo() { println(1); 0 }
}

public interface I1<T> <: IBase<T> where T <: I2 {
}

public func test<T>(ins: I1<T>) where T <: I2 {
    ins.foo()
}