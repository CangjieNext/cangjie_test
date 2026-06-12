// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj types.cj list_option.cj list.cj
// EXEC: %compiler %cmp_opt --compile-macro define.cj
// EXEC: %compiler %cmp_opt --module-name types types.cj --output-type=staticlib -o types.a
// EXEC-0: %compiler %cmp_opt list_option.cj list.cj --output-type=staticlib types.a --debug-macro 

