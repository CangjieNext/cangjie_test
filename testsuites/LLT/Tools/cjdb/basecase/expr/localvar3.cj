// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

struct Coo {
    public static var a: Option<String> = Option<String>.None
    public init(x: String) {
        a = Option<String>.Some(x)
    }
    public static func foo<V>(x: V): Option<String> {
        return a
    }
}

main(): Int64 {
    var i: Int32 = 3
    var a: Option<String> = Coo.foo<Int32>(i) //expr a
    return 0
}
