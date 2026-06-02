/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Description: package init_order

  @Structure: single

  @Structure:       complex-aux
*/

package init_order

public class InitCommon {
    static var initOrderString = ""

    static public func initFloat32(str: String) {
        initOrderString += str
        return Float32(0)
    }
    static public func getOrderString() {
        return initOrderString
    }
}
