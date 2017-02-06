package com.infiniteintelligence.wts.incident

import com.infiniteintelligence.wts.organization.Asset
import com.infiniteintelligence.wts.security.User
import com.infiniteintelligence.wts.threat.Threat

class Incident {

    Threat threat
    Asset asset
    User lead
    IncidentStatusCode incidentStatusCode
    Date dateCreated
    Date lastUpdated

    static constraints = {
    }
}
