// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-0: %run %run_opt %output %run_args

public open class cls_AAA <: Interface_1688585797374_84 {
    init() { // block id: 83

    }
}

public interface Interface_1688585797374_84 <: interface_BBB {}

public interface interface_BBB {}

func foo() {
    var a: Option<(Int64, (Int64, interface_BBB))> = (50, (60, cls_AAA())) as (Int64, (Int64, interface_BBB))
    0
}

func goo() {
    var b: Option<((Int64, interface_BBB))> = ((60, cls_AAA())) as ((Int64, interface_BBB))
    0
}

main() {
    foo()
    goo()
    0
}
