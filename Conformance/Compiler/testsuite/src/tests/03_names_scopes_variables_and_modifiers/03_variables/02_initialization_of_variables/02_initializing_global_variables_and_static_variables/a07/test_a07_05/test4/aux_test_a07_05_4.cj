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

package test4

import test1.*
import test3.*
import init_order.InitCommon

public var v41F32: Float32 = InitCommon.initFloat32("D1") + foo1() + foo3()
public var v42F32: Float32 = InitCommon.initFloat32("D2")
public var v43F32: Float32 = InitCommon.initFloat32("D3")

public func foo4(): Float32 {
    4.4
}
