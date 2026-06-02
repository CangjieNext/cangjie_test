// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %frontendCompiler %disableCodegen %cmp_opt %f

struct SA {
    var a = 1
    var b = 2
}

struct SC<T> {
    var m: Int64 = 3
    var n: T
    init(x: T) {
        n = x
    }
}

func foo<T>(x: SC<T>, z: T) {
    var y = x
    y.n = z
}

main() {
    foo<SA>(SC<SA>(SA()), SA())
}
