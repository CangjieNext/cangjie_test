/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

struct Rect {
    public var listui8: ArrayList<UInt8> = ArrayList<UInt8>([1, 2, 3])
    private var listui16: ArrayList<UInt16> = ArrayList<UInt16>([1, 2, 3])
    public var listui32: ArrayList<UInt32> = ArrayList<UInt32>([1, 2, 3])
    private var listui64: ArrayList<UInt64> = ArrayList<UInt64>([1, 2, 3])
    public var listuin: ArrayList<UIntNative> = ArrayList<UIntNative>([1, 2, 3])

    public var width: Int64
    protected var height: Int64
    private var area: Int64 = 0
    public init(width: Int64, height: Int64) {
        this.width = width
        this.height = height
        this.area = this.width * this.height
    }

}

main(): Int64 {
    var ret = Rect(10, 20)
    return 0
}
