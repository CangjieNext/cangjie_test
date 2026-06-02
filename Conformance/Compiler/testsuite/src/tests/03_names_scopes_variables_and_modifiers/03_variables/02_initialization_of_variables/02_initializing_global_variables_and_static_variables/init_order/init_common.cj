/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Description: package init_order
  
  @Structure: complex-aux

*/

package init_order

public class InitCommon {
    static var initOrderString = ""

    static public func initInt32(str: String) {
        initOrderString += str
        return Int32(0)
    }

    static public func initFloat32(str: String) {
        initOrderString += str
        return Float32(0)
    }

    static public func initStr(str: String) {
        initOrderString += str
        return ""
    }

    static public func initBool(str: String) {
        initOrderString += str
        return true
    }

    static public func initTuple(str: String) {
        initOrderString += str
        return (1,2,3)
    }

    static public func initRange(str: String) {
        var res:Range<Int32> = 1..10
        initOrderString += str
        return res
    }

    static public func getOrderString() {
        return initOrderString
    }
}
