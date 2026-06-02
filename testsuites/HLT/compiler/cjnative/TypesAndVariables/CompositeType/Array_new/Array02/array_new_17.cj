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
    public static let a: Array<Int8> = [1]
    public static let a1: Array<Int16> = [1]
    public static let a2: Array<Int32> = [1]
    public static let a3: Array<Int64> = [1]
    public static let a4: Array<UInt8> = [1]
    public static let a5: Array<UInt16> = [1]
    public static let a6: Array<UInt32> = [1]
    public static let a7: Array<UInt64> = [1]
    public static let a8: Array<Float16> = [1.0]
    public static let a9: Array<Float32> = [1.0]
    public static let a10: Array<Float64> = [1.0]
    public static let a11 = [r'a']
    public static let a12: Array<Bool> = [true]
    public static let a13 = ["a"]
}

main(): Int64 {
    return Test.a.size + Test.a1.size + Test.a2.size + Test.a3.size + Test.a4.size + Test.a5.size + Test.a6.size + Test
        .a7
        .size + Test.a8.size + Test.a9.size + Test.a10.size + Test.a11.size + Test.a12.size + Test.a13.size - 14
}
