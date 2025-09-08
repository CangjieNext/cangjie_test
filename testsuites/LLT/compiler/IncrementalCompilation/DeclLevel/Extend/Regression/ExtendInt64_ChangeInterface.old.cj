interface I1 {
    func f(): Int64 { 1 }
}
extend Int64 <: I1 {}

main() {
    let a: I1 = 0
    a.f()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
