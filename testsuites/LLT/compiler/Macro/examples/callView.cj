// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroView.cj
// EXEC: %compiler %cmp_macro macroView.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan init Image
// ASSERT: scan show view
// ASSERT: scan call add_view_child
// ASSERT: scan init Image
// ASSERT: scan test1.png
// ASSERT: scan call add_view_child

import view.*

// ============================================================================
// 3.user interface or import interface
class Image {
    public var image_name: String
    public init(name: String) {
        image_name = name
        print("init Image\n")
        print(name + "\n")
    }
}

class VStack {
    public func add_view_child(children: Image) {
        print("call add_view_child\n")
    }
    public func dump() {
    }
    public init() {
    }
}
// ============================================================================

// ============================================================================
// 4.call macro
main(): Int64 {
    var show_legal = true
    @callView(VStack{Image("show view") If(show_legal) { Image("test1.png") }})
    return 0
}
// ============================================================================
