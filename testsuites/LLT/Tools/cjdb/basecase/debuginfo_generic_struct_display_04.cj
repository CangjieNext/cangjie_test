// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func test_class<T>(para: T) {
    var a = E1<T>.A
    var b = E1<Int32>.B(6)
    var e = E1<T>.B(para)
    return 0
}

enum E1<T> {
    A | B(T)
}

main(): Int64 {
    test_class<Int64>(50)
    0
}
