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

main(): Int64 {
    var obj1: Base = Data()
    var res1: Int32 = obj1.para
    if (res1 != 2) {
        return 1
    }

    return 0
}

open class Base {
    public var para: Int32 = 2
}

class Data <: Base {}
