/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class A <: Exception {}

class B <: A {}

class C <: A {}

class D <: Exception {}

class X {
    public func test(x: Int64):Int64 {
        try {
            if (x == 1) {
                throw B()
            }
            if (x == 2) {
                throw C()
            }
            if (x == 3) {
                throw D()
            }
        } catch (e: B | C | D) {
            throw e
        } finally {
            return 4
        }
        return 3
    }
}

main() {
    return try {
        X().test(1) - 4
    } catch (e: Exception) {
        match (e) {
            case _: A => 0
            case _ => -1
        }
    }
}
