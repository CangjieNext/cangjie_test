/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func func1(): Int64 {
    do {
        print("执行一次")
    } while (false)

    return 1
}

main(): Int64 {
    func1()

    return 0
}
