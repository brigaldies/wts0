package com.infiniteintelligence.wts.threat

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class ThreatController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Threat.list(params), model:[threatInstanceCount: Threat.count()]
    }

    def show(Threat threatInstance) {
        respond threatInstance
    }

    def create() {
        respond new Threat(params)
    }

    @Transactional
    def save(Threat threatInstance) {
        if (threatInstance == null) {
            notFound()
            return
        }

        if (threatInstance.hasErrors()) {
            respond threatInstance.errors, view:'create'
            return
        }

        threatInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'threat.label', default: 'Threat'), threatInstance.id])
                redirect threatInstance
            }
            '*' { respond threatInstance, [status: CREATED] }
        }
    }

    def edit(Threat threatInstance) {
        respond threatInstance
    }

    @Transactional
    def update(Threat threatInstance) {
        if (threatInstance == null) {
            notFound()
            return
        }

        if (threatInstance.hasErrors()) {
            respond threatInstance.errors, view:'edit'
            return
        }

        threatInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Threat.label', default: 'Threat'), threatInstance.id])
                redirect threatInstance
            }
            '*'{ respond threatInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Threat threatInstance) {

        if (threatInstance == null) {
            notFound()
            return
        }

        threatInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Threat.label', default: 'Threat'), threatInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'threat.label', default: 'Threat'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
