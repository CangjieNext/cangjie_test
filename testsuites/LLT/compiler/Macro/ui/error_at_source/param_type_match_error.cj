// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../ui_macros.cj
// EXEC: %compiler %cmp_macro ui_macros.cj
// ERRCHECK: %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-1 sema_mismatched_types
// ASSERT: scan the error originates in the macro `MComponent` (consider using `--debug-macro` for more info)

import ui.*

func foo(a: Int64) {}

@MComponent
class MyComponent {
	func build() {
        foo("hello") // Error Argument Type
	}
}

main() {}