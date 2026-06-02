/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    Coo()
    return 0
}

open class Boo {}

class Coo <: Boo {
    public var a0: Int32 = 1
    public let a1: Int32 = 1
    public var a2 = {=> a0}
    public var a3 = a0
    public var a4 = {=> a0}()

    public static var b0: Int64 = 1
    public var b1 = {=> b0}
    public var b2 = b0
    public var b3 = {=> b0}()
}

class Doo <: Boo {
    public let a0: Int32 = 1
    public let a1: Int32 = 1
    public let a2 = {=> a0}()
}
// ASSERT: scan sema_illegal_usage_of_member
