// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %noColor %f %diag_json 2>&1 | compare %f
struct R {
    public var x = 1

    public func update() {
        x++
    }
}

main(): Int64 {
    var r = R()
    r.update()
    println(r.x)
    return 1
}
// ASSERT: scan sema_cannot_modify_var
