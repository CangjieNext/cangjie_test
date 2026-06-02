/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_02_01_01_a05_03

  @Level:         1

  @Assertion:   8.2.1.1(5)
                // file1 in package p1
                package p1

                public open class Foo {}

                extend Foo {
                    private func f1() {} // ok
                    public func f2() {} // ok
                    protected func f3() {} // ok
                    func f4() {} // visible in the package
                }

                main() {
                    let a = Foo()
                    a.f1() // error, can not access private function
                    a.f2() // ok
                    a.f3() // ok
                    a.f4() // ok
                }

                // file2 in package p2
                package p2

                import p1.*

                class Bar <: Foo {
                    func f() {
                        f1() // error, can not access private function
                        f2() // ok
                        f3() // ok
                        f4() // error, can not access default function
                    }
                }


  @Description: Checks that private extension functions cannot be used within this package.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single

*/

package p1

public open class Foo {}

extend Foo {
    private func f1() {} // ok
    public func f2() {} // ok
    protected func f3() {} // ok
    func f4() {} // visible in the package
}

main() {
    let a = Foo()
    a.f1() // error, can not access private function
    a.f2() // ok
    a.f3() // ok
    a.f4() // ok
}
