// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class A<T> {
    var a = {x: T => x}
    var b = 1
}

func test<T>() {
    var b = A<T>().b //expr A<Int64>().b
}

main() {
    test<Int64>()
    return 1
}
