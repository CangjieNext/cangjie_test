// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f %diag_json 2>&1 | compare %f

class Rectangle {
    public let width: Int64

    public let height: Int64

    public init(width: Int64, height: Int64) {
        this.width = width

        this.height = height
    }

    public func area() {
        width * height
    }
}

main() {
    let r = Rectangle(10, 20)

    let i1 = r

    let i3: Rectangle = i1.width as Rectangle

    0
}
// ASSERT: scan sema_mismatched_types
