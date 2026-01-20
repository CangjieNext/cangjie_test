// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package common

platform public struct Rectangle {
    platform public var width: Int64
    platform protected var height: Int64
    platform private var area: Int64
    platform public init(width: Int64, height: Int64) {
        this.width = width
        this.height = height
        this.area = this.width * this.height
    }

    platform public mut prop area_: Int64 {
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
