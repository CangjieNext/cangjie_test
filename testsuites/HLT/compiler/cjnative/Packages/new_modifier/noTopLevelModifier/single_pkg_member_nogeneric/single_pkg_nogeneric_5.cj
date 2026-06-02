/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler  %cmp_opt %f -o %output
// ASSERT: scan sema_accessibility_with_main_hint

protected class Rectangle {
    let width: Int64
    public init(width: Int64) {
        this.width = width
    }
}

protected struct BB {
    public var a: Rectangle
    init(temp: Rectangle) {
        a = temp
    }
}

protected var AA = BB(Rectangle(1))
public var aa = AA.a

main() {
    return aa.width - 1
}
