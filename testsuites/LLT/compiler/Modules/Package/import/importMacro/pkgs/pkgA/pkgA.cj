// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgs.pkgA

public class A {
    private var a: Int64
    private static let INSTANCE: A = A()

    private init() {
        a = 100
    }

    public static func getInstance(): A {
        return INSTANCE
    }
}
