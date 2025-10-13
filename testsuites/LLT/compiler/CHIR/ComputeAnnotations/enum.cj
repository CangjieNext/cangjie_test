// EXEC-PIPE: %compiler %f --debug-annotations | compare %f
main() {}
public enum E {
    E1 | E2(Int) | E3(Object)
}

@Annotation public class CA {
    public const CA(let a: E) {}
}

@!CA[E1]
@CA[E1]
@!CA[E2(3)]
func foo() {}

@Annotation public class CB {
    public const CB(let a: EV) {}
}
public enum EV {
    EV1| EV2
}

@!CB[EV1] @!CB[EV2]var b=3


@Annotation public class CC {
    public const CC(let a: EO) {}
}
public enum EO {
    EO1 | EO2(Int)
}

@!CC[EO1] @!CC[EO2(3)]
class MM {}
@CC[EO1] @CC[EO2(3)]
class MN {}


/* SCAN
_CN7default3fooHv:
    CA{"a": E{0}}
    CA{"a": E{1,3}}
_CN7default1bE:
    CB{"a": 0}
    CB{"a": 1}
_CN7default2MME:
    CC{"a": EO{0}}
    CC{"a": EO{1,3}}
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
