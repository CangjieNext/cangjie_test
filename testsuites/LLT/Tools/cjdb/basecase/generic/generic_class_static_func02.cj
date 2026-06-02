// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class A<T,K> {
    public var value1: T
    public var value2: K
    init(a:T, b:K) {
      value1 = a
      value2 = b
    }
    static func f1(a:Int64) { a }
    static func f2<T>(a:T) { a }
    static func f3<K>(a:K) { a }
}

main() {
    var aa:A<UInt16, Bool> = A<UInt16, Bool>(1,true)
    A<UInt16, Bool>.f1(1)
    A<UInt16, Bool>.f2<UInt16>(3)
    A<UInt16, Bool>.f3<Bool>(false)
    0
}