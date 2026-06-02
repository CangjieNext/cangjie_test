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
    public open func foo3(): Int32 {
        return 3
    }
}

open class Base2 <: Base3 {
    public open override func foo3(): Int32 {
        return 2
    }
}

class Data <: Base2 {
    public override func foo3(): Int32 {
        return 1
    }
}

main(): Int64 {
    var obj = Data()
    var res: Int32 = obj.foo3()
    if (res != 1) {
        return 1
    }
    return 0
}
