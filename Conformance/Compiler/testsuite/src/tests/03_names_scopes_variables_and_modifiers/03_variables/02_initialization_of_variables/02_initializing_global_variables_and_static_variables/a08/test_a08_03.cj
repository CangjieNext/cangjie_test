/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_02_02_a08_03

  @Level:         1

  @Assertion:    3.3.2.2(8) Declaration of a global/static variable must initialize it immediately.
                 That is, the declaration must provide an initialization expression and be in the form
                 of let v = e or var v = e.

  @Description:  Checks that declarations of class static variables with immediate initializing are valid.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

class Test {
    static var svInt: Int32 = 0
    static var svTuple = (1.1, 2.2)
    static var svBool = true
    static var svRange: Range<Int32> = 1..10

    static let slInt: Int32 = 0
    static let slTuple = (1.1, 2.2)
    static let slBool = true
    static let slRange: Range<Int32> = 1..10
}

class pTest {
    public static var svInt: Int32 = 0
    public static var svTuple = (1.1, 2.2)
    public static var svBool = true
    public static var svRange: Range<Int32> = 1..10

    public static let slInt: Int32 = 0
    public static let slTuple = (1.1, 2.2)
    public static let slBool = true
    public static let slRange: Range<Int32> = 1..10
}

main() {
}
