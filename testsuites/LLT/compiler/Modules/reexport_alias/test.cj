// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../reexport_alias
// EXEC: %compiler %pkg_opt reexport_alias/B -o libBob.%middle %compile_lib_opt
// EXEC: %compiler %pkg_opt reexport_alias/A -o libAlice.%middle %compile_lib_opt
// EXEC-0: %compiler %pkg_opt reexport_alias libAlice.%middle libBob.%middle

internal import Alice.g as alias
internal import Alice.d as alias

main() {
    alias("text")
    alias(123)
}
