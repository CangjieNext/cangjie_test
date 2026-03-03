package demo.utils

import std.time.*

public func generateId(): String {
    return "ID_" + DateTime.now().toString()
}