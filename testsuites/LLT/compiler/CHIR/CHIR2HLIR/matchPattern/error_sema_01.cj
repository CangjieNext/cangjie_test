// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %n.cj %diag_json -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

main(): Int64 {
    var var1: (Int64) -> Bool = {var2: Int64 => (var2 is Float64)};
    if (44 |> var1) {
        ()
    };
    match (var1) {
        case "A" => (1)
    }
    return 0
}
