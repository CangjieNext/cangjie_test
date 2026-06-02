// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class Parent {
    public var field: Int32 = 1
}

class Child <: Parent {}

main(): Int64 {
    var child: Child = Child()
    if (child.field == 1) {
        return 0
    }
    return 1
}
