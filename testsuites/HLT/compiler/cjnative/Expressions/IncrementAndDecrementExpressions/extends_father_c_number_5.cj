/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class Parent {
    protected var field: Int32 = 1
}

class Child <: Parent {
    public func main_(): Int64 {
        var child: Child = Child()
        field--
        field++
        if (child.field != 1) {
            return 1
        }
        return 0
    }
}

main(): Int64 {
    var child = Child()
    return child.main_()
}
