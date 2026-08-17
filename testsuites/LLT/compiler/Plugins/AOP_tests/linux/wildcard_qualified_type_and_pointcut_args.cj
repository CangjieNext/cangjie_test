// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux)EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin %weave_aspects_plugin
// (CJNATIVE and Linux)EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// (CJNATIVE and Linux)ASSERT: scan args=1\nhandleOrder\nargs=2\nhandlePriorityOrder\nprocessOrder\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package p.shop.a.service

import stdx.aspect_cj.*

public class OrderDAO {}

@InsertAtEntry[
    packageName: "p.**.service",
    className: "Order*",
    methodName: "handle*",
    isStatic: false,
    recursive: false,
    funcTypeStr: "(**,p.*.a.**.*DAO)->*"
]
public func capturePointcutArgs(args: Array<Any>) {
    println("args=${args.size}")
}

@InsertAtEntry[
    packageName: "p.*.service",
    className: "Order*",
    methodName: "handle*",
    isStatic: false,
    recursive: false,
    funcTypeStr: "(**)->*"
]
public func mustNotCrossPackageSegments(args: Array<Any>) {
    println("overmatched")
}

public class OrderService {
    public func handleOrder(order: OrderDAO): Unit {
        println("handleOrder")
    }

    public func handlePriorityOrder(priority: Int64, order: OrderDAO): Unit {
        println("handlePriorityOrder")
    }

    public func processOrder(order: OrderDAO): Unit {
        println("processOrder")
    }
}

main() {
    let service = OrderService()
    let order = OrderDAO()
    service.handleOrder(order)
    service.handlePriorityOrder(1, order)
    service.processOrder(order)
    0
}
