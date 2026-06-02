// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroFoo.cj
// EXEC: %compiler %cmp_macro macroFoo.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %f -o %output
// ASSERT : scan expected declaration here
internal import pkg1.*

@Foo {x:int32, y:int32 => x + y} 

main() {
    return 0
}
