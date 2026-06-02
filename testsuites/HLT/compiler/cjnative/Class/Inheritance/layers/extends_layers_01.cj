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

open class Base3 {
    public var test: Int32 = 1
}

open class Base2 <: Base3 {
    public var test1: Int32
    public init() {
        test1 = test + 1
    }
}

class Data <: Base2 {
    public var one: Int32
    public init() {
        one = test + test1
    }
}

main(): Int64 {
    var obj = Data()
    var res: Int32 = obj.one
    if (res != 3) {
        return 1
    }
    return 0
}
