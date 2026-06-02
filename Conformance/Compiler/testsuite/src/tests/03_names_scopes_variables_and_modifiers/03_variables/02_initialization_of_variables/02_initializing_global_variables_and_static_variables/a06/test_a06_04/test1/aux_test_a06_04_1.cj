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
import test4.*
import init_order.InitCommon

public var v1F32: Float32 = InitCommon.initFloat32("A")

public var v11: Float32 = foo3()
public var v12: Float32 = foo4()

public func foo1(): Float32 {
    1.1
}
