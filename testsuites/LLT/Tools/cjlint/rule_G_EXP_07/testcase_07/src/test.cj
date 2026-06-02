// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

let MAX = "string max"
let MIN = "str min"
class A {
    static let MAX = "class string max"
    static func c() {
        return "class string max"
    }
}
main(): Int64 {
    var a = "string max"
    if (MAX == a ) {
        return 0
    } else if (A.MAX < a){
        return -1
    } else if (a < A.MAX){
        return -1
    } else if ( A.c() < a) {
        return -1
    }
    return 0
}