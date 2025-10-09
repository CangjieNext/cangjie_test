// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// LEVEL 0
// DEPENDENCE: import.pkg.cj
// EXEC: %compiler import.pkg.cj %compile_lib_opt -o %n.%lib_extension
// (Linux) EXEC: mkdir -p some/a@b
// (Linux) EXEC: mv a@b.cjo some/a@b
// (Linux) EXEC: CANGJIE_PATH="$(realpath some):$CANGJIE_PATH" %compiler %f %n.%lib_extension
// (Linux) EXEC: CANGJIE_PATH="$(realpath some/a@b):$CANGJIE_PATH" %compiler %f %n.%lib_extension
// (Linux) EXEC: %compiler %f %n.%lib_extension --import-path "$(realpath some/a@b)"
// (Linux) EXEC: %compiler %f %n.%lib_extension --import-path some

import a::b.*
main() {
    foo()
}