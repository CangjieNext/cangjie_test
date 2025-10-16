// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./toml_1
// ERRCHECK: %compiler %cmp_opt %n.cj %conditional_compilation_config_opt="./toml_1" %conditional_compilation_config_opt="k=s"

@When[k=="v"]
var a = 0

main() {
    return a
}

// ASSERT: scan conditional compilation has been set by key-value mode, cfg.toml will be ignored