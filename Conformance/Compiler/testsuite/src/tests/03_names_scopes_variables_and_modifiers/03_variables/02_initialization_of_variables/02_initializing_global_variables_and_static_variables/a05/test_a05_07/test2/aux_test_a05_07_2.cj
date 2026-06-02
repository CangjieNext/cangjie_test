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

import test3.*
import init_order.InitCommon

public class AuxTestA05072 {
    public static let vF32: Float32 = InitCommon.initFloat32("B") + AuxTestA05073.vF32
}
