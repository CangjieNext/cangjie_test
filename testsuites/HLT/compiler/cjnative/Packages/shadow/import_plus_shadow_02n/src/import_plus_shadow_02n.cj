/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkga/pkga.cj -o ./pkga.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgb/pkgb.cj pkga.%middle  -o ./pkgb.%middle
wq// EXEC-PIPE-1: %compiler %cmp_opt %f  pkga.%middle pkgb.%middle -o %output 2>&1 | compare %f



import pkga.*
import pkgb.*

func run(): Int64 {
let z: Int64 = aoo() 
return 0
}

main(): Int64 {
return run()
}

// ASSERT: regex :12:.* error: ambiguous match for function call
// ASSERT: regex-not no position error occurred
