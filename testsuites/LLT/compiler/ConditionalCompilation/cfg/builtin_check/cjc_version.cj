// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK:%compiler %cmp_opt %n.cj %conditional_compilation_config_opt="cjc_version=lion" -o %output
// ASSERT: scan user defined condition's key can not be the same with builtin condition

main() {}
