// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./empty
// ERRCHECK: %compiler %cmp_opt %n.cj %conditional_compilation_config_opt="./empty"

@When[k == "v"]
var a = 0

main() {
    return a
}

// (not Windows) ASSERT: scan No such file: './empty/cfg.toml'
// (Windows) ASSERT: scan No such file: '.\empty\cfg.toml'
