// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V0
public class Foo {
    @Deprecated[strict: false]
    public var V1 : Int64 = 52
    public func foo() {}
    public let V2 : Int64 = 42
    @Deprecated[strict: true]
    public var V3 : Int64 = 62
}
