package cj_project

import cj_project.c.*
import cj_project.define.*
import pro0.zoo.*

import std.collection.*

public type StdDeps = ArrayList<HashMap<String, Array<String>>>

public class RequiresPackages {
    public var stdDependencies: StdDeps = StdDeps()
}

main(): Int64 {
    println("hello world")
    cfunc()
    let res = z + 1
    let x = 3
    let y = 2
    @dprint(x)
    @dprint(x + y)
    println("hello world2")
    return 0
}