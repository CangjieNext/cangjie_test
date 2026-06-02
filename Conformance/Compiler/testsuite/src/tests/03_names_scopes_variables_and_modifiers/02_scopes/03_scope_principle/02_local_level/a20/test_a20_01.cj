/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_02_a20_01

  @Level:         1

  @Assertion:    3.2.3.2(20) The scope starts from the name introduced to the end of the match case.

  @Description:  Checks the name introduced in the match case is not accessible for another one. 

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

open class Test {
    public var xx : Int32 = 1
    public var yy : Int32 = 2
}

main() {
    let r : Int32 = match(Test()) {
        case t : Test => let t = Test(); t.xx
        case _  => t.yy 
    }
}
