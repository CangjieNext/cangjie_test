/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not O2 and not g) EXEC: %compiler %cmp_opt %obf_layout --disable-reflection %f -o %output
// (not O2 and not g) RUN-EXEC: %run %run_opt %output %run_args
// (not O2 and not g) EXEC: %compiler %cmp_opt --disable-reflection %f -o %output_no_obf
// (not O2 and not g) EXEC: cat obf_me.obf.map | compare %f
// (not O2 and not g) ASSERT: regex obf_me.*global_b
// (not O2 and not g) ASSERT: regex obf_me.*global_a
// (not O2 and not g) ASSERT: scan public_global_c

package obf_me

class A {
    var member_a = 123456789
    var member_b = member_a + 1

    func member_1() {
        println("member_1 ${member_a} ${member_b}")
    }
}

var global_a = 123456789
var global_b = global_a + 1
public var public_global_c: Int64 = global_b + 1

func test_1() {
    println("test_1")
}

func test_2() {
    println("test_1")
}

func test_3() {
    println("test_1")
}

public func test_4() {
    println("test_1")
}

main() {
    test_1()
    test_2()
    test_3()
    test_4()
    println(global_b)
    var a = A()
    a.member_1()
    return 0
}
