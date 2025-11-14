/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
enum MyEnum {
    A(Int32)
}

enum AnotherEnum {
    A(Int32)
}

main(): Int64 {
    var a = MyEnum.A(1)
    var b = AnotherEnum.A(2)
    let myArray0: Array<MyEnum> = [a, b, AnotherEnum.A(3)]
    return 0
}
// ASSERT: scan sema_mismatched_types
