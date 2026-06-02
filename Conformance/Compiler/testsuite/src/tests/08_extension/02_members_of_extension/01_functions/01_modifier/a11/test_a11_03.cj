/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_02_01_01_a11_03

  @Level:         1

  @Assertion:   8.2.1.1(11)
                class Foo {
                    open func f() {}
                    static func h() {}
                }
                extend Foo {
                    override func f() {} // error
                    open func g() {} // error
                    redef static func h() {} // error
                }

  @Description: Checks that the extension function with redef in the example causes a compile error.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single


*/

class Foo {
    open func f() {}
    static func h() {}
}
extend Foo {
    //override func f() {} // error
    //open func g() {} // error
    redef static func h() {} // error
}

main() {
    return 0
}
