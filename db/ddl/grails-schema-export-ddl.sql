
    drop table action cascade constraints;

    drop table action_status_code cascade constraints;

    drop table activity cascade constraints;

    drop table activity_type_code cascade constraints;

    drop table asset cascade constraints;

    drop table asset_type_code cascade constraints;

    drop table incident cascade constraints;

    drop table incident_status_audit cascade constraints;

    drop table incident_status_code cascade constraints;

    drop table incident_team_member cascade constraints;

    drop table media cascade constraints;

    drop table organization cascade constraints;

    drop table person cascade constraints;

    drop table person_asset_aff_type_code cascade constraints;

    drop table person_asset_affiliation cascade constraints;

    drop table principal_role cascade constraints;

    drop table role cascade constraints;

    drop table threat cascade constraints;

    drop table threat_severity_code cascade constraints;

    drop table threat_type_code cascade constraints;

    drop table users cascade constraints;

    drop sequence hibernate_sequence;

    create table action (
        id number(19,0) not null,
        version number(19,0) not null,
        assigned_user_id number(19,0) not null,
        incident_id number(19,0) not null,
        status_cd varchar2(255 char) not null,
        step_number number(10,0) not null,
        primary key (id)
    );

    create table action_status_code (
        code varchar2(255 char) not null,
        primary key (code)
    );

    create table activity (
        id number(19,0) not null,
        version number(19,0) not null,
        activity_type_code_id number(19,0) not null,
        primary key (id)
    );

    create table activity_type_code (
        id number(19,0) not null,
        version number(19,0) not null,
        primary key (id)
    );

    create table asset (
        id number(19,0) not null,
        version number(19,0) not null,
        asset_type_cd varchar2(255 char) not null,
        organization_id number(19,0) not null,
        primary key (id)
    );

    create table asset_type_code (
        code varchar2(255 char) not null,
        primary key (code)
    );

    create table incident (
        id number(19,0) not null,
        version number(19,0) not null,
        asset_id number(19,0) not null,
        date_created timestamp not null,
        last_updated timestamp not null,
        lead_id number(19,0) not null,
        status_cd varchar2(255 char) not null,
        threat_id number(19,0) not null,
        primary key (id)
    );

    create table incident_status_audit (
        id number(19,0) not null,
        version number(19,0) not null,
        date_created timestamp not null,
        incident_id number(19,0) not null,
        status_cd varchar2(255 char) not null,
        primary key (id)
    );

    create table incident_status_code (
        code varchar2(255 char) not null,
        primary key (code)
    );

    create table incident_team_member (
        id number(19,0) not null,
        version number(19,0) not null,
        incident_id number(19,0) not null,
        user_id number(19,0) not null,
        primary key (id)
    );

    create table media (
        id number(19,0) not null,
        version number(19,0) not null,
        incident_id number(19,0) not null,
        primary key (id)
    );

    create table organization (
        id number(19,0) not null,
        version number(19,0) not null,
        primary key (id)
    );

    create table person (
        id number(19,0) not null,
        version number(19,0) not null,
        organization_id number(19,0) not null,
        primary key (id)
    );

    create table person_asset_aff_type_code (
        code varchar2(255 char) not null,
        primary key (code)
    );

    create table person_asset_affiliation (
        id number(19,0) not null,
        version number(19,0) not null,
        affiliation_type_cd varchar2(255 char) not null,
        asset_id number(19,0) not null,
        person_id number(19,0) not null,
        primary key (id)
    );

    create table principal_role (
        role_id number(19,0) not null,
        principal_id number(19,0) not null,
        primary key (role_id, principal_id)
    );

    create table role (
        id number(19,0) not null,
        version number(19,0) not null,
        authority varchar2(255 char) not null,
        primary key (id)
    );

    create table threat (
        id number(19,0) not null,
        version number(19,0) not null,
        date_begin timestamp not null,
        date_created timestamp not null,
        date_end timestamp not null,
        threat_severity_cd varchar2(255 char) not null,
        threat_type_cd varchar2(255 char) not null,
        primary key (id)
    );

    create table threat_severity_code (
        code varchar2(255 char) not null,
        primary key (code)
    );

    create table threat_type_code (
        code varchar2(255 char) not null,
        primary key (code)
    );

    create table users (
        id number(19,0) not null,
        version number(19,0) not null,
        account_expired number(1,0) not null,
        account_locked number(1,0) not null,
        enabled number(1,0) not null,
        "password" varchar2(255 char) not null,
        password_expired number(1,0) not null,
        username varchar2(255 char) not null,
        class varchar2(255 char) not null,
        date_created timestamp,
        email varchar2(255 char),
        first_name varchar2(255 char),
        last_name varchar2(255 char),
        last_updated timestamp,
        organization_id number(19,0),
        phone varchar2(255 char),
        report_id number(19,0),
        primary key (id)
    );

    alter table role 
        add constraint UK_irsamgnera6angm0prq1kemt2  unique (authority);

    alter table users 
        add constraint UK_r43af9ap4edm43mmtq01oddj6  unique (username);

    alter table action 
        add constraint FK_9ng2eg9bc2mrp3r1j8m6ono7m 
        foreign key (assigned_user_id) 
        references users;

    alter table action 
        add constraint FK_if6t47wj4va8yt9rkgewq8hq3 
        foreign key (incident_id) 
        references incident;

    alter table action 
        add constraint FK_qv6gjqugq0879c3wv80e4eko4 
        foreign key (status_cd) 
        references action_status_code;

    alter table activity 
        add constraint FK_71whvshwnbmpcvmb63iyxi63i 
        foreign key (activity_type_code_id) 
        references activity_type_code;

    alter table asset 
        add constraint FK_ntw74wig53rlyqf1fq2schx6d 
        foreign key (asset_type_cd) 
        references asset_type_code;

    alter table asset 
        add constraint FK_lec5tqsfdjffip8xtnkec7q4h 
        foreign key (organization_id) 
        references organization;

    alter table incident 
        add constraint FK_q91mfhs5c3tkqk5uibtouebmi 
        foreign key (asset_id) 
        references asset;

    alter table incident 
        add constraint FK_536kj022cy6f755krmf9ldtjn 
        foreign key (lead_id) 
        references users;

    alter table incident 
        add constraint FK_thwwxuh9rmo4p2s2w9d993uub 
        foreign key (status_cd) 
        references incident_status_code;

    alter table incident 
        add constraint FK_s0wbgu5wm7w2txaradjngj357 
        foreign key (threat_id) 
        references threat;

    alter table incident_status_audit 
        add constraint FK_nd67dd9a7d61rjorakxd8ysjt 
        foreign key (incident_id) 
        references incident;

    alter table incident_status_audit 
        add constraint FK_epc40m6h7pvqh6ktvtry30mif 
        foreign key (status_cd) 
        references incident_status_code;

    alter table incident_team_member 
        add constraint FK_3gpn4dr6jalkwou6cx8t5sils 
        foreign key (incident_id) 
        references incident;

    alter table incident_team_member 
        add constraint FK_15q302x06dghncjpj8p2i0k2q 
        foreign key (user_id) 
        references users;

    alter table media 
        add constraint FK_mk6lcbj8x44138oeomx6ke4l9 
        foreign key (incident_id) 
        references incident;

    alter table person 
        add constraint FK_7ke7brn3n3yphc5rahys9t906 
        foreign key (organization_id) 
        references organization;

    alter table person_asset_affiliation 
        add constraint FK_jxmsrk3tavog27u86bltvrewa 
        foreign key (affiliation_type_cd) 
        references person_asset_aff_type_code;

    alter table person_asset_affiliation 
        add constraint FK_px30314pmibmi9w59abjc7nan 
        foreign key (asset_id) 
        references asset;

    alter table person_asset_affiliation 
        add constraint FK_pkhj5bqft4ge996ian0fn1jl6 
        foreign key (person_id) 
        references person;

    alter table principal_role 
        add constraint FK_5xh09uyijeuevdjh1ix7c4cbo 
        foreign key (role_id) 
        references role;

    alter table principal_role 
        add constraint FK_iggr91r57axokvewewthsmo6c 
        foreign key (principal_id) 
        references users;

    alter table threat 
        add constraint FK_8uf4gbyj0qgj9dd4jw4gt66q 
        foreign key (threat_severity_cd) 
        references threat_severity_code;

    alter table threat 
        add constraint FK_6atvfwm93du9umc219d3xydn1 
        foreign key (threat_type_cd) 
        references threat_type_code;

    alter table users 
        add constraint FK_1dg427qt898j7shqnvv5s617p 
        foreign key (organization_id) 
        references organization;

    alter table users 
        add constraint FK_3jekdk0twsc76ryx3okbax9qn 
        foreign key (report_id) 
        references users;

    create sequence hibernate_sequence;
