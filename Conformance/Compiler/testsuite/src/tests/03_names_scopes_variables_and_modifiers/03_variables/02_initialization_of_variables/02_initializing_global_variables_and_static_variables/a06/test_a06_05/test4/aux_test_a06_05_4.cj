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
import init_order.InitCommon

public var v4F32: Float32 = InitCommon.initFloat32("D")

public let var41 = Box(Int32(4))

public class C4 {
    public static let staticVar: Float32 = 4.4
}

public struct S4 {
    public static let staticVar: Float32 = 4.4
}
