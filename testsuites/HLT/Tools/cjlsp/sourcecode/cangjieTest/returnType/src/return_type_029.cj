/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package returnType

public func base29() {
    let x = 0
    return match (x) {
        case 1 =>
            let r1 = "x = 1"
            print(r1)
        case 0 =>
            let r2 = "x = 0" 
            print(r2)
        case _ =>
            let r3 = "x != 1 and x != 0"
            print(r3)
    }
}

