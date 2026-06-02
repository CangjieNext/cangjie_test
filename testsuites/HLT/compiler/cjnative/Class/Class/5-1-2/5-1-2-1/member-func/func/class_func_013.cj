/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o  %output
// RUN-EXEC: %run %run_opt %output %run_args

abstract class BaseA {
    public func getA(): Int32
}

class Data <: BaseA {
    public func getA(): Int32 {
        return 2
    }
}

main(): Int64 {
    var data: Data = Data()
    var res: Int32 = data.getA()
    if (res == 2) {
        return 0
    }
    return 1
}
