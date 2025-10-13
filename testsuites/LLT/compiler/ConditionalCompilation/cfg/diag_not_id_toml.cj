// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ./not_id
// ERRCHECK: %compiler %cmp_opt %n.cj %conditional_compilation_config_opt="./not_id"

@When[k=="v"]
var a = 0

main() {
    return a
}

// ASSERT: scan user defined condition variable should be a vaild identifier