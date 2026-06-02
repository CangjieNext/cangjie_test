/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

class student {
    public var name = ""
    public init(sname: String) {
        this.name = sname
    }

    public func combine(a: String, b: String): String {
        return (a + b)
    }
}

interface ToString {
    func toString(): String
}

extend student <: ToString {
    public func toString(): String {
        return this.name
    }
}

main(): Int64 {
    var zhy: student = student("charl")
    print("${zhy}")
    return 0
}
// ASSERT: scan sema_invalid_string_implementation
