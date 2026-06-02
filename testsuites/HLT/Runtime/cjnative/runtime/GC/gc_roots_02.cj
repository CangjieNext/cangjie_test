/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 10

// foreign func PrintInt64(val: int64): unit

class Test {
    public var t0: Int32 = 1
}

struct Rcd0 {
    public var a0 :Int32= 1
    public var a1:Test = Test()
    public var a2: Int32 = 0
}

struct Rcd1 {
    public var a0: Int32 = 1
    public var a1:Test = Test()
    public var a2:Rcd0 = Rcd0()
    public var a3:Test = Test()
    public var a4:Rcd0 = Rcd0()
}

struct RcdTest {
    public var a0: Int64 = 0
    public var a1: Test = Test()
    public var t0:Rcd1 = Rcd1()
    public var a2: Int32 = 2
    public var a3: Test = Test()
    public var t1:Rcd0 = Rcd0()
    public static var t2:Rcd1 = Rcd1()
}

var gTest = Test()
var gRcd0 = Rcd0()
var gRcd1 = Rcd1()
var gTemp: RcdTest = RcdTest()

main(): Int64 {
    print((10).toString())
    return 0
}
