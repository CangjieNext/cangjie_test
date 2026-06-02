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

class Test {
    public var a = Array<Int8>(1, {i => 1})
    public var a1 = Array<Int16>(1, {i => 1})
    public var a2 = Array<Int32>(1, {i => 1})
    public var a3 = Array<Int64>(1, {i => 1})
    public var a4 = Array<UInt8>(1, {i => 1})
    public var a5 = Array<UInt16>(1, {i => 1})
    public var a6 = Array<UInt32>(1, {i => 1})
    public var a7 = Array<UInt64>(1, {i => 1})

    public var a8 = Array<Float16>(1, {i => 1.0})
    public var a9 = Array<Float32>(1, {i => 1.0})
    public var a10 = Array<Float64>(1, {i => 1.0})

    public var a11 = Array<Rune>(1, {i => r'a'})
    public var a12 = Array<Bool>(1, {i => true})
    public var a13 = Array<String>(1, {i => "false"})
}

main(): Int64 {
    if (Test().a.size == 1 && Test().a[0] == 1 && Test().a1.size == 1 && Test().a1[0] == 1 && Test().a2.size == 1 &&
        Test().a2[0] == 1 && Test().a3.size == 1 && Test().a3[0] == 1 && Test().a4.size == 1 && Test().a4[0] == 1 &&
        Test().a5.size == 1 && Test().a5[0] == 1 && Test().a6.size == 1 && Test().a6[0] == 1 && Test().a7.size == 1 &&
        Test().a7[0] == 1 && Test().a8.size == 1 && Test().a8[0] == 1.0 && Test().a9.size == 1 && Test().a9[0] == 1.0 &&
        Test().a10.size == 1 && Test().a10[0] == 1.0 && Test().a11.size == 1 && Test().a11[0] == r'a' &&
        Test().a12.size == 1 && Test().a12[0] == true && Test().a13.size == 1 && Test().a13[0] == "false") {
        return 0;
    }
    return 2
}
