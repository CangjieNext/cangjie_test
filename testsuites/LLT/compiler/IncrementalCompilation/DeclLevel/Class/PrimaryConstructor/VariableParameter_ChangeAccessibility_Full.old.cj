class A {
    let c: Int64 = 3
    A(a: Int64, public  var b: Int64) {}
}

main() {
    let a = A(1, -3)
    return a.b + a.c
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
