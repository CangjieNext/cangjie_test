/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


struct Rect {
    public var width: Int64
    protected var height: Int64
    private var area: Int64 = 0
    public init(width: Int64, height: Int64) {
        this.width = width
        this.height = height
        this.area = this.width * this.height
    }
    public func test_arr() {
        var arru8: Array<UInt8> = [1, 2, 3]
        var arru16: Array<UInt16> = [1, 2, 3]
        var arru32: Array<UInt32> = [1, 2, 3]
        var arru64: Array<UInt64> = [1, 2, 3]
        var arruin: Array<UIntNative> = [1, 2, 3]
        var arr8: Array<Int8> = [1, 2, 3]
        var arr16: Array<Int16> = [1, 2, 3]
        var arr32: Array<Int32> = [1, 2, 3]
        var arr64: Array<Int64> = [1, 2, 3]
        var arrin: Array<IntNative> = [1, 2, 3]
        return 0
    }

}

main(): Int64 {
    var ret = Rect(10, 20)
    ret.test_arr()
    return 0
}
