package p1
// unchanged decls
public const a = 1
var b = 2

func cnt() {
    b++
    b
}
public var c = cnt()

// changed decls
public func too(): Int64 {
    let a = Array<Int64>(1000) {i=>cnt()}
    var l = cnt()
    for (k in a) {
        l += k
    }
    cnt()
}
public const co = 32
public let c2 = cnt() // src-import
public var k = too() // non src-import

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
