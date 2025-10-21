/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.exception

open class FatherException <: Exception {
    public open func printException():Unit {
        print("")
    }
    func test() {}
}

class ChildException <: FatherException {
    public override func printException():Unit {
        print("")
    }
}
