/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    if (case02() != 10) {
        return 1
    }
    if (case03() != 10) {
        return 1
    }
    if (case04() != 40) {
        return 1
    }
    return 0
}

//func case01(){
//    let arr =[0, 1, 2, 3, 4]
//    var a: Int32 = 0
//    for (item in arr) {
//        print("${item}")
//    }
//    a
//}

func case02() {
    let arr = [0, 1, 2, 3, 4]
    var a: Int64 = 0
    for (item in arr) {
        a = a + item
    }
    a
}

func case03() {
    let arr = Array<Int32>(5, repeat: 2)
    var a: Int32 = 0
    for (item in arr) {
        a = a + item
    }
    a
}

func case04() {
    let arr = Array<Array<Int32>>(5, repeat: Array<Int32>(4, repeat: 2))
    var a: Int32 = 0
    for (item in arr) {
        for (sub_item in item) {
            a = a + sub_item
            print(a.toString() + "\n")
        }
    }
    a
}
