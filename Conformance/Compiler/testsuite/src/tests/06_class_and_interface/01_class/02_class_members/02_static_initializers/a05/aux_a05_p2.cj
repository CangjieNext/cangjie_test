/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Description: The definition of class with a static initializer
  @Structure: complex-aux
*/

package p2

import time.getTime


public class AuxA05P2 {
    public static let t : Duration

    static init() { t = getTime() }
}
