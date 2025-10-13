// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ./cfg.toml
// EXEC:%compiler %cmp_opt %n.cj -o %output

@When[k == "default"]
var a = 0

main() {
    return a
}
