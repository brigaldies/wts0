package com.infiniteintelligence.wts.threat

class Threat {

    ThreatTypeCode threatTypeCode // e.g., Hail
    ThreatSeverityCode threatSeverityCode // e.g., Warning, Alert
    Date dateCreated // When the threat is identified or predicted
    Date dateBegin // When the threat starts
    Date dateEnd  // When the threat ends

    static constraints = {
    }
}
