// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class Rectangle {
    var classarrInt64: Array<Int64> = [1, 2, 3, 4, 5]
    public var width: Int64
    protected var height: Int64
    private var area: Int64
    public init(width: Int64, height: Int64) {
        // UInt
        var vUInt8: UInt8 = 5
        var vUIntN: UIntNative = 45
        this.width = width
        this.height = height
        this.area = this.width * this.height
    }
    init(width: Int64, height: Int64, multiple: Int64) {
        this.width = width
        this.height = height
        this.area = width * height * multiple
    }
    public func areas() {
        this.width * this.height
    }
}

var global_Int64: Int64 = 11

main(): Int64 {
    var r1 = 1..5 : 1
    var a = Rectangle(10, 10)
    return 0
}
