/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_01_a07_01_extend

  @Level:         1

  @Assertion:    10.1.1(7) In the following example, instance member function h 
                 and static member function h are in different extensions of class A 
                 and are both private. No error will be reported during compilation

  @Description:  Compiler must not emit error, however it emits

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

  @Issue:        0006214

*/



class A {}

extend A {

    private func h() {}

}

 

extend A {

    private static func h(a: Int64) {} // OK

}

main(ina :Array<String>) {
    0
}
