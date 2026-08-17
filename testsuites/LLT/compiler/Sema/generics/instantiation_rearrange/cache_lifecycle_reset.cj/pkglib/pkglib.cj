// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkglib

public interface Showable {
    func show(): Unit
}

public class BoxCus<T> <: Showable where T <: ToString {
    var inner: T
    public init(inner: T) {
        this.inner = inner
    }
    public func show(): Unit {
        println("${inner}")
    }
}
