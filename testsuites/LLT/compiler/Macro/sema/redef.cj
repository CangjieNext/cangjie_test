// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-2 sema_redefinition
// ASSERT: scan the error originates in the macro `B1` (consider using `--debug-macro` for more info)

import define.*

public class C1 {
    public var ab = 1
    func gg1(x: Int64) {}
}

//重定义
@B1(C1().ab)

@B1(EEB.ABC)

main() {}
