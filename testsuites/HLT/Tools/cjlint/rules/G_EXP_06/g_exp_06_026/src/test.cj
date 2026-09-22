/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func isZero(x: Int64): Bool {
    return (x == 0) == true
}

main(): Int64 {
    var a = true
    var b = isZero(1)
    if (a == true && b != true) {
        return 1
    } else {
        return 0
    }
}
