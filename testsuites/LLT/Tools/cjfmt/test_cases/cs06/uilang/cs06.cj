// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package common

open specific class Base01 {}
abstract specific class Base02 {}
sealed abstract specific class Base03 {}

public open specific class Rectangle {
    public specific var width: Int64
    protected specific var height: Int64
    private specific var area: Int64
    public specific init(width: Int64, height: Int64) {
        this.width = width
        this.height = height
        this.area = this.width * this.height
    }

    public mut specific prop area_: Int64 {
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