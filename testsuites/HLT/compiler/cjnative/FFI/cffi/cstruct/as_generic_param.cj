/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan sema_upper_bound_must_be_class_or_interface

@C
struct CStruct {
    var a: Int32 = 10
    var b: Int32 = 20
}

func show<T>(obj: T) where T <: CStruct {
    println("${obj.a}, ${obj.b}")
}

main() {
    let data = CStruct()
    show(data)
}
