// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main(): Int64 {
    if (case01() != 0) {
        return 1
    }
    return 0
}

func case01() {
    var a = "abc"
    var b = 1
    if ("${foo("${a}")}" != "abc") {
        return 1
    }
    if ("${goo()}" != "abc") {
        return 1
    }
    if ("${hoo()}" != "abc") {
        return 1
    }
    return 0
}

func case02() {
    var a = "abc"
    var b = 1
    var c = match ("${a}") {
        case "abd" => """
no"""
        case "abc" => "${"yes"}"
        case _ => #"no"#
    }
    if (c != "yes") {
        return 1
    }
    return 0
}

func foo(x: String) {
    return x
}

var a = "abc"

func goo(x!: String = "${a}") {
    return x
}

func hoo() {
    return "${a}"
}

class Aoo {
    public var a: String = ""
    public init(x: String) {
        a = x
    }
}
