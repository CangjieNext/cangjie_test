// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main() {
    // Int 
    var a = 1
    var b = 2
    a == b
    a != b
    a > b
    a >= b
    a < b
    a <= b
    // float 
    var c = 1.2
    var d = 2.2
    c == d
    c != d
    c > d
    c >= d
    c < d
    c <= d
    // Char  
    var ch = 'a'
    ch == 'a'
    ch != 'a'
    ch > 'a'
    ch < 'a'
    ch > 'a'
    ch <= 'a'
    // bool
    var t = true
    var f = false
    t == f
    t != f
    // Unit
    var un = ()
    un == ()
    un != ()
    // tuple
    (a, b) == (1, 2)
    (a, b) != (1, 2)
    return 0
}
