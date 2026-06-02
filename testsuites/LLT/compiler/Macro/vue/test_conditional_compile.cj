// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex expected declaration here

package x

func E(){ print("E\n") }
func F(){ print("F\n") }
func G(){ print("G\n") }

main(): Int64 {
    @If[TARGET=="lion"]
    {
        E()
        F()
    }
    @Else {
        G()
    }
    return 0
}
