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

package test2

import test1.*
import test4.*
import init_order.InitCommon

public var v21F32: Float32 = InitCommon.initFloat32("B1")
public var v22F32: Float32 = InitCommon.initFloat32("B2")
public var v23F32: Float32 = InitCommon.initFloat32("B3") + S1.staticVar + C4.staticVar

public class C2 {
    public static let staticVar: Float32 = 2.2
}

public struct S2 {
    public static let staticVar: Float32 = 2.2
}
