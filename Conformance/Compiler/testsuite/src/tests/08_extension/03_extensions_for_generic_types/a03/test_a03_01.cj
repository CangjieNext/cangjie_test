/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_03_a03_01

  @Level:         1

  @Assertion:       8.3(3) 
                    interface I {}
                    open class C {}
                    class Foo<T> where T <: C {}

                    extend Foo<T> {} // ok, T <: C

                    extend Foo<R> {} // ok, R <: C

                    extend Foo<S> <: I {} // ok, S <: C

                    extend Foo {} // error

  @Description:     Positive examples from spec.

  @Mode:            compileonly

  @Negative:        no

  @Structure:       single

*/

interface I {}
open class C {}
class Foo<T> where T <: C {}

extend<T> Foo<T> {} // ok, T <: C

extend<R> Foo<R> {} // ok, R <: C

extend<S> Foo<S> <: I {} // ok, S <: C

main() { 
} 
