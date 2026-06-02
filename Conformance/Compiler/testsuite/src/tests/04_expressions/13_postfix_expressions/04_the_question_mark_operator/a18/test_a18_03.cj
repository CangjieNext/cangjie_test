/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_04_a18_03

  @Level:         1

  @Assertion: 4.13.4(18) When the left-hand side of an assignment expression is an optional chaining expression,
              it is required
              that the optional chaining expression be mutable (see Assignment Expressions).

  @Description: Check that immutable optional chaining expression being used on left-hand side of assignment expression
                causes a compilation error. Check case 'a?.b.c?.d = e1'.

  @Mode: compileonly

  @Negative: yes

*/

struct C {
    let d = 5
}

struct B {
    var c = Option<C>.Some(C())
}

struct A {
    var b = B()
}

main() {
    var a = Option<A>.Some(A())
    a?.b.c?.d = 9
    return
}

