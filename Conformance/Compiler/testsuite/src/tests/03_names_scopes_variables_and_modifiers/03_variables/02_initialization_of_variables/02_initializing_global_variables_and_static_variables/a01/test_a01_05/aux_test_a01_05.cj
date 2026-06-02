/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Structure:    complex-aux
*/

package p2

public var gInt: Int32 = 0
public var gTuple = (1.1, 2.2)
public var gBool = true
public var gRange: Range<Int32> = 1..10

public func foo() {
  gInt = 7
  gBool = true
  gTuple = (2.2, 3.3)
  gRange = 1..12
}
