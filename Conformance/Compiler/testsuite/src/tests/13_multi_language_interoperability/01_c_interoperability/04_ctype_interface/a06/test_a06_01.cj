/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_04_a06_01

  @Level:         1

  @Assertion:    13.1.4(6) 
                    @C
                    struct A{}// implicit implement CType
                    class B<:CType {} // error
                    class C{}// error
                    extend C<:CType {} // error
                    class D<T>where T <: CType {}
                    main() {
                      var d0=D<Int8 >()// ok
                      var d1=D<A>()// error
                    }

  @Description:  The example, the part that compiles successfully.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

  @Comment:      

  @Issue: 0006421
*/

@C
struct A{}// implicit implement CType

class D<T> where T <: CType {}

main() {
    var d0=D<Int8 >()// ok
}
