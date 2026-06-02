// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

open class AAA {
    var a = 999
}

class BBB <: AAA {
    var b = 888
}

func foo() {
    return 1
}

let f1 = {a: AAA => BBB()}

main() {
    let f2 = {a: AAA => BBB()}
    var y = foo
    0
}
