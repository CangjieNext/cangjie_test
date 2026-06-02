/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface I1 {
    static func test1(): Int64
    static func test2(): Int64 {
        test1()
    }
    static func test3(): Int64 {
        test2()
    }
    static func test4(): Int64 {
        test3()
    }
    static func test5(): Int64 {
        test4()
    }
    static func test6(): Int64 {
        test5()
    }
    static func test7(): Int64 {
        test6() + test5()
    }
    static func test8(): Int64 {
        test7() + test6() + test5()
    }
    static func test9(): Int64 {
        test8() + test7() + test6() + test5()
    }
    static func test10(): Int64 {
        test9() + test8() + test7() + test6() + test5()
    }
}

interface I2 <: I1 {
    static func test1(): Int64 {
        return 0
    }
}

main(): Int64 {
    return I2.test10()
}
