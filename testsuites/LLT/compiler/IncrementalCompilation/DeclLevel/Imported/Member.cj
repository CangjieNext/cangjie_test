// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %mkdir p
// EXEC: %move %n.old.cj p
// EXEC: %compiler -p p %incrementalCompile -Woff unused --output-type=staticlib -o p.%lib_extension
// EXEC: %compiler p.a %f %incrementalCompile -Woff unused -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile p/%n.old.cj
// EXEC: %move %n.new.cj p/%n.old.cj
// EXEC: %compiler -p p %incrementalCompile -Woff unused --output-type=staticlib -o p.%lib_extension
// EXEC: %compiler p.a %f %incrementalCompile -Woff unused -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan no change

internal import p.*
main(): Int64 {
    0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
