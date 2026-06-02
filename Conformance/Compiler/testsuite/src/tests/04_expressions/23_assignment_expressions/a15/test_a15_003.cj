
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_23_a15_003

  @Level:         1

  @Assertion:   4.23(15) A left value expression is legal only if it is mutable. For the mutability of the above
                expressions, see the corresponding sections.
  @Description: Check that 'e.a' cannot be assigned when 'a' is an instance member function and type of 'e' is a
                reference type.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: ignore

*/

class C {
    func foo() {}

    func bar() {}
}

class D {
    func getC() { c }

    var c = C()
}

main() {
    var d = D()
    d.getC().foo = d.c.bar
}