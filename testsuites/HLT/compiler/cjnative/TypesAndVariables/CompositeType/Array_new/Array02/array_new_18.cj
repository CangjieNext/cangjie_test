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
    public static var a: Array<Int8> = [1]
    public static var a1: Array<Int16> = [1]
    public static var a2: Array<Int32> = [1]
    public static var a3: Array<Int64> = [1]
    public static var a4: Array<UInt8> = [1]
    public static var a5: Array<UInt16> = [1]
    public static var a6: Array<UInt32> = [1]
    public static var a7: Array<UInt64> = [1]

    public static var a8: Array<Float16> = [1.0]
    public static var a9: Array<Float32> = [1.0]
    public static var a10: Array<Float64> = [1.0]
    //static var a11 =['a']
    public static var a12: Array<Bool> = [false]
    //static var a13 =[""]

}

main(): Int64 {
    return Test.a.size + Test.a1.size + Test.a2.size + Test.a3.size + Test.a4.size + Test.a5.size + Test.a6.size + Test
        .a7
        .size + Test.a8.size + Test.a9.size + Test.a10.size /* + Test.a11.size */ + Test.a12.size /* + Test.a13.size */ - 12
}
