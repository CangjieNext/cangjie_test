// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func foo<T>(a: T) {
    let goo = {
        x: T => x
    }
    return goo(a)
}

main() {
    var a: Int16 = 3
    foo(a)
    0
}
