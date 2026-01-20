// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package common

open platform class Base01 {}
abstract platform class Base02 {}
sealed abstract platform class Base03 {}

public open platform class Rectangle {
    public platform var width: Int64
    protected platform var height: Int64
    private platform var area: Int64
    public platform init(width: Int64, height: Int64) {
        this.width = width
        this.height = height
        this.area = this.width * this.height
    }

    public mut platform prop area_: Int64 {
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