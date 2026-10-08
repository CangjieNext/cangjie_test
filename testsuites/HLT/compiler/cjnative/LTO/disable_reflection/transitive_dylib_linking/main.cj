// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 场景：LTO 下传递 dylib 构建（liba.so 通过 libb.bc 输入包含 libb 代码）
// 验证点：
//   1) libb 先编译为 staticlib (.bc)，liba 编译为 dylib 时直接传入 libb.bc 解析 import libb
//   2) dylib 编译走 LTO 管线（llvm-link/llvm-lto/opt/lld）
//   3) exe 通过 -L./-la 链接 liba.so，导入 liba 包
//   4) 跨包函数/struct 调用运行结果正确
// (target_linux | target_android | target_ohos) DEPENDENCE: liba.cj libb.cj
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full libb.cj -o libb.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt --lto=full liba.cj libb.bc --output-type=dylib -o liba.%dylib_suffix -V 2>&1 | compare %f
// (target_linux | target_android | target_ohos) ASSERT: regex (llvm-link|llvm-lto|opt|lld)
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt --lto=full %f -L. -la -o %output
// (target_linux | target_android | target_ohos) RUN-EXEC: %run %run_opt %output %run_args

package tmp_test

import liba

main(): Int64 {
    let s = liba.greetA()
    if (s != "liba+libb") {
        return 1
    }
    if (liba.wrapB(21) != 42) {
        return 2
    }
    return 0
}