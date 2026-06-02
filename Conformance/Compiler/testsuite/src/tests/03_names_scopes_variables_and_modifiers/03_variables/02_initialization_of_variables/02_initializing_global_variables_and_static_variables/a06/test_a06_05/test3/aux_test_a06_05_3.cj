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

package test3
import init_order.InitCommon
import test2.*
import test4.*

public var v3F32: Float32 = InitCommon.initFloat32("C")

public let var3_1 = C2.staticVar
public let var3_2 = S4.staticVar
public let var33 = Box(Int32(4))
