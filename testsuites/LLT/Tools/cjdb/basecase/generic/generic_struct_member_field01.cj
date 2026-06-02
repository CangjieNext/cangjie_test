// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

struct A<T> {
    public var value: T
    init(a: T) {
        value = a
    }
}
let str1: String = "abc"
let tuple1: (Int64, String) = (1, "abc")
let range1: Range<Int64> = 0..10 : 1

main() {
    var aa: A<UInt16> = A<UInt16>(1)
    var a2 = A<String>(str1)
    var a3 = A<(Int64, String)>(tuple1)
    var a4 = A<Range<Int64>>(range1)
    0
}
