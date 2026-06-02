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
enum MyEnum {
    Aa(Int32)
}

enum AnotherEnum {
    Aa(Int32)
}

main(): Int64 {
    var a = MyEnum.Aa(1)
    var b = MyEnum.Aa(2)
    let myArray0: Array<MyEnum> = [a, b, MyEnum.Aa(3)]
    return 0
}
