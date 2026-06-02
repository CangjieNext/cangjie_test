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

open class Base {
    public var base_test: Int32 = 1
}

class Data <: Base {
    public var test: Int32 = 2
}

main(): Int64 {
    var obj = Data()
    var res: Int32 = obj.test
    if (res != 2) {
        return 1
    }
    return 0
}
