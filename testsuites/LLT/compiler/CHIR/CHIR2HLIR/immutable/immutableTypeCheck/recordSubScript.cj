// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %noColor %f %diag_json 2>&1 | compare %f

main(): Int64 {
    var a1: Array<Aoo> = [Aoo(2), Aoo(3)]
    var c1: Array<Coo> = [Coo(2), Coo(3)]
    c1[0].a++
    return 0
}

struct Coo {
    public var a: Int32 = 1
    public let b: Int32 = 1
    public init(x: Int32) {
        a = x
    }
}

class Aoo {
    public var a: Int32 = 1
    public let b: Int32 = 1
    public init(x: Int32) {
        a = x
    }
}
// ASSERT: scan sema_cannot_assign_to_immutable
