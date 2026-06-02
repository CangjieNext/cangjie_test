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

class Cycle_a_00240_A1 {
    public var a2_0 :Cycle_a_00240_A2= Cycle_a_00240_A2("");
    public var a6_0 :Cycle_a_00240_A6= Cycle_a_00240_A6("");
    public var a: Int32
    public var sum: Int32
    public var strObjectName: String
    public Cycle_a_00240_A1(strObjectName: String) {
        a = 101
        sum = 0
        this.strObjectName = strObjectName
    }
    public func add(): Unit {
        sum = a + a2_0.a + a6_0.a
    }
}

class Cycle_a_00240_A2 {
    public var a3_0 :Cycle_a_00240_A3= Cycle_a_00240_A3("");
    public var a: Int32
    public var sum: Int32
    public var strObjectName: String
    public Cycle_a_00240_A2(strObjectName: String) {
        a = 102
        sum = 0
        this.strObjectName = strObjectName
    }
    public func add(): Unit {
        sum = a + a3_0.a
    }
}

class Cycle_a_00240_A3 {
    public var a4_0 :Cycle_a_00240_A4= Cycle_a_00240_A4("");
    public var a: Int32
    public var sum: Int32
    public var strObjectName: String
    public Cycle_a_00240_A3(strObjectName: String) {
        a = 103
        sum = 0
        this.strObjectName = strObjectName
    }
    public func add(a1_0: Cycle_a_00240_A1): Unit {
        sum = a + a1_0.a + a4_0.a
    }
}

class Cycle_a_00240_A4 {
    public var a5_0:Cycle_a_00240_A5 = Cycle_a_00240_A5("");
    public var a: Int32
    public var sum: Int32
    public var strObjectName: String
    public Cycle_a_00240_A4(strObjectName: String) {
        a = 104
        sum = 0
        this.strObjectName = strObjectName
    }
    public func add(): Unit {
        sum = a + a5_0.a
    }
}

class Cycle_a_00240_A5 {
    public var a: Int32
    public var sum: Int32
    public var strObjectName: String
    public Cycle_a_00240_A5(strObjectName: String) {
        a = 105
        sum = 0
        this.strObjectName = strObjectName
    }
    public func add(a3_0: Cycle_a_00240_A3): Unit {
        sum = a + a3_0.a
    }
}

class Cycle_a_00240_A6 {
    public var a7_0 :Cycle_a_00240_A7= Cycle_a_00240_A7("");
    public var a: Int32
    public var sum: Int32
    public var strObjectName: String
    public Cycle_a_00240_A6(strObjectName: String) {
        a = 106
        sum = 0
        this.strObjectName = strObjectName
    }
    public func add(): Unit {
        sum = a + a7_0.a
    }
}

class Cycle_a_00240_A7 {
    public var a: Int32
    public var sum: Int32
    public var strObjectName: String
    public Cycle_a_00240_A7(strObjectName: String) {
        a = 107
        sum = 0
        this.strObjectName = strObjectName
    }
    public func add(a1_0: Cycle_a_00240_A1): Unit {
        sum = a + a1_0.a
    }
}

func mm_testcase_main_wrapper(): Int32 {
    var a1_main = Cycle_a_00240_A1("a1_main");
    var a5_main = Cycle_a_00240_A5("a5_main");
    a1_main.a2_0 = Cycle_a_00240_A2("a2_0")
    a1_main.a2_0.a3_0 = Cycle_a_00240_A3("a3_0")
    a1_main.a2_0.a3_0.a4_0 = Cycle_a_00240_A4("a4_0")
    a1_main.a2_0.a3_0.a4_0.a5_0 = a5_main
    a1_main.a6_0 = Cycle_a_00240_A6("a6_0")
    a1_main.a6_0.a7_0 = Cycle_a_00240_A7("a7_0")
    a1_main.add();
    a5_main.add(a1_main.a2_0.a3_0);
    a1_main.a2_0.add();
    a1_main.a2_0.a3_0.add(a1_main);
    a1_main.a2_0.a3_0.a4_0.add();
    a1_main.a6_0.add();
    a1_main.a6_0.a7_0.add(a1_main);
    var result = a1_main.sum + a5_main.sum + a1_main.a2_0.sum + a1_main.a2_0.a3_0.sum + a1_main.a2_0.a3_0.a4_0.sum + a1_main
        .a6_0
        .sum + a1_main.a6_0.a7_0.sum;
    return result;
}

main(): Int64 {
    mm_testcase_main_wrapper();
    // Runtime.GC();
    var result = mm_testcase_main_wrapper();
    if (result == 1660) {
        print((10).toString())
    }
    return 0;
}
