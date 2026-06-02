/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_03_a03_02

  @Level:         1

  @Assertion:       8.3(3) 
                    interface I {}
                    open class C {}
                    class Foo<T> where T <: C {}

                    extend Foo<T> {} // ok, T <: C

                    extend Foo<R> {} // ok, R <: C

                    extend Foo<S> <: I {} // ok, S <: C

                    extend Foo {} // error

  @Description:     Negative example from spec.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

open class C {}

class Foo<T> where T <: C {}

extend Foo {} // error

main() { 
} 
