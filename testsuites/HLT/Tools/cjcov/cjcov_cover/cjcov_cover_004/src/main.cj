/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func func1(para: Int64) {
    if (para > 0 && para < 10) {
        return 1
    } else if (para > 10) {
        return 10
    } else {
        return 0
    }
}

main(): Int64 {
    func1(0)
    func1(1)
    func1(11)

    return 0
}
