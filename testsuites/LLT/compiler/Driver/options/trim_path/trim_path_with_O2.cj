// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//  EXEC: %compiler %coverage_opt %trimpath_opt %pwd %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
//  ASSERT: regex warning.*: '--coverage' should be used without option '--trimpath'.

main() {
    var a = 5000
    return 0
}
