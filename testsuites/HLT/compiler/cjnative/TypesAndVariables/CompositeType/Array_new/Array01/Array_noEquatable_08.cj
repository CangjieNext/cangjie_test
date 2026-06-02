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
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
class A <: Equatable<A> {
    public var a: Int64
    public var b: Bool
    public init(a: Int64, b: Bool) {
        this.a = a
        this.b = b
    }
    public operator func ==(that: A): Bool {
        if (this.a == that.a && this.b == that.b) {
            return true
        } else {
            return false
        }
    }

    public operator func !=(that: A): Bool {
        return !(this == that)
    }
}

main() {
    var arr1: Array<A> = [A(1, true)]
    var arr2: Array<A> = [A(0, true)]

    if (arr1 != arr2) {
        return 0
    }
    return 1
}
