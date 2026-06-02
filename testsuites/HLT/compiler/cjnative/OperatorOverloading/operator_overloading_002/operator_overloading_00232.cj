/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

struct R{
    public operator func ?:(inputB:R,inputC:R):Int64{ 
        return 1
    }
}

class C{
    public operator func ?:(inputB:C,inputC:C):Int64{ 
        return 10
    }
}


interface I{
    operator func ?:(inputB:I,inputC:I):Int64{ 
        return 100
    }
}

class A <: I{}

main():Int64{
    var a : I = A()
    var c = C()
    var r = R()
    return (if(a){a}else{a})+(if(c){c}else{c})+(if(r){r}else{r})-111
}
// ASSERT: scan parse_invalid_overloaded_operator
// ASSERT: scan parse_expected_lt_paren
// ASSERT: scan parse_expected_decl
// ASSERT: scan parse_expected_character
