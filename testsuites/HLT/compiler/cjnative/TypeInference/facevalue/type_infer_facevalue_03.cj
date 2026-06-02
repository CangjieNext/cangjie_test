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

//  var e = #{1: "Aa", 2: "Bb", 3: "Cc"}    B103 不支持map类型

func foo_char(): Int64 {
    var res1 = if (true) {
        'a'
    } else {
        'b'
    }
    var res2 = if (false) {
        'a'
    } else {
        'b'
    }
    if (res1 == 'a' && res2 == 'b') {
        return 0
    }
    return 1
}

func foo_string(): Int64 {
    var res1 = if (true) {
        "a"
    } else {
        "b"
    }
    var res2 = if (false) {
        "1"
    } else {
        "2"
    }
    if (res1 == "a" && res2 == "2") {
        return 0
    }
    return 1
}

func foo_bool(): Int64 {
    var res1 = if (true) {
        false
    } else {
        true
    }
    var res2 = if (false) {
        false
    } else {
        true
    }
    if (!res1 && res2) {
        return 0
    }
    return 1
}

func foo_unit(): Int64 {
    var x: Unit = ()
    var res1 = if (true) {
        x
    } else {
        x
    }
    var res2 = if (false) {
        x
    } else {
        x
    }
    if (res1 == () && res2 == ()) {
        return 0
    }
    return 1
}

func foo_range(): Int64 {
    var res1 = 1..4 : 1
    var res2 = 1..4 : 2
    if (res1 != res2) {
        return 0
    }
    return 1
}
/**
func foo_array(): Int64{
    var res1 = true ? [1,2,3] : [1,2,3]
    var res2 = true ? [2,3,4] : [1,2,3]
    if (res1 && res2) {
        return 0
    }
    return 1
}
 */
main(): Int64 {
    return foo_char() + foo_string() + foo_bool() + foo_unit() + foo_range()
}
