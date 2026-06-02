/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: Functions defined in the interface can be accessed outside the interface,
              with the same effect as public, no access modifiers are allowed.

  @Description: Definition of a public interface

  @Structure: complex-aux
*/

package a05

public interface A05Aux {
    func f1() {
        return 1
    }

    static func f2() {
        return 2
    }

    func f3(): Int64
    static func f4(): Int64
}