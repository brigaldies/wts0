dataSource {
    pooled = true
    jmxExport = true
    driverClassName = "oracle.jdbc.OracleDriver"
    url = "jdbc:oracle:thin:@localhost:1521:xe"
    username = "WTS"
    password = "WTS"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
//    cache.region.factory_class = 'org.hibernate.cache.SingletonEhCacheRegionFactory' // Hibernate 3
    cache.region.factory_class = 'org.hibernate.cache.ehcache.SingletonEhCacheRegionFactory' // Hibernate 4
    singleSession = true // configure OSIV singleSession mode
    flush.mode = 'manual' // OSIV session flush mode outside of transactional context
}

// environment specific settings
environments {
    development {
        // Use default settings.
    }
    test {
        // Use default settings.
    }
    production {
        // Use default settings.
    }
}
