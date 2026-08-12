// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgA

public func invoke(f: () -> Int64): Int64 {
    f()
}

public struct Wrapper<T> {
    let input: T
    let m: Int64
    let f: (T) -> Int64

    public init(input: T, m: Int64, f: (T) -> Int64) {
        this.input = input
        this.m = m
        this.f = f
    }

    public func run(): Int64 {
        // lambda 捕获 this（访问 f、input）；invoke 强制闭包实体化
        invoke({ => f(input) })
    }
}

