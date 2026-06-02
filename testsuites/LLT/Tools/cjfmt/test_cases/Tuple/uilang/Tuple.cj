// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

let tuplePIE = (3.14, "PIE")
var pointOne = (2.4, 3.5)
var pointTwo = (2, 3, 4)
var pointThree = ((2, 3), 4)
var (x, y) = multiValues(8,24)

func multiValues(a: Int32, b: Int32) { (a + b, a - b) }
main() {
var (x, y) = multiValues(8,24)
print("${x}") // output: 32
print("${y}") // output: -16
var myTuple : (Int64,Int64) = (1, 0)
return 0
}