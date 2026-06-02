/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not MAC) EXEC: %compiler %cmp_opt %f -o %output
// (not Windows and not MAC and not OHOS) RUN-EXEC-PIPE: %export cjStackSize=64kb && %run %run_opt %output %run_args 2>&1 | compare %f
// (Windows and not MAC and not OHOS) RUN-EXEC-PIPE: %export cjStackSize=128kb && %run %run_opt %output %run_args 2>&1 | compare %f
// (not MAC) ASSERT: scan-not error! bug!

foreign func CJ_CJThreadStackSizeGet(): UInt64

struct TestStruct {
    var a = 1
    var b = 2
    var c = 3
    var d = 4
}

func my_test_func(x: Int64, struct_input: TestStruct): Unit {
    if (x > 1000000) {
        return
    } else {
        if (struct_input.a != 1 || struct_input.b != 2 || struct_input.c != 3 || struct_input.d != 4) {
            println("error! bug!")
        }
        my_test_func(x + struct_input.a, struct_input)
    }
}

main() {
    let ret1 = unsafe { CJ_CJThreadStackSizeGet() }
    if (ret1 != 65536 && ret1 != 131072) {
        return 1
    }
    let ts = TestStruct()
    my_test_func(0, ts)
    let ret2 = unsafe { CJ_CJThreadStackSizeGet() }
    print(ret2)
    if (ret2 % ret1 != 0) {
        return 1
    }
    return 0
}
