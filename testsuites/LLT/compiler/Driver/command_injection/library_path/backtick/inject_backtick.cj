// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) DEPENDENCE: pkg
// (CJNATIVE and not Windows) EXEC: rm -rf \''`touch "OOPS_INJECTION!"`'
// (CJNATIVE and not Windows) EXEC: mkdir \''`touch "OOPS_INJECTION!"`'
// (CJNATIVE and not Windows) EXEC: cd \''`touch "OOPS_INJECTION!"`' && %compiler %verbose_opt %pkg_opt ../pkg %compile_lib_opt
// (CJNATIVE and not Windows) EXEC: LIBRARY_PATH=\''`touch "OOPS_INJECTION!"`':$LIBRARY_PATH CANGJIE_PATH=\''`touch "OOPS_INJECTION!"`':$CANGJIE_PATH %compiler %verbose_opt %f -lpkg
// (CJNATIVE and not Windows) EXEC: ls OOPS* | compare %f
// (CJNATIVE and not Windows) ASSERT: scan-not OOPS_INJECTION!

internal import pkg.*

main() {
    PrintHello()
    return 0
}
