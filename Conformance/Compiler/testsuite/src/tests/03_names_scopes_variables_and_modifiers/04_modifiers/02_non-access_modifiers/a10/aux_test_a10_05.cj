/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Description:  This file defines sealed interface I and sealed class C.

  @Structure:    complex-aux
*/

package aux_test_a10_05

sealed interface I {
    func s() { "s" }
}

sealed abstract class C <: I {
    public static var sv = 0
    public static let sl = 1
    public static func sf() { 2 }

    public var v = 3
    public let l = 4
    public func f() { 5 }
}
