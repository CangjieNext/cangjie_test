/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


class Box<T> {
    public var value: T
    public init(value: T) {
        this.value = value
    }
}

main() {
    let b1 = Box(1)
    var b2 = Box(2)

    return 0
}



