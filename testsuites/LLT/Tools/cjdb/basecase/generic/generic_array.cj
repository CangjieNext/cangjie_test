// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test2

class foo {
    var aaa = 123
}

struct thisstruct {
    var b = 321
    var c = foo()
}

main() {
    var a = thisstruct()
    var b: Array<thisstruct> = [a, a, a] //expr b
    var c: Array<foo> = [a.c, foo()] //expr c
    0
}
