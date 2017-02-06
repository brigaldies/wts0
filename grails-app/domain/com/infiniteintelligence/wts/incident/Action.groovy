package com.infiniteintelligence.wts.incident

import com.infiniteintelligence.wts.security.User

class Action {

    Incident incident
    Integer stepNumber
    ActionStatusCode actionStatusCode
    User assigned

    static constraints = {
    }
}
