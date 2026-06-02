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

enum Test {
    Do | Ho
}

func foo_char(): Int64 {
    var test1 = match (Test.Do) {
        case Do => 'a'
        case Ho => 'b'
    }
    var test2 = match (Test.Ho) {
        case Do => 'a'
        case Ho => 'b'
    }
    if (test1 == 'a' && test2 == 'b') {
        return 0
    }
    return 1
}

func foo_string(): Int64 {
    var test1 = match (Test.Do) {
        case Do => "hi"
        case Ho => "hello"
    }
    var test2 = match (Test.Ho) {
        case Do => "hi"
        case Ho => "hello"
    }
    if (test1 == "hi" && test2 == "hello") {
        return 0
    }
    return 1
}

func foo_bool(): Int64 {
    var test1 = match (Test.Do) {
        case Do => true
        case Ho => false
    }
    var test2 = match (Test.Ho) {
        case Do => true
        case Ho => false
    }
    if (test1 && !test2) {
        return 0
    }
    return 1
}

func foo_unit(): Int64 {
    var test1 = match (Test.Do) {
        case Do => ()
        case Ho => ()
    }
    var test2 = match (Test.Ho) {
        case Do => ()
        case Ho => ()
    }
    if (test1 == () && test2 == ()) {
        return 0
    }
    return 1
}

// B103 未支持Range<Int64>类型声明
// func foo_range(): Int64{
//     1..4
// }

//  var e = #{1: "Aa", 2: "Bb", 3: "Cc"}    B103 不支持map类型

func foo_lambda(): Int64 {
    var test1 = match (Test.Do) {
        case Do => ({x: Int32, y: Int32 => return x + y})
        case Ho => ({x: Int32, y: Int32 => return y})
    }
    var test2 = match (Test.Ho) {
        case Do => ({x: Int32, y: Int32 => return x + y})
        case Ho => ({x: Int32, y: Int32 => return y})
    }
    if (test1(2, 3) == 5 && test2(2, 3) == 3) {
        return 0
    }
    return 1
}

func foo_array(): Int64 {
    var test1 = match (Test.Do) {
        case Do => [1, 2]
        case Ho => [1, 2, 3]
    }
    var test2 = match (Test.Ho) {
        case Do => [1, 2]
        case Ho => [1, 2, 3]
    }
    if (test1.size == 2 && test2.size == 3) {
        return 0
    }
    return 1
}

func foo_tuple(): Int64 {
    var test1 = match (Test.Do) {
        case Do => (3.1415, "PIE")
        case Ho => (3.14, "PIE")
    }
    var test2 = match (Test.Ho) {
        case Do => (3.1415, "PIE")
        case Ho => (3.14, "PIE")
    }
    if (test1[0] == 3.1415 && test2[0] == 3.14) {
        return 0
    }
    return 1
}

main(): Int64 {
    return foo_char() + foo_string() + foo_bool() + foo_unit() + foo_lambda() + foo_array() + foo_tuple()
}
