/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func test_class<T>() {
    var a = E1<T>.A
    var b = E1<Int32>.B(6)
    return 1
}

enum E1<T> {
    A | B(T)
}

main(): Int64 {
    test_class<Int64>()
    0
}
