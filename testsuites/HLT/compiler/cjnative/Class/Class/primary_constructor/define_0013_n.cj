/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

class Data {
    public let p0: Int32
    public var p1: Int64 = 9
    public Data(x: Int32, var p0: Int64, let p1: Float64) {
        this.p0 = 3
    }
}

func run(): Int32 {
    let a: Int32 = 5
    var data: Data = Data(a, a)
    return data.p0 - 5
}

main(): Int64 {
    return Int64(run())
}
// ASSERT: scan sema_class_uninitialized_field
// ASSERT: scan sema_redefinition
// ASSERT: scan sema_cannot_assign_to_immutable
// ASSERT: scan sema_wrong_number_of_arguments
