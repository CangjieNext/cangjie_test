/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

struct S1{
    var a = 1
}

class C1{
    static let v1 = Option<Int8>.Some(1)
    static let v2 = Option<Int8>.None
    static let v3 = Option<Int64>.Some(4)
    static let v4 = Option<Int64>.None
    static let v5 = Option<S1>.Some(S1())
    static let v6 = Option<S1>.None
    static let c1 = Option<Bool>.Some(true)
    static let c2 = Option<Bool>.None

    static let a1 = c1 ?? false
    static let a2 = c2 ?? false
    static let r1 = v1 ?? 1
    static let r2 = v2 ?? 2
    static let r3 = v3 ?? 3
    static let r4 = v4 ?? 4
    static var r5 = v5 ?? S1()
    static var r6 = v6 ?? S1()
}

main() {
    var a1 = C1()
    var a2 = C1.a2
    0
}
