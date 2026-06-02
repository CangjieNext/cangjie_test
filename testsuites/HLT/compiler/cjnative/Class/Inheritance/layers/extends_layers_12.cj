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

open class Base1 {
    public var test1: Int32 = 1
}

open class Base2 <: Base1 {
    public var test2: Int32
    public init() {
        test2 = test1 + 1
    }
}

open class Base3 <: Base2 {
    public var test3: Int32
    public init() {
        test3 = test2 + 1
    }
}

open class Base4 <: Base3 {
    public var test4: Int32
    public init() {
        test4 = test3 + 1
    }
}

class Data <: Base4 {
    public var one: Int32
    public init() {
        one = test1 + test2 + test3 + test4
    }
}

main(): Int64 {
    var obj = Data()
    var res: Int32 = obj.one
    if (res != 10) {
        return 1
    }
    return 0
}
