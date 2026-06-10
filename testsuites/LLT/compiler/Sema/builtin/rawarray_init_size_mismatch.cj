// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: core/mock.cj
// EXEC: %mkdir core
// EXEC: %move mock.cj core/
// EXEC: %cpfile %f core/main.cj
// EXEC-PIPE-1: %frontendCompiler --no-prelude -Woff all %typecheck %cmp_opt --package core 2>&1 | compare %f

// 原 RawArray<T>(size, repeat:) 处 size 类型错误会连锁 sema_array_*；现 rawArrayInitByValue 仅报 1 条 mismatched types。
package std.core

main(): Int64 {
    let raw = rawArrayAllocate<Int64>(3)
    let size: Int32 = 3
    rawArrayInitByValue<Int64>(raw, size, 7)
    return 0
}

/* SCAN
error: mismatched types
  ==> core/main.cj:19:37:
   | 
19 |     rawArrayInitByValue<Int64>(raw, size, 7)
   |                                     ^^^^ expected 'Int64', found 'Int32'
   | 

1 error generated, 1 error printed.
*/
