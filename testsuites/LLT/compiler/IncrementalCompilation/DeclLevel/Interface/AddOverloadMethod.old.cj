interface I1 {

}

interface I2 <: I1 {}

struct S <: I2 {
    func foo(a: Int32): Int64 {0}
}

main() {
    S().foo(1)
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
