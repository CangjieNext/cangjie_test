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

package test1

import test3.*
import init_order.InitCommon

public var v11F32: Float32 = InitCommon.initFloat32("A1")
public var v12F32: Float32 = InitCommon.initFloat32("A2") + foo3()
public var v13F32: Float32 = InitCommon.initFloat32("A3")

public func foo1(): Float32 {
    1.1
}
