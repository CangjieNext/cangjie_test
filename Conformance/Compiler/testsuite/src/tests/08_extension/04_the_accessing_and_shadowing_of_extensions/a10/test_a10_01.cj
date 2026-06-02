/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_04_a10_01

  @Level:         1

  @Assertion:       8.4(10) 
                    class A {}

                    extend A {
                        func f() {}
                    }
                    
                    extend A {
                        func f() {} // error
                    }

  @Description:     Negative example from spec.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

class A {}

extend A {
    func f() {}
}

extend A {
    func f() {} // error
}

main() {}