// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %frontendCompiler %disableCodegen %cmp_opt %f

class CA {
    var m: SA = SA()
}

struct SA {
    var n: Int64 = 10
}

func foo<T>(x: T) where T <: CA {
    x.m.n = 10
}

main() {
    foo<CA>(CA())
}
