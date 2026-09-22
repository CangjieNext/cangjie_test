package cjworld

import cjbase.*

@C 
func cangjieMain() {
    let cc = Base().self()
    if (cc is Base) {
        return 0
    } else {
        return 1
    }
}
