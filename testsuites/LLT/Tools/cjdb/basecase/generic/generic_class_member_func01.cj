// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class A<T> {
    public var value: T
    init(a:T) {
      value = a
    }
    func f1(a:Int64) { a }
    func f2<T>() { 2 }
    func f3<T>(b:T) { value }
}

main() {
    var aa:A<UInt16> = A<UInt16>(1)
    aa.f1(1)
    aa.f2<UInt16>()
    aa.f3<UInt16>(3)
    0
}