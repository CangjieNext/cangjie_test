/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

type t1 = Int64

type t2 = t1

type t3 = t2

type t4 = t3

type t5 = t4

type t6 = t5

type t7 = t6

type t8 = t7

type t9 = t8

type t10 = t9

type t11 = t10

type t12 = t11

type t13 = t12

type t14 = t13

type t15 = t14

type t16 = t15

type t17 = t16

type t18 = t17

type t19 = t18

type t20 = t19

type t21 = t20

type t22 = t21

type t23 = t22

type t24 = t23

type t25 = t24

type t26 = t25

type t27 = t26

type t28 = t27

type t29 = t28

type t30 = t29

type t31 = t30

type t32 = t31

type t33 = t32

type t34 = t33

type t35 = t34

type t36 = t35

type t37 = t36

type t38 = t37

type t39 = t38

type t40 = t39

type t41 = t40

type t42 = t41

type t43 = t42

type t44 = t43

type t45 = t44

type t46 = t45

type t47 = t46

type t48 = t47

type t49 = t48

type t50 = t49

type t51 = t50

type t52 = t51

type t53 = t52

type t54 = t53

type t55 = t54

type t56 = t55

type t57 = t56

type t58 = t57

type t59 = t58

type t60 = t59

type t61 = t60

type t62 = t61

type t63 = t62

type t64 = t63

type t65 = t64

type t66 = t65

type t67 = t66

type t68 = t67

type t69 = t68

type t70 = t69

type t71 = t70

type t72 = t71

type t73 = t72

type t74 = t73

type t75 = t74

type t76 = t75

type t77 = t76

type t78 = t77

type t79 = t78

type t80 = t79

type t81 = t80

type t82 = t81

type t83 = t82

type t84 = t83

type t85 = t84

type t86 = t85

type t87 = t86

type t88 = t87

type t89 = t88

type t90 = t89

type t91 = t90

type t92 = t91

type t93 = t92

type t94 = t93

type t95 = (t94)

type t96 = Array<t95>

type t97 = t96

type t98 = (t97, t97)

type t99 = () -> t98

type t100 = A<t99>

type TI = I

var d = 1

interface I {
    static prop i: Int64 {
        get() {
            d
        }
    }
}

extend t95 <: TI {}

class A<T> {
    public var i: T
    public A(a: T) {
        this.i = a
    }
}

func a() {
    var a: t98 = ([t95.i, 2], [t95.i + 2, 4])
    return a
}

main(): Int64 {
    var a: t99 = t100(a).i
    if (a()[0][0] == t95.i && a()[0][1] == 2 && a()[1][0] == 3 && a()[1][1] == 4) {
        return 0
    } else {
        return 1
    }
}
