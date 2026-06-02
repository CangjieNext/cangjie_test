// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL:
// ERRCHECK: %compiler %f -o %output %diag_json

foreign func fopen(name: CString, flags: CString): CPointer<Unit>;

foreign var stdout: CPointer<Unit>;

main(): Unit {
    unsafe {
        let file = fopen(LibC.mallocCString("non_exist_file"), LibC.mallocCString("r"))
        if (file.isNull()) {
            print("no file")
        }
    }
}
// ASSERT: scan sema_native_var_error
