class A<T> {
    let a: Int64 = 3
}
func foo(): Int64 {
    let a = A<(UInt64, A<A<A<Int32>>>) -> Unit>()
    return a.a
}
main(): Int64 { foo() }

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
