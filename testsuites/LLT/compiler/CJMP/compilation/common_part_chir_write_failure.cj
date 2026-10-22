// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A directory at a CHIR output path must make the current compilation fail, whatever writes the file.
// ASSERT: scan frontend_invalid_output_path
// ASSERT: scan-not Internal Compiler Error

// SEPARATE-FILE: out/cmp.chir/placeholder.txt
Keep the CHIR output path of '--output-type=chir' as a directory.

// SEPARATE-FILE: c.cj
// EXEC-PIPE-1: %compiler %diag_json --experimental c.cj --output-type=chir --output-dir ./out 2>&1 | compare %f
package cmp

public common func foo(): Int64

// SEPARATE-FILE: raw/demo.chir/placeholder.txt
Keep the CHIR output path of '--emit-chir=raw' as a directory.

// SEPARATE-FILE: raw.cj
// EXEC-PIPE-1: %compiler %diag_json --experimental raw.cj --emit-chir=raw --output-dir ./raw 2>&1 | compare %f
package demo

main() {}

// SEPARATE-FILE: opt/demo.chir/placeholder.txt
Keep the CHIR output path of '--emit-chir=opt' as a directory.

// SEPARATE-FILE: opt.cj
// EXEC-PIPE-1: %compiler %diag_json --experimental opt.cj --emit-chir=opt --output-dir ./opt 2>&1 | compare %f
package demo

main() {}

// SEPARATE-FILE: temps/demo.chir/placeholder.txt
Keep the CHIR output path of '--save-temps' as a directory.

// SEPARATE-FILE: temps.cj
// EXEC-PIPE-1: %compiler %diag_json --experimental temps.cj --save-temps ./temps --output-dir ./temps 2>&1 | compare %f
package demo

main() {}
