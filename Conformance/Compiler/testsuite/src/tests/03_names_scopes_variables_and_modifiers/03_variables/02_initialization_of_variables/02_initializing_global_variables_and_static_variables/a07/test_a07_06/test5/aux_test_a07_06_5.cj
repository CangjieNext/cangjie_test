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
import test2.*
import test4.*
import init_order.InitCommon

public var v51F32: Float32 = InitCommon.initFloat32("E1")
public var v52F32: Float32 = InitCommon.initFloat32("E2") + S2.staticVar + C4.staticVar
public var v53F32: Float32 = InitCommon.initFloat32("E3")

public class C5 {
    public static let staticVar: Float32 = 5.5
}

public struct S5 {
    public static let staticVar: Float32 = 5.5
}
