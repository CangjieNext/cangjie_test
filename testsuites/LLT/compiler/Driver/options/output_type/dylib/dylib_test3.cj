// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not CJNATIVE) DEPENDENCE: pkg.cj
// (not CJNATIVE) EXEC:%compiler --output-type=staticlib pkg.cj
// (not CJNATIVE) EXEC:%compiler --output-type=dylib pkg.bc 2>&1 | compare %f
// (not CJNATIVE) ASSERT: scan expected at least one source code file when compiling source code

