// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: X
// EXEC: %compiler -p %compile_lib_opt X -o X.%middle
// EXEC: %compiler %noColor X.%middle %f %diag_json -o %output 2>&1 | compare %f




import X.* as T.*
import T.* as C.*
import X.bar as foo
import X.foo as bar

main() {
    X.foo()
    C.bar()
    0
}
// ASSERT: scan parse_expected_character
