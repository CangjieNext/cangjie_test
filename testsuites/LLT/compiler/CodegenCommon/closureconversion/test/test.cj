// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg.cj
// EXEC: %compiler %cmp_opt --output-type=staticlib pkg.cj  -o pkg.%middle
// EXEC: %compiler %cmp_opt pkg.%middle %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args

internal import AAAAA.*

class TaskList <: B<() -> Unit> {}

class ThreadPool {
    public let sideThreadList: SideThreadList
    init() {
        sideThreadList = SideThreadList()
    }
    public func isShutdown() {
        return 50
    }
}

class SideThreadList {
    private let taskList: TaskList
    init() {
        taskList = TaskList()
    }
}

var a = ThreadPool().isShutdown()

main() {
    0
}
