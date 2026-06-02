/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_04_a06_02

  @Level:         1

  @Assertion:       8.4(6) 
                    class A {
                        private var v1 = 0
                        protected var v2 = 0
                    }

                    extend A {
                        func f() {
                            print(v1) // error
                            print(v2) // ok
                        }
                    }

  @Description:     Negative example from spec.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

class A {
    private var v1 = 0
    protected var v2 = 0
}

extend A {
    func f() {
        print(v1) // error
    }
}

main() { 
    var myA = A()
    myA.f()
} 
