/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class A {}

class B <: A {}
//Add a method of Defining List
func foo() {
    var list: Array<Float32>
    list = [3.14, 4.14, 5.14]
}

main() {
    let listZero: Array<Int32> = [] // empty List
    let listOne: Array<Int32> = [1, 2, 3, 4]
    var listTwo: Array<Int64> = [5, 6, 7]
    var listThree: Array<Float32>
    var listFour = ["A", "B", "C"] // The type of listFour is inferred to be List<String>

    //   var listFive = listThree  // The type of listFive is inferred to be List<Float32>
    var listSix = [A(), B()] // The type of listSix is inferred to be List<A>
    let nestedList = [[1, 2, 3, 4], [5, 6, 7]] // The type of nestedList is inferred to be List<List<Int64>>
    return 0
}
