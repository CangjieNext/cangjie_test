/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

import std.sync.*

main(): Int64 {
    let mtx: ReentrantMutex = ReentrantMutex()
    Synchronized(mtx) {}
    synchronize(mtx) {}
    return 0
}
// ASSERT: scan sema_undeclared_identifier
