// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: test.cj
// EXEC: %compiler %compile_lib_opt test.cj -o libtest.%middle
// ERRCHECK: %compiler %cmp_opt %diag_json libtest.%middle main.cj -o %main
// ASSERT: scan package_search_error

package cjmp.bluetooth.BaseProfile
public import ohos.bluetooth.BaseProfile.*

main() {}
