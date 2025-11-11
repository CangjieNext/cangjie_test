// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cjmp

common public interface I1 {
    common open func f1(): Unit
}

common public interface I2 {
    common open func f2(): Unit
}

common public interface I3 {
    common open func f3(): Unit
}

common public class Foo {}

common extend Foo <: I1 & I2 & I3 {
    common public func f1(): Unit {}
    common public func f2(): Unit {}
    common public func f3(): Unit {}
}
