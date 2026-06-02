/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

enum MyEnum {
    | ConstructorA(Int32)
    | ConstructorB(Int32)
    | ConstructorC(Int32)
}

main(): Int64 {
    var member_a:MyEnum = MyEnum.ConstructorA(1)
    var member_b:MyEnum = MyEnum.ConstructorB(2)
    var member_c:MyEnum = MyEnum.ConstructorC(3)
    let arr: Array<MyEnum> = [member_a, member_b, member_c, MyEnum.ConstructorA(3)]
    return 0
}
