// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgs

public open class A {
    public var a: Int64 = 1
}

public open class B {
    public var b: Int64 = 2
}

public open class Data {
    public static var a = A()
    public var b = B()
    public var c = 3
    public var d = 4
}
