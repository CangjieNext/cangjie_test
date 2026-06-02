/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_a12_02

  @Level:         1
  @Assertion:    15.1(12) Note that the closure in the spawn expression cannot
                 capture local variables declared by var. For details about
                 closures, see Closures.

  @Description:  Checks that closure in spawn expression can't capture
                 local variables in class method

  @Mode:         compileonly
  @Negative:     yes
  @Structure:    single

*/

class A {
    let aLet = 5
    var aVar = "str"

    func start():Future<Bool> {
        var localVar = 0.1
        spawn {
            return aVar != "AAA" && aLet > 2 && localVar > 0.0
        }
    }
}

main(): Int64 {
    0
}
