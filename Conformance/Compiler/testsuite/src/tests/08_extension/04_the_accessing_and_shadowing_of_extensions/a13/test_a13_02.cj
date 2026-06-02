/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_04_a13_02

  @Level:         1

  @Assertion:       8.4(13) 
                    class Foo {}

                    extend Foo { // OK
                        private func f() {}
                        func g() {}
                    }

                    extend Foo { // OK
                        func h() {
                            g() // OK
                            f() // Error
                        }
                    }

  @Description:     Negative example from spec.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

class Foo {}

extend Foo { // OK
    private func f() {}
    func g() {}
}

extend Foo { // OK
    func h() {
        f() // Error
    }
}

main() {}
