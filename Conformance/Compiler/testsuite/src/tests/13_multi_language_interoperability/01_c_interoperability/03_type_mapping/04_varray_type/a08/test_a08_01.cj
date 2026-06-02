/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     13_01_03_04_a08_01

  @Level:         1

  @Assertion:    13.1.3.4(8) 
    CPointer<VArray<T, $N>> is equivalent to CPointer<T>.
    foreign func foo1(a: VArray<Int32, $3>): Unit
    foreign func foo2(a: CPointer<Int32>): Unit
    var a: VArray<Int32, $3> = [1, 2, 3]
    unsafe {
    foo1(inout a) // Ok.
    foo2(inout a) // Ok.
    } 
 
  @Description:  Check positive example behaves as expected.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single
  @Issue:        0006077, 6638

*/

foreign func free(a: VArray<Int32, $3>): Unit

main() {
    var a: VArray<Int32, $3> = [1, 2, 3]
    unsafe {
        free(inout a) // Ok.
    } 
}
