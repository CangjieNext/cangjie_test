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

class A <: Equatable<A> {
    public A(var ra!: Int64 = 0, let rb!: Int64 = 0) {}

    public operator func ==(that: A): Bool {
        if (this.ra == that.ra && this.rb == that.rb) {
            return true
        } else {
            return false
        }
    }

    public operator func !=(that: A): Bool {
        if (this.ra != that.ra || this.rb != that.rb) {
            return true
        } else {
            return false
        }
    }
}

main() {
    var arr1: Array<A> = [A(ra: 0, rb: 0)]
    var arr2: Array<A> = [A(ra: 0, rb: 0)]

    if (arr1 == arr2) {
        return 0
    }
    return 1
}
