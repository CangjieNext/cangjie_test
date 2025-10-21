/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package returnType

public func base30() {
    let x = 0
     if (x > 1) {
         return false
     } else if (x > 5) {
         return 30
     } else {
         return "xxx"
     }
}

