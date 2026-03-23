// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: ohos/ark_interop/ark_interop.cj
// (LLVM) EXEC-0: %compiler %cmp_opt %compile_lib_opt ohos/ark_interop/ark_interop.cj -o libohos.ark_interop.%middle
package ohos.ark_interop

public class JSContext {
    public init() {}
}

public class JSCallInfo {
    public init() {}
}

public class JSValue {
    public init() {}
}

@Intrinsic
public func getJSLambdaAddr<T>(lambda: T): CPointer<Unit>

// SEPARATE-FILE: main.cj
// (LLVM) EXEC: %compiler %cmp_opt libohos.ark_interop.%middle main.cj -o %output
// (LLVM) EXEC: %frontendCompiler %dump-ir --dump-to-screen %cmp_opt libohos.ark_interop.%middle main.cj 2>&1 | compare %f
// (LLVM) ASSERT: scan-1 call i8* @llvm.cj.get.lambda.addr(i8 addrspace(1)*
import ohos.ark_interop.*

func makeCallbackAddr(): CPointer<Unit> {
    let cb = {ctx: JSContext, info: JSCallInfo =>
        JSValue()
    }
    return getJSLambdaAddr(cb)
}

main() {
    let addr = makeCallbackAddr()
    0
}
