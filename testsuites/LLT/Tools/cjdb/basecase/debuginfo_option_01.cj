// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class A {
    var member1 = 999
    var member2 = "HHH"
}

main() {
    var s1 = Option<Option<Int64>>.Some(Some(999))
    var s2 = Option<Option<Array<Int64>>>.Some(Some([555, 666, 777, 888, 999]))
    var s3 = Option<Option<A>>.Some(Some(A()))
    var s4 = Option<A>.Some(A())
    var s5 = Option<Option<Int64>>.Some(None)
    var s6 = Option<Option<Array<Int64>>>.Some(None)
    var s7 = Option<Option<A>>.Some(None)
    0
}
