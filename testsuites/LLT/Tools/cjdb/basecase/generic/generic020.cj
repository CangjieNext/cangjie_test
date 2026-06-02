// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class A {
    var a = 999
}

func goo<T>(para: T) {
    var c = para
    0
}

main() {
    var a: Option<Int64> = Some(50)
    var b: Option<Int64> = None
    var c = A()
    var d: Option<A> = Some(c)
    var e: Option<A> = None
    goo(a)
    goo(b)
    goo(d)
    goo(e)
    return 0
}
