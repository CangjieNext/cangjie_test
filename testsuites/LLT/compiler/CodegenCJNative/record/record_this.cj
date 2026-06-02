// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

struct Date {
    public let width: Int32
    public let length: Int32
    public static var height: Int32 = 2
    public init() {
        this.width = 1
        this.length = 2
        height = 3
    }
}

main(): Int64 {
    var a = Date()
    if (a.width == 1 && a.length == 2 && Date.height == 3) {
        return 0
    }
    return 1
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
