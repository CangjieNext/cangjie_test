/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

var res: Int32 = 0

class Aoo {
    public static var a: Int32 = 1
    public var b: Int32 = 1
    public init(y: Rune, x!: Int32 = a) {}
    public init(y: Int32, x!: Int32 = b) {}
    public init(y: Int64, x!: Int32 = a) {
        var m = a
        var n = this.b
    }
}

struct Boo {
    public static var a: Int32 = 1
    public var b: Int32 = 1
    public init(y: Rune, x!: Int32 = a) {}
    public init(y: Int32, x!: Int32 = b) {}
    public init(y: Int64, x!: Int32 = a) {
        var m = a
        var n = this.b
    }
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_assignment_of_member_variable_cannot_use_this_or_super
