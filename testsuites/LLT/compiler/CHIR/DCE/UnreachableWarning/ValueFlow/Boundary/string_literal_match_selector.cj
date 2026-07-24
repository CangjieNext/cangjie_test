// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A String literal pattern comparison remains a resolved Apply boundary.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    match ("one") {
        case "two" => println("not diagnosed through String Apply")
        case _ => println("fallback")
    }
}

/* SCAN
*/
