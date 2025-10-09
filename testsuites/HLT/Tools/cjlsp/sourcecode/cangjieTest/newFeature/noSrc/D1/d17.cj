/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

extend String {
    func printSize2() {
        print("the size")
    }
}

func test17() {
    let a = "abc"
    a.printSize2()
}
