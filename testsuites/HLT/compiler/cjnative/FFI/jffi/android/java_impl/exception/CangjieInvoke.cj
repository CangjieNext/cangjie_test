/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// (Android) DEPENDENCE: com MainInstrumentedTest.java 
// (Android) EXEC: python3 %java_interop_setup
// (Android) EXEC: %javac com/*.java %java_interop_template/app/src/main/java/com/hello/world/cangjieinterophelloworld/Logger.java
// (Android) EXEC: %java %java_mirror_gen com.JavaClass
// (Android) EXEC: %java %java_mirror_gen com.JavaClassThatImplementsJavaInterface
// (Android) EXEC: %java %java_mirror_gen com.JavaEnum
// (Android) EXEC: %java %java_mirror_gen com.JavaInterface
// (Android) EXEC: %compiler %cmp_opt %compile_dylib_opt %jffi_link %f logger.cj UNNAMED/src/*.cj --experimental --enable-interop-cjmapping --output-javagen-dir=%java_interop_template/app/src/main/java/UNNAMED
// (Android) EXEC: python3 %java_interop_runner --test-entry=MainInstrumentedTest.java --java-source-root=com

package UNNAMED

import interoplib.interop.*
import java.lang.*

public func divide(a: Int64, b: Int64): Int64 {
    a / b
}

public func access(arr: Array<Int64>, index: Int64): Int64 {
    arr[index]
}

public func throwing(kind: Int8): Unit {
    if (kind == 0) {
    // no exception
    } else if (kind == 1) {
        throw Exception("my message")
    } else if (kind == 2) {
        throw Exception()
    } else if (kind == 3) {
        divide(1, 0)
    } else if (kind == 4) {
        access([1, 2, 3], 10)
    } else {
        JavaClass(0)
    }
}

// 仓颉侧调用JavaMirror class时，Java侧抛出异常，仓颉侧捕获
public func testClass(): Unit {
    for (kind in 1i8..5i8) {
        try {
            JavaClass(kind)
        } catch (e: Exception) {
            Logger.println("testClass e = ${e}")
        }
    }
    let instance = JavaClass(0)
    for (kind in 1i8..5i8) {
        try {
            instance.instanceMethod(kind)
        } catch (e: Exception) {
            Logger.println("testClass e = ${e}")
        }
    }
    for (kind in 1i8..5i8) {
        try {
            JavaClass.staticMethod(kind)
        } catch (e: Exception) {
            Logger.println("testClass e = ${e}")
        }
    }
}

@JavaImpl
public class CangjieClass {
    public init(kind: Int8) {
        throwing(kind)
    }
    public static func staticFunction(kind: Int8): Unit {
        throwing(kind)
    }
    public func instanceFunction(kind: Int8, deeper: Int8): Unit {
        if (deeper == 0) {
            throwing(kind)
        } else if (deeper == 1) {
            testClass()
            // testEnum()
            // testInterface()
            // testStruct()
        }
    }
}

public struct CangjieStruct {
    public init(kind: Int8) {
        throwing(kind)
    }
    public static func staticFunction(kind: Int8): Unit {
        throwing(kind)
    }
    public func instanceFunction(kind: Int8, deeper: Int8): Unit {
        if (deeper == 0) {
            throwing(kind)
        } else if (deeper == 1) {
            testClass()
            // testEnum()
            // testInterface()
            // testStruct()
        }
    }
}

public enum CangjieEnum {
    | A
    public static func staticFunction(kind: Int8): Unit {
        throwing(kind)
    }
    public func instanceFunction(kind: Int8, deeper: Int8): Unit {
        if (deeper == 0) {
            throwing(kind)
        } else if (deeper == 1) {
            testClass()
            // testEnum()
            // testInterface()
            // testStruct()
        }
    }
}

public interface CangjieInterface {
    func instanceFunction(kind: Int8, deeper: Int8): Unit {
        if (deeper == 0) {
            throwing(kind)
        } else if (deeper == 1) {
            testClass()
            // testEnum()
            // testInterface()
            // testStruct()
        }
    }
}
