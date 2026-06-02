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

class A <: Exception {}

class B <: Exception {}

class X {
    public func test():Int64 {
        try {
            throw A()
            throw B()
        } catch (e: A | B) {
            throw e
        } finally {
            return 4
        }
        return 3
    }
}

main() {
    return try {
        X().test() - 4
    } catch (e: Exception) {
        match (e) {
            case _: A => 0
            case _: B => 1
            case _ => -1
        }
    }
}
