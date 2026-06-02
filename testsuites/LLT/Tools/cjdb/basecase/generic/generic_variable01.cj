// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

open class A1 {}
open class A2 <: A1 {}
open class A3 <: A2 {}
func assert<T>(input: T) {
    return input
}
main() {
    var t = A2()
    var a1 = assert<(A2) -> A2>({a: A2 => a})
    var a2 = assert<(A2) -> A2>({a: A2 => A3()})
    0
}