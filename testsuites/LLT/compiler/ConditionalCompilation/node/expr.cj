// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %enableCompileDebug %n.cj %diag_json


let a = 1

main () {
    @When[cjc_version >= "0.52.1"] // expr
    println(a)
}
// ASSERT: scan parse_expected_decl
