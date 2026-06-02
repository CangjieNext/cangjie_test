// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %verbose_opt %n.cj -o %output
// EXEC: %run %run_opt %output
// ASSERT: regex-auto 2222
// ASSERT: regex-auto 3333

main()  {
    unsafe { 
        f_real()
        f()
    }
}

@C
func f() {println("2222")}

// Compiling CFunc with _real suffix should succeed
@C
func f_real() {println("3333")}
