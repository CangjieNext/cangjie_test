var a = 10

private func da() {
    a++
    return a
}

let f1 = da()

// newline here
main() {
    println("1:${da()}")
    println("2:${da()}")
    0
}
// ASSERT: scan-begin 1:12
// ASSERT: scan-after 2:13


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
