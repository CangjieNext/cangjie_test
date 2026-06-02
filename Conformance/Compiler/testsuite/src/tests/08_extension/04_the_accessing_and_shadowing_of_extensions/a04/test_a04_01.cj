/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_04_a04_01

  @Level:         1

  @Assertion:       8.4(4) 
                    class A {
                        var v = 0
                    }

                    extend A {
                        func f() {
                            print(this.v) // ok
                            print(v) // ok
                        }
                    }

  @Description:     Positive example from spec.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/

class A {
    var v = 0
}

extend A {
    func f() {
        print(this.v) // ok
        print(v) // ok
    }
}

main() { 
    var myA = A()
    myA.f()
} 
