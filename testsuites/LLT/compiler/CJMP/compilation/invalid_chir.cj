// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// (Linux) EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common func foo(): Unit

// SEPARATE-FILE: p/p.cj
// (Linux) EXEC-0: echo "invaild chir" > c/cmp.chir
// (Linux) EXEC-PIPE-1: %compiler %diag_json --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p 2>&1 | compare %f
// (Linux) ASSERT: scan please confirm it was created by compiler whose version is
// (Linux) ASSERT: scan-not Internal Compiler Error
package cmp

public platform func foo(): Unit {}

