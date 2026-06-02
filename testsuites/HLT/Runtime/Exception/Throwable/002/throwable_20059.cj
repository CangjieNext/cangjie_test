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

class C {
    public init(x: Int64) {
        throw B()
    }
}

func i(): Int64 {
    throw A()
}

func test() {
    var res = -1
    try {
        C(i())
        ()
    } catch (a: A) {
        res = 0
    } catch (e: Exception) {
        e.printStackTrace()
    }
    return res
}

main() {
    return test()
}
