// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC:%compiler %cmp_opt %n.cj %conditional_compilation_config_opt="k1=v1" %conditional_compilation_config_opt="k2=v2" -o %output

@When[k1 == "v1" && k2 == "v2"]
var a = 0

main() {
    return a
}
