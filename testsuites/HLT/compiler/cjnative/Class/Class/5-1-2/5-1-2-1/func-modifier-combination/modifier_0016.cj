/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt  %f -o %output 2>&1 | compare %f

open class BaseA {
    public open func get(): Int32 {
        return 1
    }
}

class BaseB <: BaseA {
    public override func get(): Int32
}

class Data <: BaseB {
    public func get(): Int32 {
        return 2
    }
}

func run(): Int64 {
    var value: Data = Data()
    if (value.get() != 2) {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_missing_func_body
// ASSERT: scan sema_non_inheritable_super_class
