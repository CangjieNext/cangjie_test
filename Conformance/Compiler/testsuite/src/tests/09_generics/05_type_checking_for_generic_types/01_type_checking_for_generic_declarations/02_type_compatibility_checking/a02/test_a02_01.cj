/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_05_01_02_a02_01

  @Level:         1

  @Assertion: 9.5.1.2(2) 
              open class C {
                  func coo() {...}
              }

              class D <: C {...}

              interface Tr {
                  func bar(): Int64
              }

              func foo<T>(a: T) {
                  var b: C = a // error, T is not a subclass of C
                  a.coo() // error, T has no member function coo
                  a.bar() // error, T did not implement Tr
              }

              In function body of foo, there are three errors, the reasons are listed in the following:
              1. Variable d declared in function foo is excepted to have type C, compiler will then check whether
                 type T is a subtype of  C, i.e., T <: C. This constraint is not in the context of function
                 declaration. Hence, an error is emitted.
              2. because generic type T is not related with class C in the context, it cannot access C’s member
                 function coo.
              3. Similarly, because generic type T is not constrained by Tr, it cannot access Tr’s member function bar.

  @Description: Check the part "T is not a subclass of C".

  @Mode: compileonly

  @Negative: yes

*/

open class C {
    func coo() {}
}

class D <: C {}

interface Tr {
    func bar(): Int64
}

func foo<T>(a: T) {
    var b: C = a // error, T is not a subclass of C
}

main() {}

