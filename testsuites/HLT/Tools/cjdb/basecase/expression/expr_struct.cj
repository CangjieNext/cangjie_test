/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

struct Rect {
    public var listi8: ArrayList<Int8> = ArrayList<Int8>([1, 2, 3])
    private var listi16: ArrayList<Int16> = ArrayList<Int16>([1, 2, 3])
    public var listi32: ArrayList<Int32> = ArrayList<Int32>([1, 2, 3])
    private var listi64: ArrayList<Int64> = ArrayList<Int64>([1, 2, 3])
    public var listin: ArrayList<IntNative> = ArrayList<IntNative>([1, 2, 3])

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
