// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class A<T> {
    func foo(a: T) {
        a
    }
}

main() {
    var aa = A<UInt32>()
    let bb: UInt32 = 35
    aa.foo(bb)
    0
}
