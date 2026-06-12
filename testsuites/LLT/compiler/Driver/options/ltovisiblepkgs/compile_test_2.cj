// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package tmp_test

// DEPENDENCE: lib1.cj lib2.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full lib2.cj -o lib2.bc
// EXEC: %compiler --lto-keep-pkg-visibility="" %cmp_opt %compile_shared_lib_opt --lto=full lib1.cj lib2.bc -o lib.so 
// EXEC-1: nm lib.so | grep -E "T.*(foo|fxx|hw)"