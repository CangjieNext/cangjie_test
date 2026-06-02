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

public var v41F32: Float32 = InitCommon.initFloat32("D1") + C1.staticVar + S3.staticVar
public var v42F32: Float32 = InitCommon.initFloat32("D2")
public var v43F32: Float32 = InitCommon.initFloat32("D3")

public class C4 {
    public static let staticVar: Float32 = 4.4
}

public struct S4 {
    public static let staticVar: Float32 = 4.4
}
