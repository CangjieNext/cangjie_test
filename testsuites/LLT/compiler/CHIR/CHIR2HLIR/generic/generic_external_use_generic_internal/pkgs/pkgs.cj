// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgs

public interface I {}

public class Y<T> where T <: I {}

public class X<T> where T <: I {
    public func run(): Y<T> {
        return Y<T>()
    }
}
