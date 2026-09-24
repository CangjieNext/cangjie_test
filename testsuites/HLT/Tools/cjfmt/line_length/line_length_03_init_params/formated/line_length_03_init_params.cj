/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class L {
    var content: Array<Int64>
    init(
        content: Array<Int64>,
        isShow!: Bool = true,
        id!: String = "",
        title!: String = "none"
    ) {
        this.content = content
    }
}

main() {
    let l = L([1, 2, 3, 4, 5, 6])
    println("${l.content.size}")
}
