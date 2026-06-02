// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
package a


@C
public func A(){
    print("here from imported A")
}


public var lambdaA: CFunc<()->Unit> = { =>
    print("here from imported lambdaA")
}

@C
public func B(a: CPointer<UInt8>): CPointer<UInt8>{
    print("here from imported B")
    a
}

public var lambdaB: CFunc<(CPointer<UInt8>)->CPointer<UInt8>> = { a: CPointer<UInt8> =>
    print("here from imported lambdaB")
    a
}

@C
public func C(a: CString): CString{
    print("here from imported C")
    a
}

public var lambdaC: CFunc<(CString)->CString> = { a: CString =>
    print("here from imported lambdaC")
    a
}