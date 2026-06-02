/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    let c1: Coo = Coo()
    c1.a++
    var c2: Coo = Coo()
    c2.b++
    let c3: Coo = Coo()
    c3.b++
    let a1: Aoo = Aoo()
    a1.b++
    var a2: Aoo = Aoo()
    a2.b++
    let d: Int32 = 1
    d++
    Coo.d++
    Aoo.d++
    return 0
}

struct Coo {
    public var a: Int32 = 1
    public let b: Int32 = 1
    public static var c: Int32 = 1
    public static let d: Int32 = 1
}

class Aoo {
    public var a: Int32 = 1
    public let b: Int32 = 1
    public static var c: Int32 = 1
    public static let d: Int32 = 1
}
// ASSERT: scan sema_cannot_assign_to_immutable
