/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_02_a02_07

  @Level:         1

  @Assertion:    3.2.3.2(2) The variables defined within a block has higher level of scope 
                 than the ones defined outside.

  @Description:  Checks that variable defined within global function is invisible for the local one.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

func foo1() {
    let v1 = 2023
}

main() {
    foo1()

    func foo2() {
        let v2 : Int32 = v1
    }

    return 0
}
