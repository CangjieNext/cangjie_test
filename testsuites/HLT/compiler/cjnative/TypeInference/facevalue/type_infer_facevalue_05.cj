/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

func foo_char(x!: Rune = r'a'): Rune {
    return x
}

func foo_string(x!: String = "hello"): String {
    return x
}

func foo_bool(x!: Bool = true): Bool {
    return x
}

func foo_unit(x!: Unit = ()): Unit {
    return x
}

/**
B103 未支持Range<Int64>类型声明
func foo_range(x!: Range<Int64> = 1..4): Range<Int64>{
    return x
}
 */

//  var e = #{1: "Aa", 2: "Bb", 3: "Cc"}    B103 不支持map类型

func foo_lambda(x!: (Int32, Int32) -> Int32 = {x: Int32, y: Int32 => return x + y}): (Int32, Int32) -> Int32 {
    return x
}

func foo_array(x!: Array<Int64> = [1, 2, 3]): Int64 {
    return x.size
}

func foo_tuple(x!: (Float64, String) = (3.1415, "PIE")): (Float64, String) {
    return x
}

func run1(): Int64 {
    if (foo_char() == r'a' && foo_string() == "hello" && foo_bool() && foo_unit() == () && foo_lambda()(2, 3) == 5 &&
        foo_array() == 3 && foo_tuple()[0] == 3.1415) {
        return 0
    }
    return 1
}

func run2(): Int64 {
    if (foo_char(x: r'b') == r'b' && foo_string(x: "hi") == "hi" && foo_bool(x: true) && foo_unit(x: ()) == () &&
        foo_lambda(x: {x: Int32, y: Int32 => return y})(2, 3) == 3 && foo_array(x: [1, 2]) == 2 &&
        foo_tuple(x: (3.1415, "1"))[0] == 3.1415) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run1() + run2()
}
