// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class D {}
class C<T> {}
func test(a: C<D>) {}

main(): Int64 {
    var a = C<D>()
    test(a) //expr test(a)
    return 0
}
