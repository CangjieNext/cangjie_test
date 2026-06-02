// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func test<T>(a: T): T {
    func inner_test(x: T): T {
        x
    }
    var b = inner_test //expr b
    b(a) //expr b(a)
}
main() {
    test<Int64>(5)
    0
}
