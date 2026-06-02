// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %f -L . -l %n -o %output 2>&1 | compare %f
// ASSERT: regex cannot assign to immutable value


unsafe func foo1(num: Int32) {
    num += 1
}

main():Int64 {
   0
}
