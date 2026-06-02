/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

struct R {
    public var length : Int32 = 0
    public var width : Int32 = 0

    public init(length: Int32, width: Int32) {
        this.length = length
        this.width = width
    }

    public operator func ==(right: R): R {
        return R(1,1)
    }
    public operator func !=(right: R): R {
        return R(2,1)
    }
}
main() {
    let r1 = R(100, 200)
    let r2 = R(100, 200)
    let r3 = r1 == r2
    let r4 = r1 != r2
    return 0
}



