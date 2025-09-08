// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg2

import pkg1.*

public var aa = "pkg2"

class A<T> where T <: Less<T> {
    func f(a: T, b: T) {
        return a < b
    }
}

public func test<T>() {
    let v = A<B<T>>()
    v.f(B<T>(), B<T>())
}
