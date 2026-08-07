package missing_import_diagnostic

import dependency_demo.*
import missing.nonexistent.*

main(): Int64 {
    println(value())
    return 0
}
