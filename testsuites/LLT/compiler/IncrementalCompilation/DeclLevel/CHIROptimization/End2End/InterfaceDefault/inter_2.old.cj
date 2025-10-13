func foo(){
    0
}

public interface I{
    @Frozen
    func f():Int64 {
        return foo()
    }
}

class C <: I{

}

main() {
    return C().f()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
