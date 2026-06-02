// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: sancov.h sancov.cpp
// EXEC: %clang++ -c -fPIC %stdc++_opt sancov.cpp -o sancov.o
// EXEC: %compiler --sanitizer-coverage-level=1  --sanitizer-coverage-stack-depth sancov.o %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan '--sanitizer-coverage-level' is illegal here
// EXEC: %compiler --sanitizer-coverage-level=0 --sanitizer-coverage-inline-bool-flag sancov.o %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan '--sanitizer-coverage-level' is illegal here

main() {
    0
}
