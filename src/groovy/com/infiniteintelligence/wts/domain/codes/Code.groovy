package com.infiniteintelligence.wts.domain.codes

import groovy.transform.EqualsAndHashCode

/**
 * Base class to share fields and constraints for code tables composed of a code and name.
 */
@EqualsAndHashCode(includes = ['code'])
abstract class Code implements Comparable {

    String code

    static mapping = {
        id name: 'code', generator: 'assigned' // 'code' is the table's primary key
        version false
        cache usage: 'read-only'
        code updateable: false
    }

    static constraints = {
        code blank: false
    }

    int compareTo(Object o) {
        return code.compareTo(o.code)
    }

    String toString() {
        code
    }
}