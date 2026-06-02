// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux) EXEC: %compiler %f %cmp_macro
// The dynamic link library (DLL) generation in Windows needs to depend on all the dynamic link libraries. 
// This test case is not supported in Windows because the information about 'ffiOHOSAceFrameworkCJMotionCJMotion1' is missing.

@C
public struct CJSpringProperty {
    public CJSpringProperty(
        public let mass: Float64,
        public let stiffness: Float64,
        public let damping: Float64
    ) {}
}

@FastNative
foreign func ffiOHOSAceFrameworkCJMotionCJMotion1(start: Float64, end: Float64, velocity: Float64,
    springProp: CJSpringProperty): Int64

func doSth(start: Float64, end: Float64, velocity: Float64, springProp: CJSpringProperty) {
    unsafe {
        ffiOHOSAceFrameworkCJMotionCJMotion1(start, end, velocity, springProp)
    }
}

main() {
    let spring = CJSpringProperty(1.0, 1.0, 1.0)
    doSth(1.0, 1.0, 1.0, spring)
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
