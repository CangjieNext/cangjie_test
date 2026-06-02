// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// LEVEL 0
// DEPENDENCE: import.pkg.cj %n.pkg.cj
// EXEC: %compiler import.pkg.cj %compile_lib_opt -o %n.%lib_extension
// EXEC: %compiler %n.pkg.cj %compile_lib_opt
// ERRCHECK: %compiler %f %n.%lib_extension %diag_json 2>&1

package a::c
import a::b
import m::b

main() {
    b.foo()
}

// ASSERT: scan-1 "DiagKind": "sema_ambiguous_use",
// ASSERT: scan-1 "DiagKind": "package_conflict_import",
// ASSERT: scan-1 "Errors": 1,
