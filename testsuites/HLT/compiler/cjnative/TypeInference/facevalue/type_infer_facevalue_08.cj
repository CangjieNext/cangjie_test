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

func foo_char(): Rune {
    if (true) {
        return r'a'
    } else {
        return r'b'
    }
}

func foo_string(): String {
    if (false) {
        return "hi"
    } else {
        return "hello"
    }
}

func foo_bool(): Bool {
    if (true) {
        return false
    } else {
        return true
    }
}

func foo_unit(): Unit {
    if (true) {
        return ()
    } else {
        return ()
    }
}

// B103 未支持Range<Int64>类型声明
// func foo_range(): Range<Int64>{
//     1..4
// }

//  var e = #{1: "Aa", 2: "Bb", 3: "Cc"}    B103 不支持map类型

func foo_lambda(): (Int32, Int32) -> Int32 {
    if (true) {
        return {x: Int32, y: Int32 => return x + y}
    } else {
        return {x: Int32, y: Int32 => return y}
    }
}

func foo_array(): Array<Int64> {
    if (false) {
        return [1, 2]
    } else {
        return [1, 2, 3]
    }
}

func foo_tuple(): (Float64, String) {
    if (true) {
        return (3.1415, "PIE")
    } else {
        return (3.1, "PIE")
    }
}

func run(): Int64 {
    var arr = foo_array()
    var len = arr.size
    if (foo_char() == r'a' && foo_string() == "hello" && !foo_bool() && foo_unit() == () && foo_lambda()(2, 3) == 5 &&
        len == 3 && foo_tuple()[0] == 3.1415) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
