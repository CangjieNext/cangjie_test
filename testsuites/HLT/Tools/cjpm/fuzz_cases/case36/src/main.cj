/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package GenericMacro

// main.cj
internal import GenericMacro.test.returnSelf1
internal import GenericMacro.test.returnSelf2
internal import GenericMacro.test.returnSelf3
internal import GenericMacro.test.returnSelf4

main(): Int64 {
    var number: Int64 = 123
    number = returnSelf1(number)
    number = returnSelf2(number)
    number = returnSelf3(number)
    number = returnSelf4(number)
    println("number: ${number}")
    return 0
}
