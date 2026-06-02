// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %enableCompileDebug -Woff unused %f %diag_json -o %n.%suffix 2>&1 | compare %f

func Int8Div() {
    var a: Int8 = -126
    var b: Int8 = 0
    var c = a / b;
    print("Int8Div:" + c.toString() + "\n")
}

func Int8Rem() {
    var a: Int8 = -126
    var b: Int8 = 0
    var c = a % b;
    print("Int8Rem:" + c.toString() + "\n")
}

func Int16Div() {
    var a: Int16 = -126
    var b: Int16 = 0
    var c = a / b;
    print("Int16Div:" + c.toString() + "\n")
}

func Int16Rem() {
    var a: Int16 = -126
    var b: Int16 = 0
    var c = a % b;
    print("Int16Rem:" + c.toString() + "\n")
}

func Int32Div() {
    var a: Int32 = -126
    var b: Int32 = 0
    var c = a / b;
    print("Int32Div:" + c.toString() + "\n")
}

func Int32Rem() {
    var a: Int32 = -126
    var b: Int32 = 0
    var c = a % b;
    print("Int32Rem:" + c.toString() + "\n")
}

func Int64Div() {
    var a: Int64 = -126
    var b: Int64 = 0
    var c = a / b;
    print("Int64Div:" + c.toString() + "\n")
}

func Int64Rem() {
    var a: Int64 = -126
    var b: Int64 = 0
    var c = a % b;
    print("Int64Rem:" + c.toString() + "\n")
}

func UInt8Div() {
    var a: UInt8 = 126
    var b: UInt8 = 0
    var c = a / b;
    print("UInt8Div:" + c.toString() + "\n")
}

func UInt8Rem() {
    var a: UInt8 = 126
    var b: UInt8 = 0
    var c = a % b;
    print("UInt8Rem:" + c.toString() + "\n")
}

func UInt16Div() {
    var a: UInt16 = 126
    var b: UInt16 = 0
    var c = a / b;
    print("UInt16Div:" + c.toString() + "\n")
}

func UInt16Rem() {
    var a: UInt16 = 126
    var b: UInt16 = 0
    var c = a % b;
    print("UInt16Rem:" + c.toString() + "\n")
}

func UInt32Div() {
    var a: UInt32 = 126
    var b: UInt32 = 0
    var c = a / b;
    print("UInt32Div:" + c.toString() + "\n")
}

func UInt32Rem() {
    var a: UInt32 = 126
    var b: UInt32 = 0
    var c = a % b;
    print("UInt32Rem:" + c.toString() + "\n")
}

func UInt64Div() {
    var a: UInt64 = 126
    var b: UInt64 = 0
    var c = a / b;
    print("UInt64Div:" + c.toString() + "\n")
}

func UInt64Rem() {
    var a: UInt64 = 126
    var b: UInt64 = 0
    var c = a % b;
    print("UInt64Rem:" + c.toString() + "\n")
}

func TryInt8Div() {
    try {
        Int8Div()
    } catch (e: ArithmeticException) {
        print("Int8Div:Div 0\n");
    }
}

func TryInt8Rem() {
    try {
        Int8Rem()
    } catch (e: ArithmeticException) {
        print("Int8Rem:Div 0\n");
    }
}

func TryInt16Div() {
    try {
        Int16Div()
    } catch (e: ArithmeticException) {
        print("Int16Div:Div 0\n");
    }
}

func TryInt16Rem() {
    try {
        Int16Rem()
    } catch (e: ArithmeticException) {
        print("Int16Rem:Div 0\n");
    }
}

func TryInt32Div() {
    try {
        Int32Div()
    } catch (e: ArithmeticException) {
        print("Int32Div:Div 0\n");
    }
}

func TryInt32Rem() {
    try {
        Int32Rem()
    } catch (e: ArithmeticException) {
        print("Int32Rem:Div 0\n");
    }
}

func TryInt64Div() {
    try {
        Int64Div()
    } catch (e: ArithmeticException) {
        print("Int64Div:Div 0\n");
    }
}

func TryInt64Rem() {
    try {
        Int64Rem()
    } catch (e: ArithmeticException) {
        print("Int64Rem:Div 0\n");
    }
}

func TryUInt8Div() {
    try {
        UInt8Div()
    } catch (e: ArithmeticException) {
        print("UInt8Div:Div 0\n");
    }
}

func TryUInt8Rem() {
    try {
        UInt8Rem()
    } catch (e: ArithmeticException) {
        print("UInt8Rem:Div 0\n");
    }
}

func TryUInt16Div() {
    try {
        UInt16Div()
    } catch (e: ArithmeticException) {
        print("UInt16Div:Div 0\n");
    }
}

func TryUInt16Rem() {
    try {
        UInt16Rem()
    } catch (e: ArithmeticException) {
        print("UInt16Rem:Div 0\n");
    }
}

func TryUInt32Div() {
    try {
        UInt32Div()
    } catch (e: ArithmeticException) {
        print("UInt32Div:Div 0\n");
    }
}

func TryUInt32Rem() {
    try {
        UInt32Rem()
    } catch (e: ArithmeticException) {
        print("UInt32Rem:Div 0\n");
    }
}

func TryUInt64Div() {
    try {
        UInt64Div()
    } catch (e: ArithmeticException) {
        print("UInt64Div:Div 0\n");
    }
}

func TryUInt64Rem() {
    try {
        UInt64Rem()
    } catch (e: ArithmeticException) {
        print("UInt64Rem:Div 0\n");
    }
}

main(): Int64 {
    TryInt8Div()
    TryInt8Rem()
    TryInt16Div()
    TryInt16Rem()
    TryInt32Div()
    TryInt32Rem()
    TryInt64Div()
    TryInt64Rem()

    TryUInt8Div()
    TryUInt8Rem()
    TryUInt16Div()
    TryUInt16Rem()
    TryUInt32Div()
    TryUInt32Rem()
    TryUInt64Div()
    TryUInt64Rem()

    return 0
}
// ASSERT: scan chir_divisor_is_zero
