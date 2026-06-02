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
    var res1 = 'a' == 'a'
    var res2 = 'a' <= 'b'
    var res3 = 'b' >= 'a'
    var res4 = 'b' > 'a'
    var res5 = 'a' < 'b'
    var res6 = 'a' != 'b'
    if (res1 && res2 && res3 && res4 && res5 && res6) {
        return 0
    }
    return 1
}

func foo_string(): Int64 {
    var res1 = "2" == "2"
    var res2 = "1" <= "2"
    var res3 = "2" >= "1"
    var res4 = "2" > "1"
    var res5 = "1" < "2"
    var res6 = "1" + "2"
    var res7 = "1" != "2"
    if (res1 && res2 && res3 && res4 && res5 && res6 == "12" && res7) {
        return 0
    }
    return 1
}

func foo_bool(): Int64 {
    var b1 = !false
    var b2 = true
    var b3 = true && true
    var b4 = false || true
    //    var b5 = true ^^ false
    var b6 = false == false
    var b7 = true != false
    if (b1 && b2 && b3 && b4) {
        return 0
    }
    return 1
}

func foo_unit(): Int64 {
    var res1 = () == ()
    //    var res2 = () != ()
    if (res1) {
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
//  B103未支持元组、数组类型的判等
func foo_array(): Int64{
    var res1 = [1,2,3] == [1,2,3]
    var res2 = [2,3,4] != [1,2,3]
    if (res1 && res2) {
        return 0
    }
    return 1
}

func foo_tuple(): Int64{
    var res1 = (3.14, "PIE") == (3.14, "PIE")
    var res2 = (3.14, "PIE") !=("3.14", "PIE")
    if (res1 && res2) {
        return 0
    }
    return 1
}
 */
main(): Int64 {
    return foo_char() + foo_string() + foo_bool() + foo_unit() + foo_range()
}
