// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class Base3 {
    public var test: Int32 = 1
    public open func get(): Int32 {
        return test
    }
}

open class Base2 <: Base3 {
    public open override func get(): Int32 {
        return super.get() + 1
    }
}

class Data <: Base2 {
    public override func get(): Int32 {
        return super.get() + 1
    }
}

main(): Int64 {
    var obj = Data()
    var res: Int32 = obj.get()
    if (res == 3) {
        return 0
    }
    return 1
}
