/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <math.h>
#include <stdint.h>
#include <stddef.h>

{% if CType == "void" %}
static int32_t value = 0;
{% else %}
static {{CType}} value = {{CVal}};
{% endif %}

static {{CType}} *ptr = &value;

{{CType}} **func_01() {
    return &ptr;
}

_Bool func_02({{CType}} *ptr) {
    return ptr == &value;
}
