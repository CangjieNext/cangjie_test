/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 10

class Cycle_a_00190_A1 {
    public var a2_0:Cycle_a_00190_A2 = Cycle_a_00190_A2("");
    public var a: Int32
    public var sum: Int32
    public var strObjectName: String
    public Cycle_a_00190_A1(strObjectName: String) {
        a = 101
        sum = 0
        this.strObjectName = strObjectName
    }
    public func add(): Unit {
        sum = a + a2_0.a
    }
}

class Cycle_a_00190_A2 {
    public var a3_0:Cycle_a_00190_A3 = Cycle_a_00190_A3("");
    public var a: Int32
    public var sum: Int32
    public var strObjectName: String
    public Cycle_a_00190_A2(strObjectName: String) {
        a = 102
        sum = 0
        this.strObjectName = strObjectName
    }
    public func add(): Unit {
        sum = a + a3_0.a
    }
}

class Cycle_a_00190_A3 {
    public var a4_0:Cycle_a_00190_A4 = Cycle_a_00190_A4("");
    public var a: Int32
    public var sum: Int32
    public var strObjectName: String
    public Cycle_a_00190_A3(strObjectName: String) {
        a = 103
        sum = 0
        this.strObjectName = strObjectName
    }
    public func add(): Unit {
        sum = a + a4_0.a
    }
}

class Cycle_a_00190_A4 {
    public var a5_0:Cycle_a_00190_A5 = Cycle_a_00190_A5("");
    public var a: Int32
    public var sum: Int32
    public var strObjectName: String
    public Cycle_a_00190_A4(strObjectName: String) {
        a = 104
        sum = 0
        this.strObjectName = strObjectName
    }
    public func add(): Unit {
        sum = a + a5_0.a
    }
}

class Cycle_a_00190_A5 {
    public var a6_0:Cycle_a_00190_A6 = Cycle_a_00190_A6("");
    public var a: Int32
    public var sum: Int32
    public var strObjectName: String
    public Cycle_a_00190_A5(strObjectName: String) {
        a = 105
        sum = 0
        this.strObjectName = strObjectName
    }
    public func add(): Unit {
        sum = a + a6_0.a
    }
}

class Cycle_a_00190_A6 {
    // var a1_0 = Cycle_a_00190_A1("");
    public var a10_0:Cycle_a_00190_A10 = Cycle_a_00190_A10("");
    public var a: Int32
    public var sum: Int32
    public var strObjectName: String
    public Cycle_a_00190_A6(strObjectName: String) {
        a = 106
        sum = 0
        this.strObjectName = strObjectName
    }
    public func add(a1_0: Cycle_a_00190_A1): Unit {
        sum = a + a1_0.a + a10_0.a
    }
}

class Cycle_a_00190_A7 {
    public var a: Int32
    public var sum: Int32
    public var strObjectName: String
    public Cycle_a_00190_A7(strObjectName: String) {
        // a5_0 = ();
        a = 107
        sum = 0
        this.strObjectName = strObjectName
    }
    public func add(a5_0: Cycle_a_00190_A5): Unit {
        sum = a + a5_0.a
    }
}

class Cycle_a_00190_A8 {
    public var a9_0:Cycle_a_00190_A9 = Cycle_a_00190_A9("");
    public var a: Int32
    public var sum: Int32
    public var strObjectName: String
    public Cycle_a_00190_A8(strObjectName: String) {
        // a9_0 = ();
        a = 108
        sum = 0
        this.strObjectName = strObjectName
    }
    public func add(): Unit {
        sum = a + a9_0.a
    }
}

class Cycle_a_00190_A9 {
    public var a7_0:Cycle_a_00190_A7 = Cycle_a_00190_A7("");
    public var a: Int32
    public var sum: Int32
    public var strObjectName: String
    public Cycle_a_00190_A9(strObjectName: String) {
        // a7_0 = ();
        a = 109
        sum = 0
        this.strObjectName = strObjectName
    }
    public func add(): Unit {
        sum = a + a7_0.a
    }
}

class Cycle_a_00190_A10 {
    public var a8_0:Cycle_a_00190_A8 = Cycle_a_00190_A8("");
    public var a: Int32
    public var sum: Int32
    public var strObjectName: String
    public Cycle_a_00190_A10(strObjectName: String) {
        // a8_0 = ();
        a = 110
        sum = 0
        this.strObjectName = strObjectName
    }
    public func add(): Unit {
        sum = a + a8_0.a
    }
}

func mm_testcase_main_wrapper(): Int32 {
    var a1_main: Cycle_a_00190_A1 = Cycle_a_00190_A1("a1_main");
    var a10_main: Cycle_a_00190_A10 = Cycle_a_00190_A10("a10_main");
    a1_main.a2_0 = Cycle_a_00190_A2("a2_0")
    a1_main.a2_0.a3_0 = Cycle_a_00190_A3("a3_0")
    a1_main.a2_0.a3_0.a4_0 = Cycle_a_00190_A4("a4_0")
    a1_main.a2_0.a3_0.a4_0.a5_0 = Cycle_a_00190_A5("a5_0")
    a1_main.a2_0.a3_0.a4_0.a5_0.a6_0 = Cycle_a_00190_A6("a6_0")
    a10_main.a8_0 = Cycle_a_00190_A8("a8_0")
    a10_main.a8_0.a9_0 = Cycle_a_00190_A9("a9_0")
    a10_main.a8_0.a9_0.a7_0 = Cycle_a_00190_A7("a7_0")
    a1_main.add();
    a10_main.add();
    a1_main.a2_0.add();
    a1_main.a2_0.a3_0.add();
    a1_main.a2_0.a3_0.a4_0.add();
    a1_main.a2_0.a3_0.a4_0.a5_0.add();
    a1_main.a2_0.a3_0.a4_0.a5_0.a6_0.add(a1_main);
    a10_main.a8_0.add();
    a10_main.a8_0.a9_0.add();
    a10_main.a8_0.a9_0.a7_0.add(a1_main.a2_0.a3_0.a4_0.a5_0);
    var result = a1_main.sum + a10_main.sum + a1_main.a2_0.sum + a1_main.a2_0.a3_0.sum + a1_main.a2_0.a3_0.a4_0.sum + a1_main
        .a2_0
        .a3_0
        .a4_0
        .a5_0
        .sum + a1_main.a2_0.a3_0.a4_0.a5_0.a6_0.sum + a10_main.a8_0.sum + a10_main.a8_0.a9_0.sum + a10_main
        .a8_0
        .a9_0
        .a7_0
        .sum;
    return result
}

main(): Int64 {
    mm_testcase_main_wrapper();
    // Runtime.GC();
    var result = mm_testcase_main_wrapper();
    if (result == 2215) {
        print((10).toString())
    }
    return 0
}
