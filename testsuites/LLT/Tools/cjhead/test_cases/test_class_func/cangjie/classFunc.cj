// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test.classFunc

/**
 * Rectangle
 */
public class Rectangle {
    // width
    let width: Int64
    let height: Int64

    /**
     * Rectangle::init
     */
    public init(width: Int64, height: Int64) {
        this.width = width
        this.height = height
    }
    /**
     * Rectangle::area
     */
    public func area() {
        width * height
    }
}
