// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %frontendCompiler %f

import std.collection.*

func p(complete: () -> Unit) {}

var s = "sst"
var bg = ArrayList<Int>()

public func downloadImg(data: Int) {
    for (i in 0..data) {
        func completeCallbackInside() {
        }
        let createOnCallback = p(completeCallbackInside)
    }
    for (i in 0..=data) {
        func completeCallbackInside() {
        }
        let createOnCallback = p(completeCallbackInside)
    }
    for (i in s) {
        func completeCallbackInside() {
        }
        let createOnCallback = p(completeCallbackInside)
    }
    for (i in bg) {
        func completeCallbackInside() {
        }
        let createOnCallback = p(completeCallbackInside)
    }
}

main() {}
