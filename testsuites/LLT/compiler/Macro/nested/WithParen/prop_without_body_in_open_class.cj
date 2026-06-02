// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: no_change.cj
// EXEC: %compiler %cmp_macro no_change.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args  

import define.*
import std.collection.*

@Nochange(
public abstract class C {
    @Nochange
    public prop p: Int64 

}
main() {
    0
}
)
