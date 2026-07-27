/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package collections_hashset;

import java.util.Objects;

public class Person {
    private String name;
    private long age;

    public Person(String name, int age) {
        this.name = name;
        this.age = (long) age;
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, age);
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == this) return true;
        if (!(obj instanceof Person)) return false;
        Person other = (Person) obj;
        return Objects.equals(name, other.name) && age == other.age;
    }

    public String toString ()
    {
        return "[" + name + ":" + age + "=" + hashCode() + "]";
    }
}
