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

class A1 <: Exception {}

class A2 <: Exception {}

class B {
    public var b: Int64 = 1
    public init() {
        throw A1()
    }
}

class C {
    public var c: Int64 = 1
    public init() {
        throw A2()
    }
}

func test() {
    var res = -1
    try {
        B().b = C().c
    } catch (a: A2) {
        res = 0
    } catch (e: Exception) {
        e.printStackTrace()
    }
    return res
}

main() {
    return test()
}
