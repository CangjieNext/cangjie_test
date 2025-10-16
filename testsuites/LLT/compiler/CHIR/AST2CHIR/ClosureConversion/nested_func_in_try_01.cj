// LEVEL: 0
// (DEBUG_OPTION) EXEC: %compiler %f %dumpCHIRDebug -o %output
// (DEBUG_OPTION) EXEC-PIPE-0: %run %run_opt %output
// (CJNATIVE and not Windows and DEBUG_OPTION) EXEC-PIPE-0: %cat %n\_CHIR2_Debug/[0-9]*\_ClosureConversion.chirtxt | compare %f
// (not CJNATIVE and not Windows and DEBUG_OPTION) EXEC-PIPE-0: %cat %n\_CHIR_Debug/[0-9]*\_ClosureConversion.chirtxt | compare %f
// (not Windows and CJNATIVE) ASSERT: scan-1 Func @_CN7default4foo13gooS9a0a0a0a_aEv([readOnly]

// (not Windows and CJNATIVE) ASSERT: scan-1 Func @_CN7default4foo1HvE3gooHv([readOnly]
// (not Windows and CJNATIVE) ASSERT: scan-1 ApplyWithException(ThisType: Class-$ClN7default4foo1HvE3gooHv$0&, @_CCN7default4foo1HvE3gooHv$i,

// (not Windows and CJNATIVE) ASSERT: scan-1 ApplyWithException(ThisType: Class-$ClN7default4foo2HvE3gooHv$0&, @_CCN7default4foo2HvE3gooHv$i,
// (not Windows and CJNATIVE) ASSERT: scan-1 Apply(ThisType: Class-$ClN7default4foo2HvE3gooHv$1&, @_CCN7default4foo2HvE3gooHv$1$i,
// (not Windows and CJNATIVE) ASSERT: scan-1 Apply(ThisType: Class-$ClN7default4foo2HvE3gooHv$2&, @_CCN7default4foo2HvE3gooHv$2$i,
// (not Windows and CJNATIVE) ASSERT: scan-1 Func @_CN7default4foo2HvE3gooHv([readOnly]
// (not Windows and CJNATIVE) ASSERT: scan-1 Func @_CN7default4foo2HvE3gooHv$1([readOnly]
// (not Windows and CJNATIVE) ASSERT: scan-1 Func @_CN7default4foo2HvE3gooHv$2([readOnly]

// (not Windows and CJNATIVE) ASSERT: scan-1 Apply(ThisType: Class-$ClN7default4foo3HvE3gooHv$0&, @_CCN7default4foo3HvE3gooHv$i,
// (not Windows and CJNATIVE) ASSERT: scan-1 Apply(ThisType: Class-$ClN7default4foo3HvE3gooHv$1&, @_CCN7default4foo3HvE3gooHv$1$i,
// (not Windows and CJNATIVE) ASSERT: scan-1 Func @_CN7default4foo3HvE3gooHv([readOnly]
// (not Windows and CJNATIVE) ASSERT: scan-1 Func @_CN7default4foo3HvE3gooHv$1([readOnly]

var a = 1
func foo1() {
    try {
        func goo() { // 闭包之后提升成Func @_CN7default4foo13gooS9a0a0a0a_aEv([readOnly] ...)
            println(1)
        }
    } finally {}
}

func foo2() {
    try {
        a++
        // 从finally中拷贝了func goo() {}，闭包之后提升成Func @_CN7default4foo23gooS9a0b0a0c_bEv([readOnly] ...)
        // 从finally中拷贝了goo()，翻译成Apply(@_CN7default4foo23gooS9a0b0a0c_bEv, ...)
    } catch(_) {
        func goo() { // 闭包之后提升成Func @_CN7default4foo23gooS9a0b0a0b_aEv([readOnly] ...)
            println(1)
        }
        goo() // 翻译成ApplyWithException(@_CN7default4foo23gooS9a0b0a0b_aEv, ...)
    } finally {
        func goo() { // 闭包之后提升成Func @_CN7default4foo23gooS9a0b0a0c_bEv$1([readOnly] ...)
            println(1)
        }
        goo() // 翻译成Apply(@_CN7default4foo23gooS9a0b0a0c_bEv$1, ...)
    }
}

func foo3() {
    try {
        a++
        // 从finally中拷贝了func goo() {}，闭包之后提升成Func @_CN7default4foo33gooS9a0c0a0b_aEv([readOnly] ...)
        // 从finally中拷贝了goo()，翻译成Apply(@_CN7default4foo33gooS9a0c0a0b_aEv, ...)
    } finally {
        func goo() { // 闭包之后提升成Func @_CN7default4foo33gooS9a0c0a0b_aEv$1([readOnly] ...)
            println(1)
        }
        goo() // 翻译成Apply(@_CN7default4foo33gooS9a0c0a0b_aEv$1, ...)
    }
}

main() {
    0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
