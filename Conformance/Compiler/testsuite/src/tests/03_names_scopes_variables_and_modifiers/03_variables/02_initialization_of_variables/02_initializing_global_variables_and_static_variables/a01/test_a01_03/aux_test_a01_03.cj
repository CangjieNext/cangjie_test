/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Structure:    complex-aux
*/

var gInt: Int32 = 0
var gTuple = (1.1, 2.2)
var gBool = true
var gRange: Range<Int32> = 1..10

func foo() {
    gInt = 7
    gBool = true
    gTuple = (2.2, 3.3)
    gRange = 1..12
}
