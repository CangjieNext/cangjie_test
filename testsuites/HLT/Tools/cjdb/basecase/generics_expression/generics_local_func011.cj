/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


struct C2<X, Y> {
    public var width: X
    public var length: Y

    public init(width: X, length: Y) {
        this.width = width
        this.length = length
    }
    public init(width: X, length: Int64,aa:Y) {
        this.width = width
        this.length = aa
    }
}

main() {
    let mc_1 = C2<Int64, Float64>(1,2.0)
    let mc_2 = C2<Int64, Float64>(1,3,4.0)
    return 0
}
