/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
open class A {
    public var a: Bool = true
}

class B <: A {
    public var i: Int64 = 1
    public func test() {
        var y: Int64 = match (i) {
            case _ where (super.a) => i
            case _ => i + 1
        }
        if (y == 1) {
            return 0
        }
        return 1
    }
}

main() {
    var b: B = B()
    return b.test()
}
