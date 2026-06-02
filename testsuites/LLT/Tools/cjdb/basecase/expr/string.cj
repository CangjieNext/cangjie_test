// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test
var a = 3
var c: String = "ccc"
func foo(a: String, b: String) {
    return a == b
}
var d: Rune = 'd'
main(): Unit {
    foo("aaa", "bbb")
}
