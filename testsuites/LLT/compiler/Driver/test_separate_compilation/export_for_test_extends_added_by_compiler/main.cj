// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./pkg
// DEPENDENCE: ./pkg_test
// (Linux) EXEC: %mkdir build
// (Linux) EXEC: %compiler %cmp_opt -p pkg -Woff=all --mock=off --export-for-test %compile_lib_opt --output p1.%middle
// (Linux) EXEC: nm p1.%middle 2>&1 | compare %f
// (Linux) ASSERT: scan-not T _CNatXRNat5ArrayIcEeqHY1_
