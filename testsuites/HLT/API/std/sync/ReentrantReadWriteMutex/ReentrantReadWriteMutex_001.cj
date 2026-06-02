/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

import std.sync.{ReentrantReadWriteMutex, ReadWriteMutexMode}

main(): Int64 {
    let x: Int64 = 0
    let rwm = ReentrantReadWriteMutex(ReadWriteMutexMode.Fair)

    let res1 = spawn {
        
    }
    return 0
}
// ASSERT: scan sema_need_named_argument
