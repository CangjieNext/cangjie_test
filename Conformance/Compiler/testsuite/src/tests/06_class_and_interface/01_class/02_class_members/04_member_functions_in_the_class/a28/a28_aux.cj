/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: private: A function declared with modifier private can only be accessed in this class.
              This means that private member functions cannot be called
              through this class instance and cannot be inherited.

  @Description: Definition of a class with private member functions

  @Structure: complex-aux
*/

package a28

public class A28Aux {
    private func f1() {}
    private func f2(x: Int64) {}
    private func f3() {
        return 1
    }
    private func f4(x: Int64) {
        return 2
    }

    private func f5<T>() {}
    private func f6<T>(x: Int64) {}
    private func f7<T>() {
        return 3
    }
    private func f8<T>(x: Int64) {
        return 4
    }

    private static func f9() {}
    private static func f10(x: Int64) {}
    private static func f11() {
        return 5
    }
    private static func f12(x: Int64) {
        return 6
    }

    private static func f13<T>() {}
    private static func f14<T>(x: Int64) {}
    private static func f15<T>() {
        return 7
    }
    private static func f16<T>(x: Int64) {
        return 8
    }

}