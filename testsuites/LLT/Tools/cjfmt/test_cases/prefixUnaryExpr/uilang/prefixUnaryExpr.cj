// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func foo(): Unit {
!10 // The result is -11
!20 // The result is -21
10 << 1 // The result is 20
10 << 1 << 1 // The result is 40
10 >> 1 // The result is 5
10 & 15 // The result is 10
10 ^ 15 // The result is 5
10 | 15 // The result is 15
1 ^ 8 & 15 | 24 // The result is 25

let p: Int8 = -30
let q = p << 2 // q = -120
let r = p >> 2 // r = -8
let r = p >> -2 // error
let x: UInt8 = 30
let b = x << 3 // b = 240
let b = x >> 1 // b = 15
}
