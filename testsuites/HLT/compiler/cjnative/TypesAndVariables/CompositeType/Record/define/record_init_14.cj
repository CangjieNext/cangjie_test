/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

struct GenRec {
    public let b: Int32 = 1
    public var c: Int64 = 2
    public init(b: Int32, c: Int64) {
        this.b = b
        this.c = c
    }
    public init(str: String) {
        this()
    }
    public init() {}
}

main(): Int64 {
    var rec = GenRec("hi")
    if (rec.c == 2) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_cannot_assign_to_immutable
