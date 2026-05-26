// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK:%compiler %cmp_opt %n.cj -o %output

@When[cjc_version >= "0.19.100"]
main() {
    return 0
}
// ASSERT: scan conditional_compilation_not_support_cjc_version_format
