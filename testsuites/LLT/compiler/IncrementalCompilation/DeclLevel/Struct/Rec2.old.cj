struct A {
    A(let value: B) {}
}

struct B {
    B(let value: Int64) {}
}

main() {
    let p = A(B(3))
    p.value.value - 3
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
