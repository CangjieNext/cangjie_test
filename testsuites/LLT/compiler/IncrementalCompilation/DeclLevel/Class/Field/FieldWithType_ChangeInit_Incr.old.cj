func bar(): (Int64, Int64) { (1, 2) }
class A {
    let a: (Int64, Int64) = bar()
}

main() {
    let a = A()
    return a.a[1] - a.a[0]*2
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
