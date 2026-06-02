extend Int64 {
    func foo(a: Int32): Int64 { Int64(a)-1 }
}
interface I {}

main() {
    2.foo(1)
}

extend Int64 <: I {

}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
