package pkg1

internal import pkg2.*

public open abstract class B<T> <: I {
    public func test(): Unit {
        return
    }
}

public abstract class C<T> <: B<T> {
}

public open class D <: C<D> {
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
