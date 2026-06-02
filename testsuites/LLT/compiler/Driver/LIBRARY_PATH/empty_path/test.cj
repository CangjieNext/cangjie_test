// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) DEPENDENCE: ./pkg
// (CJNATIVE) EXEC: %compiler %pkg_opt ./pkg %compile_lib_opt -o ./pkg/libmylib.a
// (CJNATIVE and not Windows) EXEC: LIBRARY_PATH=:./pkg:$LIBRARY_PATH %compiler %f --import-path=pkg -lmylib -o %output
// (CJNATIVE and Windows) EXEC: set LIBRARY_PATH=.\pkg && %compiler %f --import-path=pkg -lmylib -o %output -V
// (CJNATIVE) EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// (CJNATIVE) ASSERT: scan Hello world.

internal import whatever.*

main() {
    PrintMe()
}
