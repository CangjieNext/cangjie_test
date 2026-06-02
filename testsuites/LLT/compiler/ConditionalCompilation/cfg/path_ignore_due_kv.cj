// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./toml_2
// EXEC:%compiler %cmp_opt %n.cj %conditional_compilation_config_opt="k=v" %conditional_compilation_config_opt="./toml_2" -o %output
// EXEC:%compiler %cmp_opt %n.cj %conditional_compilation_config_opt="./toml_2" %conditional_compilation_config_opt="k=v" -o %output

@When[k == "v"]
var a = 0

main() {
    return a
}
