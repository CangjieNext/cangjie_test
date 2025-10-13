// DEPENDENCE: %n/
// EXEC: %mkdir build build/a build/b build/c
// EXEC: %compiler -p %n/a --output-dir build/a %incrementalCompile -Woff unused --output-type=staticlib -o liba.%lib_extension
// EXEC: %compiler --import-path build/a -p %n/b --output-dir build/b %incrementalCompile -Woff unused --output-type=staticlib -o libb.%lib_extension
// EXEC: %compiler --import-path build/a --import-path build/b -p %n/c --output-dir build/c %incrementalCompile -Woff unused --output-type=staticlib -o libc.%lib_extension
// EXEC: %rmfile %n/a/main.cj
// EXEC: %move %n/a/main.new %n/a/main.cj
// EXEC: %compiler -p %n/a --output-dir build/a %incrementalCompile -Woff unused --output-type=staticlib -o liba.%lib_extension 2>&1 | compare %n/a/main.cj
// EXEC: %compiler --import-path build/a -p %n/b --output-dir build/b %incrementalCompile -Woff unused --output-type=staticlib -o libb.%lib_extension 2>&1 | compare %n/b/main.cj
// EXEC: %compiler --import-path build/a --import-path build/b -p %n/c --output-dir build/c %incrementalCompile -Woff unused --output-type=staticlib -o libc.%lib_extension 2>&1 | compare %n/b/main.cj


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
