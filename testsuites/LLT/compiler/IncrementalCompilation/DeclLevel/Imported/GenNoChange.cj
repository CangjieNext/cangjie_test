// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %mkdir p
// EXEC: %move %n.old.cj p/%n.cj
// EXEC: %compiler -p p --output-type=staticlib -o libp.%lib_extension
// EXEC: %compiler -L. -lp %incrementalCompile %f -o %output
// EXEC: %rmfile p/%n.cj
// EXEC: %move %n.new.cj p/%n.cj
// EXEC: %compiler -L. -lp %incrementalCompile %f -o %output 2>&1 | compare %f
// ASSERT: scan no change

internal import p.*

main(): Unit {}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
