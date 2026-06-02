// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

struct A<T> {
    public var value: T
    init(a:T) {
      value = a
    }
    static func f1(a:Int64) { a }
    static func f2<T>() { 2 }
    static func f3<T>(b:T) { b }
}

main() {
    var aa:A<UInt16> = A<UInt16>(1)
    A<UInt16>.f1(1)
    A<UInt16>.f2<UInt16>()
    A<UInt16>.f3<UInt16>(3)
    0
}