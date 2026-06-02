/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A <: Resource {
    public func isClosed():Bool {
        false
    }
    public func close():Unit {
        print(res)
    }
    public var res: String = ""
    public init(x: String) {
        res = x
    }
}

main() {
    try (a: A = A("A!")) {
        a = A("B!") // a let or var?
    } finally {}
    print("success!\n")
    return 0
}
// ASSERT: scan sema_cannot_assign_to_immutable
