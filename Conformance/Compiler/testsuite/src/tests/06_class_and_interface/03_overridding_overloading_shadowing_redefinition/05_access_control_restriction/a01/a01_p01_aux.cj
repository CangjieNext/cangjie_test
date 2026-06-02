/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: The access modifier level is specified as follows
              based on the allowed access scope of the access modifier:
              • Access modifier level: public > protected > default > private.

  @Description: Class definition with public functions

  @Structure: complex-aux
*/

package p01

public open class A01P01Aux {
    public func f1() {
        return 1
    }

    public func f2<T>() {
        return 2
    }

    public static func f3() {
        return 3
    }

    public static func f4<T>() {
        return 4
    }
}