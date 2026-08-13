// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

public struct A {
    var a = 1
    let b = 2
}

public class B {
    var a = 1
    let b = 2
    var c = 3
}

type MyType = B
public var aa: MyType = B()