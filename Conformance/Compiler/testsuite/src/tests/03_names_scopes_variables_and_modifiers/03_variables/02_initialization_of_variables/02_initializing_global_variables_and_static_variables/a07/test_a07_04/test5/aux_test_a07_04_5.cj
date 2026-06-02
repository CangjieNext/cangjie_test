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

package test5
import init_order.InitCommon
import test2.*
import test4.*

public var v51F32: Float32 = InitCommon.initFloat32("E1")
public var v52F32: Float32 = InitCommon.initFloat32("E2") + v42F32 + v22F32
public var v53F32: Float32 = InitCommon.initFloat32("E3")
