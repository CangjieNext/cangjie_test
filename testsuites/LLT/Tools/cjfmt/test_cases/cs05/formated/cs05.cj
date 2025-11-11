// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package common

common open class Base01 {}

common abstract class Base02 {}

common sealed abstract class Base03 {}

common public open class Rectangle {
    common public var width: Int64
    common protected var height: Int64
    common private var area: Int64
    common public init(width: Int64, height: Int64) {
        this.width = width
        this.height = height
        this.area = this.width * this.height
    }
    init(width: Int64, height: Int64, multiple: Int64) {
        this.width = width
        this.height = height
        this.area = width * height * multiple
    }

    common public mut prop area_: Int64 {
        get() {
            println("get")
            area
        }
        set(value) {
            println("set")
            area = value
        }
    }
}
