// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./toml_4
// ERRCHECK:%compiler %cmp_opt %n.cj %conditional_compilation_config_opt="./toml_4" -o %output %diag_json
// ASSERT: scan user defined condition in cfg.toml should be like: k1 = "v1", and each key-value pair occupies a separate line.

@When[k == "v"]
var a = 0

main() {
    return a
}
