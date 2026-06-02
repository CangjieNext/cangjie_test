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

main(): Int64 {
    let b = Boo()
    var res: Int64 = match (b) {
        case x: Aoo => x.aoo() - 1
        case x: Boo => x.boo()
        case _ => 2
    }
    return res
}

open class Aoo {
    public var a: Int64 = 1
    public func aoo() {
        return a
    }
}

class Boo <: Aoo {
    public var b: Int64 = 1
    public func boo() {
        return b
    }
}
