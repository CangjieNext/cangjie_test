// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件1b-2: 嵌套结构体字段GEP → InsertCJTBAA IsArrayLayoutElement/accumulateConstantOffset
// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

struct Inner { var x: Int64 = 0; var y: Float64 = 0.0 }
struct Outer { var a: Int64 = 0; var inner: Inner = Inner() }

main(): Int64 {
    var o = Outer()
    o.a = 1; o.inner.x = 2; o.inner.y = 3.0
    if (o.a + o.inner.x == 3 && o.inner.y > 0.0) { return 0 }
    return 1
}
