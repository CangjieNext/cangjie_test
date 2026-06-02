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

func foo() {
    TestClass.sInt = 7
    TestClass.sBool = true
    TestClass.sTuple = (2.2, 3.3)
    TestClass.sRange = 1..12

    TestStruct.sInt = 7
    TestStruct.sBool = true
    TestStruct.sTuple = (2.2, 3.3)
    TestStruct.sRange = 1..12
}
