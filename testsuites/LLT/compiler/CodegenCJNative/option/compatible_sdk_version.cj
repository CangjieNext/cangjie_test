// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix --cfg=CompatibleSDKVersion=19
// EXEC: %run %run_opt %n.%suffix
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix --cfg=CompatibleSDKVersion=20
// EXEC: %run %run_opt %n.%suffix
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix --cfg=CompatibleSDKVersion=abc
// EXEC: %run %run_opt %n.%suffix
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix --cfg=CompatibleSDKVersion=19.5
// EXEC: %run %run_opt %n.%suffix

main() {
    return 0
}
