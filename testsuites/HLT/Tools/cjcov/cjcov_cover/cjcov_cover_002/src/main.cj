/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func func1(para: Int64) {
    if (para > 100) {
        print("0覆盖")
    }
}

main(): Int64 {
    func1(0)
    func1(1)

    return 0
}
