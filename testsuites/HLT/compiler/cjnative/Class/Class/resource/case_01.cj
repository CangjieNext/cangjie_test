/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 |compare %f

open class AAA <: Resource{
    public open  func close(expunge:Bool): Unit{}
    public open  func close(): Unit{}

    public open  func isClosed(): Bool{
        return false
    }
}



main(): Int64 {
    try(aaa =AAA()) {
        print("done")
    }
    return 0
}
// ASSERT: scan done
