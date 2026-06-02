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

{% if Dst == "void" %}
static {{Src}} value = 0;
{% else %}
static {{Dst}} value = {{Val}};
{% endif %}

{{Src}} *func_01() {
{% if Dst == "void" %}
    return ({{Src}} *)&value;
{% else %}
    return &value;
{% endif %}
}

_Bool func_02({{Src}} *ptr) {
    return ptr == &value;
}