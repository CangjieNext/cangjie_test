func foo(): Int64 { 3 }
func bar(): Int64 { 6 }

class A {
    A(a: Int64, var b!: Int64 = bar()) {}
}
main(): Int64 {
    return A(1).b - 3
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
