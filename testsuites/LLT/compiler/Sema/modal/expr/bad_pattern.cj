// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %diag_json %f -o %output -Woff all 2>&1 | compare %f

enum F {
    | B | C(String)

    func foo(val: (String, String) @local!) : String @local!{
        exclave {
            let (x, y) = val
            x+y
        }
    }
    func foo(this @local!) {
        exclave {
            match (this) {
                case B => println("B")
                case C(x) => let gar = x + x // should report error because x is @local!
            }
        }
    }
}

main() {}

// ASSERT: scan-2 "DiagKind": "sema_invalid_binary_expr",
// ASSERT: scan "Errors": 2,