--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-03-15 03:09:14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 226 (class 1259 OID 44087)
-- Name: _adherent_acheteur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._adherent_acheteur (
    acheteur_morale_id bigint NOT NULL,
    acheteur_physique_id bigint NOT NULL,
    adherent_id bigint NOT NULL
);


ALTER TABLE public._adherent_acheteur OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 44092)
-- Name: _adherent_fournisseur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._adherent_fournisseur (
    fournisseur_morale_id bigint NOT NULL,
    fournisseur_physique_id bigint NOT NULL,
    adherent_id bigint NOT NULL
);


ALTER TABLE public._adherent_fournisseur OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 49328)
-- Name: act_ge_bytearray; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_ge_bytearray (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    name_ character varying(255),
    deployment_id_ character varying(64),
    bytes_ bytea,
    generated_ boolean,
    tenant_id_ character varying(64),
    type_ integer,
    create_time_ timestamp without time zone,
    root_proc_inst_id_ character varying(64),
    removal_time_ timestamp without time zone
);


ALTER TABLE public.act_ge_bytearray OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 49323)
-- Name: act_ge_property; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_ge_property (
    name_ character varying(64) NOT NULL,
    value_ character varying(300),
    rev_ integer
);


ALTER TABLE public.act_ge_property OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 49335)
-- Name: act_ge_schema_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_ge_schema_log (
    id_ character varying(64) NOT NULL,
    timestamp_ timestamp without time zone,
    version_ character varying(255)
);


ALTER TABLE public.act_ge_schema_log OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 49686)
-- Name: act_hi_actinst; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_hi_actinst (
    id_ character varying(64) NOT NULL,
    parent_act_inst_id_ character varying(64),
    proc_def_key_ character varying(255),
    proc_def_id_ character varying(64) NOT NULL,
    root_proc_inst_id_ character varying(64),
    proc_inst_id_ character varying(64) NOT NULL,
    execution_id_ character varying(64) NOT NULL,
    act_id_ character varying(255) NOT NULL,
    task_id_ character varying(64),
    call_proc_inst_id_ character varying(64),
    call_case_inst_id_ character varying(64),
    act_name_ character varying(255),
    act_type_ character varying(255) NOT NULL,
    assignee_ character varying(255),
    start_time_ timestamp without time zone NOT NULL,
    end_time_ timestamp without time zone,
    duration_ bigint,
    act_inst_state_ integer,
    sequence_counter_ bigint,
    tenant_id_ character varying(64),
    removal_time_ timestamp without time zone
);


ALTER TABLE public.act_hi_actinst OWNER TO postgres;

--
-- TOC entry 286 (class 1259 OID 49728)
-- Name: act_hi_attachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_hi_attachment (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    user_id_ character varying(255),
    name_ character varying(255),
    description_ character varying(4000),
    type_ character varying(255),
    task_id_ character varying(64),
    root_proc_inst_id_ character varying(64),
    proc_inst_id_ character varying(64),
    url_ character varying(4000),
    content_id_ character varying(64),
    tenant_id_ character varying(64),
    create_time_ timestamp without time zone,
    removal_time_ timestamp without time zone
);


ALTER TABLE public.act_hi_attachment OWNER TO postgres;

--
-- TOC entry 290 (class 1259 OID 49757)
-- Name: act_hi_batch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_hi_batch (
    id_ character varying(64) NOT NULL,
    type_ character varying(255),
    total_jobs_ integer,
    jobs_per_seed_ integer,
    invocations_per_job_ integer,
    seed_job_def_id_ character varying(64),
    monitor_job_def_id_ character varying(64),
    batch_job_def_id_ character varying(64),
    tenant_id_ character varying(64),
    create_user_id_ character varying(255),
    start_time_ timestamp without time zone NOT NULL,
    end_time_ timestamp without time zone,
    removal_time_ timestamp without time zone,
    exec_start_time_ timestamp without time zone
);


ALTER TABLE public.act_hi_batch OWNER TO postgres;

--
-- TOC entry 302 (class 1259 OID 50031)
-- Name: act_hi_caseactinst; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_hi_caseactinst (
    id_ character varying(64) NOT NULL,
    parent_act_inst_id_ character varying(64),
    case_def_id_ character varying(64) NOT NULL,
    case_inst_id_ character varying(64) NOT NULL,
    case_act_id_ character varying(255) NOT NULL,
    task_id_ character varying(64),
    call_proc_inst_id_ character varying(64),
    call_case_inst_id_ character varying(64),
    case_act_name_ character varying(255),
    case_act_type_ character varying(255),
    create_time_ timestamp without time zone NOT NULL,
    end_time_ timestamp without time zone,
    duration_ bigint,
    state_ integer,
    required_ boolean,
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_hi_caseactinst OWNER TO postgres;

--
-- TOC entry 301 (class 1259 OID 50022)
-- Name: act_hi_caseinst; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_hi_caseinst (
    id_ character varying(64) NOT NULL,
    case_inst_id_ character varying(64) NOT NULL,
    business_key_ character varying(255),
    case_def_id_ character varying(64) NOT NULL,
    create_time_ timestamp without time zone NOT NULL,
    close_time_ timestamp without time zone,
    duration_ bigint,
    state_ integer,
    create_user_id_ character varying(255),
    super_case_instance_id_ character varying(64),
    super_process_instance_id_ character varying(64),
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_hi_caseinst OWNER TO postgres;

--
-- TOC entry 285 (class 1259 OID 49721)
-- Name: act_hi_comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_hi_comment (
    id_ character varying(64) NOT NULL,
    type_ character varying(255),
    time_ timestamp without time zone NOT NULL,
    user_id_ character varying(255),
    task_id_ character varying(64),
    root_proc_inst_id_ character varying(64),
    proc_inst_id_ character varying(64),
    action_ character varying(255),
    message_ character varying(4000),
    full_msg_ bytea,
    tenant_id_ character varying(64),
    removal_time_ timestamp without time zone
);


ALTER TABLE public.act_hi_comment OWNER TO postgres;

--
-- TOC entry 306 (class 1259 OID 50074)
-- Name: act_hi_dec_in; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_hi_dec_in (
    id_ character varying(64) NOT NULL,
    dec_inst_id_ character varying(64) NOT NULL,
    clause_id_ character varying(64),
    clause_name_ character varying(255),
    var_type_ character varying(100),
    bytearray_id_ character varying(64),
    double_ double precision,
    long_ bigint,
    text_ character varying(4000),
    text2_ character varying(4000),
    tenant_id_ character varying(64),
    create_time_ timestamp without time zone,
    root_proc_inst_id_ character varying(64),
    removal_time_ timestamp without time zone
);


ALTER TABLE public.act_hi_dec_in OWNER TO postgres;

--
-- TOC entry 307 (class 1259 OID 50081)
-- Name: act_hi_dec_out; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_hi_dec_out (
    id_ character varying(64) NOT NULL,
    dec_inst_id_ character varying(64) NOT NULL,
    clause_id_ character varying(64),
    clause_name_ character varying(255),
    rule_id_ character varying(64),
    rule_order_ integer,
    var_name_ character varying(255),
    var_type_ character varying(100),
    bytearray_id_ character varying(64),
    double_ double precision,
    long_ bigint,
    text_ character varying(4000),
    text2_ character varying(4000),
    tenant_id_ character varying(64),
    create_time_ timestamp without time zone,
    root_proc_inst_id_ character varying(64),
    removal_time_ timestamp without time zone
);


ALTER TABLE public.act_hi_dec_out OWNER TO postgres;

--
-- TOC entry 305 (class 1259 OID 50067)
-- Name: act_hi_decinst; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_hi_decinst (
    id_ character varying(64) NOT NULL,
    dec_def_id_ character varying(64) NOT NULL,
    dec_def_key_ character varying(255) NOT NULL,
    dec_def_name_ character varying(255),
    proc_def_key_ character varying(255),
    proc_def_id_ character varying(64),
    proc_inst_id_ character varying(64),
    case_def_key_ character varying(255),
    case_def_id_ character varying(64),
    case_inst_id_ character varying(64),
    act_inst_id_ character varying(64),
    act_id_ character varying(255),
    eval_time_ timestamp without time zone NOT NULL,
    removal_time_ timestamp without time zone,
    collect_value_ double precision,
    user_id_ character varying(255),
    root_dec_inst_id_ character varying(64),
    root_proc_inst_id_ character varying(64),
    dec_req_id_ character varying(64),
    dec_req_key_ character varying(255),
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_hi_decinst OWNER TO postgres;

--
-- TOC entry 283 (class 1259 OID 49707)
-- Name: act_hi_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_hi_detail (
    id_ character varying(64) NOT NULL,
    type_ character varying(255) NOT NULL,
    proc_def_key_ character varying(255),
    proc_def_id_ character varying(64),
    root_proc_inst_id_ character varying(64),
    proc_inst_id_ character varying(64),
    execution_id_ character varying(64),
    case_def_key_ character varying(255),
    case_def_id_ character varying(64),
    case_inst_id_ character varying(64),
    case_execution_id_ character varying(64),
    task_id_ character varying(64),
    act_inst_id_ character varying(64),
    var_inst_id_ character varying(64),
    name_ character varying(255) NOT NULL,
    var_type_ character varying(64),
    rev_ integer,
    time_ timestamp without time zone NOT NULL,
    bytearray_id_ character varying(64),
    double_ double precision,
    long_ bigint,
    text_ character varying(4000),
    text2_ character varying(4000),
    sequence_counter_ bigint,
    tenant_id_ character varying(64),
    operation_id_ character varying(64),
    removal_time_ timestamp without time zone,
    initial_ boolean
);


ALTER TABLE public.act_hi_detail OWNER TO postgres;

--
-- TOC entry 291 (class 1259 OID 49764)
-- Name: act_hi_ext_task_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_hi_ext_task_log (
    id_ character varying(64) NOT NULL,
    timestamp_ timestamp without time zone NOT NULL,
    ext_task_id_ character varying(64) NOT NULL,
    retries_ integer,
    topic_name_ character varying(255),
    worker_id_ character varying(255),
    priority_ bigint DEFAULT 0 NOT NULL,
    error_msg_ character varying(4000),
    error_details_id_ character varying(64),
    act_id_ character varying(255),
    act_inst_id_ character varying(64),
    execution_id_ character varying(64),
    proc_inst_id_ character varying(64),
    root_proc_inst_id_ character varying(64),
    proc_def_id_ character varying(64),
    proc_def_key_ character varying(255),
    tenant_id_ character varying(64),
    state_ integer,
    removal_time_ timestamp without time zone
);


ALTER TABLE public.act_hi_ext_task_log OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 49714)
-- Name: act_hi_identitylink; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_hi_identitylink (
    id_ character varying(64) NOT NULL,
    timestamp_ timestamp without time zone NOT NULL,
    type_ character varying(255),
    user_id_ character varying(255),
    group_id_ character varying(255),
    task_id_ character varying(64),
    root_proc_inst_id_ character varying(64),
    proc_def_id_ character varying(64),
    operation_type_ character varying(64),
    assigner_id_ character varying(64),
    proc_def_key_ character varying(255),
    tenant_id_ character varying(64),
    removal_time_ timestamp without time zone
);


ALTER TABLE public.act_hi_identitylink OWNER TO postgres;

--
-- TOC entry 288 (class 1259 OID 49742)
-- Name: act_hi_incident; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_hi_incident (
    id_ character varying(64) NOT NULL,
    proc_def_key_ character varying(255),
    proc_def_id_ character varying(64),
    root_proc_inst_id_ character varying(64),
    proc_inst_id_ character varying(64),
    execution_id_ character varying(64),
    create_time_ timestamp without time zone NOT NULL,
    end_time_ timestamp without time zone,
    incident_msg_ character varying(4000),
    incident_type_ character varying(255) NOT NULL,
    activity_id_ character varying(255),
    failed_activity_id_ character varying(255),
    cause_incident_id_ character varying(64),
    root_cause_incident_id_ character varying(64),
    configuration_ character varying(255),
    history_configuration_ character varying(255),
    incident_state_ integer,
    tenant_id_ character varying(64),
    job_def_id_ character varying(64),
    annotation_ character varying(4000),
    removal_time_ timestamp without time zone
);


ALTER TABLE public.act_hi_incident OWNER TO postgres;

--
-- TOC entry 289 (class 1259 OID 49749)
-- Name: act_hi_job_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_hi_job_log (
    id_ character varying(64) NOT NULL,
    timestamp_ timestamp without time zone NOT NULL,
    job_id_ character varying(64) NOT NULL,
    job_duedate_ timestamp without time zone,
    job_retries_ integer,
    job_priority_ bigint DEFAULT 0 NOT NULL,
    job_exception_msg_ character varying(4000),
    job_exception_stack_id_ character varying(64),
    job_state_ integer,
    job_def_id_ character varying(64),
    job_def_type_ character varying(255),
    job_def_configuration_ character varying(255),
    act_id_ character varying(255),
    failed_act_id_ character varying(255),
    execution_id_ character varying(64),
    root_proc_inst_id_ character varying(64),
    process_instance_id_ character varying(64),
    process_def_id_ character varying(64),
    process_def_key_ character varying(255),
    deployment_id_ character varying(64),
    sequence_counter_ bigint,
    tenant_id_ character varying(64),
    hostname_ character varying(255),
    removal_time_ timestamp without time zone,
    batch_id_ character varying(64)
);


ALTER TABLE public.act_hi_job_log OWNER TO postgres;

--
-- TOC entry 287 (class 1259 OID 49735)
-- Name: act_hi_op_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_hi_op_log (
    id_ character varying(64) NOT NULL,
    deployment_id_ character varying(64),
    proc_def_id_ character varying(64),
    proc_def_key_ character varying(255),
    root_proc_inst_id_ character varying(64),
    proc_inst_id_ character varying(64),
    execution_id_ character varying(64),
    case_def_id_ character varying(64),
    case_inst_id_ character varying(64),
    case_execution_id_ character varying(64),
    task_id_ character varying(64),
    job_id_ character varying(64),
    job_def_id_ character varying(64),
    batch_id_ character varying(64),
    user_id_ character varying(255),
    timestamp_ timestamp without time zone NOT NULL,
    operation_type_ character varying(64),
    operation_id_ character varying(64),
    entity_type_ character varying(30),
    property_ character varying(64),
    org_value_ character varying(4000),
    new_value_ character varying(4000),
    tenant_id_ character varying(64),
    removal_time_ timestamp without time zone,
    category_ character varying(64),
    external_task_id_ character varying(64),
    annotation_ character varying(4000)
);


ALTER TABLE public.act_hi_op_log OWNER TO postgres;

--
-- TOC entry 279 (class 1259 OID 49677)
-- Name: act_hi_procinst; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_hi_procinst (
    id_ character varying(64) NOT NULL,
    proc_inst_id_ character varying(64) NOT NULL,
    business_key_ character varying(255),
    proc_def_key_ character varying(255),
    proc_def_id_ character varying(64) NOT NULL,
    start_time_ timestamp without time zone NOT NULL,
    end_time_ timestamp without time zone,
    removal_time_ timestamp without time zone,
    duration_ bigint,
    start_user_id_ character varying(255),
    start_act_id_ character varying(255),
    end_act_id_ character varying(255),
    super_process_instance_id_ character varying(64),
    root_proc_inst_id_ character varying(64),
    super_case_instance_id_ character varying(64),
    case_inst_id_ character varying(64),
    delete_reason_ character varying(4000),
    tenant_id_ character varying(64),
    state_ character varying(255),
    restarted_proc_inst_id_ character varying(64)
);


ALTER TABLE public.act_hi_procinst OWNER TO postgres;

--
-- TOC entry 281 (class 1259 OID 49693)
-- Name: act_hi_taskinst; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_hi_taskinst (
    id_ character varying(64) NOT NULL,
    task_def_key_ character varying(255),
    proc_def_key_ character varying(255),
    proc_def_id_ character varying(64),
    root_proc_inst_id_ character varying(64),
    proc_inst_id_ character varying(64),
    execution_id_ character varying(64),
    case_def_key_ character varying(255),
    case_def_id_ character varying(64),
    case_inst_id_ character varying(64),
    case_execution_id_ character varying(64),
    act_inst_id_ character varying(64),
    name_ character varying(255),
    parent_task_id_ character varying(64),
    description_ character varying(4000),
    owner_ character varying(255),
    assignee_ character varying(255),
    start_time_ timestamp without time zone NOT NULL,
    end_time_ timestamp without time zone,
    duration_ bigint,
    delete_reason_ character varying(4000),
    priority_ integer,
    due_date_ timestamp without time zone,
    follow_up_date_ timestamp without time zone,
    tenant_id_ character varying(64),
    removal_time_ timestamp without time zone,
    task_state_ character varying(64)
);


ALTER TABLE public.act_hi_taskinst OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 49700)
-- Name: act_hi_varinst; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_hi_varinst (
    id_ character varying(64) NOT NULL,
    proc_def_key_ character varying(255),
    proc_def_id_ character varying(64),
    root_proc_inst_id_ character varying(64),
    proc_inst_id_ character varying(64),
    execution_id_ character varying(64),
    act_inst_id_ character varying(64),
    case_def_key_ character varying(255),
    case_def_id_ character varying(64),
    case_inst_id_ character varying(64),
    case_execution_id_ character varying(64),
    task_id_ character varying(64),
    name_ character varying(255) NOT NULL,
    var_type_ character varying(100),
    create_time_ timestamp without time zone,
    rev_ integer,
    bytearray_id_ character varying(64),
    double_ double precision,
    long_ bigint,
    text_ character varying(4000),
    text2_ character varying(4000),
    tenant_id_ character varying(64),
    state_ character varying(20),
    removal_time_ timestamp without time zone
);


ALTER TABLE public.act_hi_varinst OWNER TO postgres;

--
-- TOC entry 292 (class 1259 OID 49874)
-- Name: act_id_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_id_group (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    name_ character varying(255),
    type_ character varying(255)
);


ALTER TABLE public.act_id_group OWNER TO postgres;

--
-- TOC entry 295 (class 1259 OID 49893)
-- Name: act_id_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_id_info (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    user_id_ character varying(64),
    type_ character varying(64),
    key_ character varying(255),
    value_ character varying(255),
    password_ bytea,
    parent_id_ character varying(255)
);


ALTER TABLE public.act_id_info OWNER TO postgres;

--
-- TOC entry 293 (class 1259 OID 49881)
-- Name: act_id_membership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_id_membership (
    user_id_ character varying(64) NOT NULL,
    group_id_ character varying(64) NOT NULL
);


ALTER TABLE public.act_id_membership OWNER TO postgres;

--
-- TOC entry 296 (class 1259 OID 49900)
-- Name: act_id_tenant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_id_tenant (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    name_ character varying(255)
);


ALTER TABLE public.act_id_tenant OWNER TO postgres;

--
-- TOC entry 297 (class 1259 OID 49905)
-- Name: act_id_tenant_member; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_id_tenant_member (
    id_ character varying(64) NOT NULL,
    tenant_id_ character varying(64) NOT NULL,
    user_id_ character varying(64),
    group_id_ character varying(64)
);


ALTER TABLE public.act_id_tenant_member OWNER TO postgres;

--
-- TOC entry 294 (class 1259 OID 49886)
-- Name: act_id_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_id_user (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    first_ character varying(255),
    last_ character varying(255),
    email_ character varying(255),
    pwd_ character varying(255),
    salt_ character varying(255),
    lock_exp_time_ timestamp without time zone,
    attempts_ integer,
    picture_id_ character varying(64)
);


ALTER TABLE public.act_id_user OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 49379)
-- Name: act_re_camformdef; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_re_camformdef (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    key_ character varying(255) NOT NULL,
    version_ integer NOT NULL,
    deployment_id_ character varying(64),
    resource_name_ character varying(4000),
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_re_camformdef OWNER TO postgres;

--
-- TOC entry 298 (class 1259 OID 49944)
-- Name: act_re_case_def; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_re_case_def (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    category_ character varying(255),
    name_ character varying(255),
    key_ character varying(255) NOT NULL,
    version_ integer NOT NULL,
    deployment_id_ character varying(64),
    resource_name_ character varying(4000),
    dgrm_resource_name_ character varying(4000),
    tenant_id_ character varying(64),
    history_ttl_ integer
);


ALTER TABLE public.act_re_case_def OWNER TO postgres;

--
-- TOC entry 303 (class 1259 OID 50045)
-- Name: act_re_decision_def; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_re_decision_def (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    category_ character varying(255),
    name_ character varying(255),
    key_ character varying(255) NOT NULL,
    version_ integer NOT NULL,
    deployment_id_ character varying(64),
    resource_name_ character varying(4000),
    dgrm_resource_name_ character varying(4000),
    dec_req_id_ character varying(64),
    dec_req_key_ character varying(255),
    tenant_id_ character varying(64),
    history_ttl_ integer,
    version_tag_ character varying(64)
);


ALTER TABLE public.act_re_decision_def OWNER TO postgres;

--
-- TOC entry 304 (class 1259 OID 50052)
-- Name: act_re_decision_req_def; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_re_decision_req_def (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    category_ character varying(255),
    name_ character varying(255),
    key_ character varying(255) NOT NULL,
    version_ integer NOT NULL,
    deployment_id_ character varying(64),
    resource_name_ character varying(4000),
    dgrm_resource_name_ character varying(4000),
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_re_decision_req_def OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 49340)
-- Name: act_re_deployment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_re_deployment (
    id_ character varying(64) NOT NULL,
    name_ character varying(255),
    deploy_time_ timestamp without time zone,
    source_ character varying(255),
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_re_deployment OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 49371)
-- Name: act_re_procdef; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_re_procdef (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    category_ character varying(255),
    name_ character varying(255),
    key_ character varying(255) NOT NULL,
    version_ integer NOT NULL,
    deployment_id_ character varying(64),
    resource_name_ character varying(4000),
    dgrm_resource_name_ character varying(4000),
    has_start_form_key_ boolean,
    suspension_state_ integer,
    tenant_id_ character varying(64),
    version_tag_ character varying(64),
    history_ttl_ integer,
    startable_ boolean DEFAULT true NOT NULL
);


ALTER TABLE public.act_re_procdef OWNER TO postgres;

--
-- TOC entry 273 (class 1259 OID 49421)
-- Name: act_ru_authorization; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_ru_authorization (
    id_ character varying(64) NOT NULL,
    rev_ integer NOT NULL,
    type_ integer NOT NULL,
    group_id_ character varying(255),
    user_id_ character varying(255),
    resource_type_ integer NOT NULL,
    resource_id_ character varying(255),
    perms_ integer,
    removal_time_ timestamp without time zone,
    root_proc_inst_id_ character varying(64)
);


ALTER TABLE public.act_ru_authorization OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 49454)
-- Name: act_ru_batch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_ru_batch (
    id_ character varying(64) NOT NULL,
    rev_ integer NOT NULL,
    type_ character varying(255),
    total_jobs_ integer,
    jobs_created_ integer,
    jobs_per_seed_ integer,
    invocations_per_job_ integer,
    seed_job_def_id_ character varying(64),
    batch_job_def_id_ character varying(64),
    monitor_job_def_id_ character varying(64),
    suspension_state_ integer,
    configuration_ character varying(255),
    tenant_id_ character varying(64),
    create_user_id_ character varying(255),
    start_time_ timestamp without time zone,
    exec_start_time_ timestamp without time zone
);


ALTER TABLE public.act_ru_batch OWNER TO postgres;

--
-- TOC entry 299 (class 1259 OID 49951)
-- Name: act_ru_case_execution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_ru_case_execution (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    case_inst_id_ character varying(64),
    super_case_exec_ character varying(64),
    super_exec_ character varying(64),
    business_key_ character varying(255),
    parent_id_ character varying(64),
    case_def_id_ character varying(64),
    act_id_ character varying(255),
    prev_state_ integer,
    current_state_ integer,
    required_ boolean,
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_ru_case_execution OWNER TO postgres;

--
-- TOC entry 300 (class 1259 OID 49958)
-- Name: act_ru_case_sentry_part; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_ru_case_sentry_part (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    case_inst_id_ character varying(64),
    case_exec_id_ character varying(64),
    sentry_id_ character varying(255),
    type_ character varying(255),
    source_case_exec_id_ character varying(64),
    standard_event_ character varying(255),
    source_ character varying(255),
    variable_event_ character varying(255),
    variable_name_ character varying(255),
    satisfied_ boolean,
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_ru_case_sentry_part OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 49407)
-- Name: act_ru_event_subscr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_ru_event_subscr (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    event_type_ character varying(255) NOT NULL,
    event_name_ character varying(255),
    execution_id_ character varying(64),
    proc_inst_id_ character varying(64),
    activity_id_ character varying(255),
    configuration_ character varying(255),
    created_ timestamp without time zone NOT NULL,
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_ru_event_subscr OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 49347)
-- Name: act_ru_execution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_ru_execution (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    root_proc_inst_id_ character varying(64),
    proc_inst_id_ character varying(64),
    business_key_ character varying(255),
    parent_id_ character varying(64),
    proc_def_id_ character varying(64),
    super_exec_ character varying(64),
    super_case_exec_ character varying(64),
    case_inst_id_ character varying(64),
    act_id_ character varying(255),
    act_inst_id_ character varying(64),
    is_active_ boolean,
    is_concurrent_ boolean,
    is_scope_ boolean,
    is_event_scope_ boolean,
    suspension_state_ integer,
    cached_ent_state_ integer,
    sequence_counter_ bigint,
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_ru_execution OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 49446)
-- Name: act_ru_ext_task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_ru_ext_task (
    id_ character varying(64) NOT NULL,
    rev_ integer NOT NULL,
    worker_id_ character varying(255),
    topic_name_ character varying(255),
    retries_ integer,
    error_msg_ character varying(4000),
    error_details_id_ character varying(64),
    lock_exp_time_ timestamp without time zone,
    create_time_ timestamp without time zone,
    suspension_state_ integer,
    execution_id_ character varying(64),
    proc_inst_id_ character varying(64),
    proc_def_id_ character varying(64),
    proc_def_key_ character varying(255),
    act_id_ character varying(255),
    act_inst_id_ character varying(64),
    tenant_id_ character varying(64),
    priority_ bigint DEFAULT 0 NOT NULL,
    last_failure_log_id_ character varying(64)
);


ALTER TABLE public.act_ru_ext_task OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 49428)
-- Name: act_ru_filter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_ru_filter (
    id_ character varying(64) NOT NULL,
    rev_ integer NOT NULL,
    resource_type_ character varying(255) NOT NULL,
    name_ character varying(255) NOT NULL,
    owner_ character varying(255),
    query_ text NOT NULL,
    properties_ text
);


ALTER TABLE public.act_ru_filter OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 49393)
-- Name: act_ru_identitylink; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_ru_identitylink (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    group_id_ character varying(255),
    type_ character varying(255),
    user_id_ character varying(255),
    task_id_ character varying(64),
    proc_def_id_ character varying(64),
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_ru_identitylink OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 49414)
-- Name: act_ru_incident; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_ru_incident (
    id_ character varying(64) NOT NULL,
    rev_ integer NOT NULL,
    incident_timestamp_ timestamp without time zone NOT NULL,
    incident_msg_ character varying(4000),
    incident_type_ character varying(255) NOT NULL,
    execution_id_ character varying(64),
    activity_id_ character varying(255),
    failed_activity_id_ character varying(255),
    proc_inst_id_ character varying(64),
    proc_def_id_ character varying(64),
    cause_incident_id_ character varying(64),
    root_cause_incident_id_ character varying(64),
    configuration_ character varying(255),
    tenant_id_ character varying(64),
    job_def_id_ character varying(64),
    annotation_ character varying(4000)
);


ALTER TABLE public.act_ru_incident OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 49354)
-- Name: act_ru_job; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_ru_job (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    type_ character varying(255) NOT NULL,
    lock_exp_time_ timestamp without time zone,
    lock_owner_ character varying(255),
    exclusive_ boolean,
    execution_id_ character varying(64),
    root_proc_inst_id_ character varying(64),
    process_instance_id_ character varying(64),
    process_def_id_ character varying(64),
    process_def_key_ character varying(255),
    retries_ integer,
    exception_stack_id_ character varying(64),
    exception_msg_ character varying(4000),
    failed_act_id_ character varying(255),
    duedate_ timestamp without time zone,
    repeat_ character varying(255),
    repeat_offset_ bigint DEFAULT 0,
    handler_type_ character varying(255),
    handler_cfg_ character varying(4000),
    deployment_id_ character varying(64),
    suspension_state_ integer DEFAULT 1 NOT NULL,
    job_def_id_ character varying(64),
    priority_ bigint DEFAULT 0 NOT NULL,
    sequence_counter_ bigint,
    tenant_id_ character varying(64),
    create_time_ timestamp without time zone,
    last_failure_log_id_ character varying(64),
    batch_id_ character varying(64)
);


ALTER TABLE public.act_ru_job OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 49364)
-- Name: act_ru_jobdef; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_ru_jobdef (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    proc_def_id_ character varying(64),
    proc_def_key_ character varying(255),
    act_id_ character varying(255),
    job_type_ character varying(255) NOT NULL,
    job_configuration_ character varying(255),
    suspension_state_ integer,
    job_priority_ bigint,
    tenant_id_ character varying(64),
    deployment_id_ character varying(64)
);


ALTER TABLE public.act_ru_jobdef OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 49435)
-- Name: act_ru_meter_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_ru_meter_log (
    id_ character varying(64) NOT NULL,
    name_ character varying(64) NOT NULL,
    reporter_ character varying(255),
    value_ bigint,
    timestamp_ timestamp without time zone,
    milliseconds_ bigint DEFAULT 0
);


ALTER TABLE public.act_ru_meter_log OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 49386)
-- Name: act_ru_task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_ru_task (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    execution_id_ character varying(64),
    proc_inst_id_ character varying(64),
    proc_def_id_ character varying(64),
    case_execution_id_ character varying(64),
    case_inst_id_ character varying(64),
    case_def_id_ character varying(64),
    name_ character varying(255),
    parent_task_id_ character varying(64),
    description_ character varying(4000),
    task_def_key_ character varying(255),
    owner_ character varying(255),
    assignee_ character varying(255),
    delegation_ character varying(64),
    priority_ integer,
    create_time_ timestamp without time zone,
    last_updated_ timestamp without time zone,
    due_date_ timestamp without time zone,
    follow_up_date_ timestamp without time zone,
    suspension_state_ integer,
    tenant_id_ character varying(64),
    task_state_ character varying(64)
);


ALTER TABLE public.act_ru_task OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 49441)
-- Name: act_ru_task_meter_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_ru_task_meter_log (
    id_ character varying(64) NOT NULL,
    assignee_hash_ bigint,
    timestamp_ timestamp without time zone
);


ALTER TABLE public.act_ru_task_meter_log OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 49400)
-- Name: act_ru_variable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_ru_variable (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    type_ character varying(255) NOT NULL,
    name_ character varying(255) NOT NULL,
    execution_id_ character varying(64),
    proc_inst_id_ character varying(64),
    proc_def_id_ character varying(64),
    case_execution_id_ character varying(64),
    case_inst_id_ character varying(64),
    task_id_ character varying(64),
    batch_id_ character varying(64),
    bytearray_id_ character varying(64),
    double_ double precision,
    long_ bigint,
    text_ character varying(4000),
    text2_ character varying(4000),
    var_scope_ character varying(64),
    sequence_counter_ bigint,
    is_concurrent_local_ boolean,
    tenant_id_ character varying(64)
);


ALTER TABLE public.act_ru_variable OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 38492)
-- Name: activite_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activite_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.activite_seq OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 44296)
-- Name: adher_pm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adher_pm (
    id bigint NOT NULL
);


ALTER TABLE public.adher_pm OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 44295)
-- Name: adher_pm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.adher_pm ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.adher_pm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 44097)
-- Name: adherent_contact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adherent_contact (
    adherent_id bigint NOT NULL,
    contact_id bigint NOT NULL
);


ALTER TABLE public.adherent_contact OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 44310)
-- Name: contrat_etape4caution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contrat_etape4caution (
    id bigint NOT NULL,
    caution_amount numeric(19,2),
    caution_type character varying(32) NOT NULL
);


ALTER TABLE public.contrat_etape4caution OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 44309)
-- Name: contrat_etape4caution_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.contrat_etape4caution ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.contrat_etape4caution_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 256 (class 1259 OID 44316)
-- Name: contrat_etape4caution_pm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contrat_etape4caution_pm (
    id bigint NOT NULL,
    caution_pm_amount numeric(19,2),
    caution_pm_type character varying(32) NOT NULL
);


ALTER TABLE public.contrat_etape4caution_pm OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 44315)
-- Name: contrat_etape4caution_pm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.contrat_etape4caution_pm ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.contrat_etape4caution_pm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 258 (class 1259 OID 44322)
-- Name: contrat_old_no; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contrat_old_no (
    id bigint NOT NULL,
    contrat_old_no character varying(64) NOT NULL
);


ALTER TABLE public.contrat_old_no OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 44321)
-- Name: contrat_old_no_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.contrat_old_no ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.contrat_old_no_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 38493)
-- Name: forme_juridique_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forme_juridique_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.forme_juridique_seq OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 38494)
-- Name: groupe_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groupe_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.groupe_seq OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 38495)
-- Name: nationalite_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nationalite_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nationalite_seq OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 44100)
-- Name: personne_morale_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personne_morale_roles (
    personne_morale_id bigint NOT NULL,
    indvidu_roles character varying(255),
    CONSTRAINT personne_morale_roles_indvidu_roles_check CHECK (((indvidu_roles)::text = ANY ((ARRAY['ADHERENT'::character varying, 'ACHETEUR'::character varying, 'CONTACT'::character varying])::text[])))
);


ALTER TABLE public.personne_morale_roles OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 38496)
-- Name: personne_morale_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personne_morale_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personne_morale_seq OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 44104)
-- Name: personne_physique_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personne_physique_roles (
    personne_physique_id bigint NOT NULL,
    indvidu_roles character varying(255),
    CONSTRAINT personne_physique_roles_indvidu_roles_check CHECK (((indvidu_roles)::text = ANY ((ARRAY['ADHERENT'::character varying, 'ACHETEUR'::character varying, 'CONTACT'::character varying])::text[])))
);


ALTER TABLE public.personne_physique_roles OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 33514)
-- Name: personne_physique_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personne_physique_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personne_physique_seq OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 38497)
-- Name: situation_judiciaire_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.situation_judiciaire_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.situation_judiciaire_seq OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 38498)
-- Name: type_personne_morale_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_personne_morale_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.type_personne_morale_seq OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 38499)
-- Name: type_piece_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_piece_id_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.type_piece_id_seq OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 44108)
-- Name: x_activite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.x_activite (
    x_activite_id bigint NOT NULL,
    x_activite_code character varying(255),
    x_activite_dsg character varying(255),
    sys_adr_ip character varying(255),
    sys_date timestamp(6) without time zone,
    sys_user character varying(255),
    sys_user_id bigint
);


ALTER TABLE public.x_activite OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 44185)
-- Name: x_activite_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.x_activite_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.x_activite_seq OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 44115)
-- Name: x_forme_juridique; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.x_forme_juridique (
    x_forme_juridique_id bigint NOT NULL,
    x_forme_juridique_code character varying(255),
    x_forme_juridique_dsg character varying(255),
    sys_adr_ip character varying(255),
    sys_date timestamp(6) without time zone,
    sys_user character varying(255),
    sys_user_id bigint
);


ALTER TABLE public.x_forme_juridique OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 44186)
-- Name: x_forme_juridique_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.x_forme_juridique_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.x_forme_juridique_seq OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 44122)
-- Name: x_groupe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.x_groupe (
    x_groupe_id bigint NOT NULL,
    x_groupe_code_bct character varying(255),
    x_groupe_code_interne character varying(255),
    x_groupe_dsg character varying(255),
    sys_adresse_ip character varying(255),
    sys_date timestamp(6) without time zone,
    sys_user character varying(255),
    sys_user_id bigint
);


ALTER TABLE public.x_groupe OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 44187)
-- Name: x_groupe_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.x_groupe_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.x_groupe_seq OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 44129)
-- Name: x_nationalite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.x_nationalite (
    x_nationalite_id bigint NOT NULL,
    x_nationalite_code_alpha character varying(255),
    x_nationalite_dsg character varying(255),
    x_nationalite_code_num character varying(255),
    sys_adr_ip character varying(255),
    sys_date timestamp(6) without time zone,
    sys_user character varying(255),
    sys_user_id bigint
);


ALTER TABLE public.x_nationalite OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 44188)
-- Name: x_nationalite_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.x_nationalite_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.x_nationalite_seq OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 44137)
-- Name: x_profession; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.x_profession (
    x_profession_id bigint NOT NULL,
    x_profession_code character varying(255),
    x_profession_dsg character varying(255),
    sys_adr_ip character varying(255),
    sys_date timestamp(6) without time zone,
    sys_user character varying(255),
    sys_user_id bigint
);


ALTER TABLE public.x_profession OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 44136)
-- Name: x_profession_x_profession_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.x_profession ALTER COLUMN x_profession_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.x_profession_x_profession_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 237 (class 1259 OID 44144)
-- Name: x_situation_judiciaire; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.x_situation_judiciaire (
    x_situation_judiciaire_id bigint NOT NULL,
    x_situation_judiciaire_code character varying(255),
    x_situation_judiciaire_dsg character varying(255),
    sys_adr_ip character varying(255),
    sys_date timestamp(6) without time zone,
    sys_user character varying(255),
    sys_user_id bigint
);


ALTER TABLE public.x_situation_judiciaire OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 44189)
-- Name: x_situation_judiciaire_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.x_situation_judiciaire_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.x_situation_judiciaire_seq OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 44151)
-- Name: x_type_personne_morale; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.x_type_personne_morale (
    x_type_pm_id bigint NOT NULL,
    x_type_pm_code character varying(255),
    x_type_pm_dsg character varying(255),
    sys_adr_ip character varying(255),
    sys_date timestamp(6) without time zone,
    sys_user character varying(255),
    sys_user_id bigint
);


ALTER TABLE public.x_type_personne_morale OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 44190)
-- Name: x_type_personne_morale_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.x_type_personne_morale_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.x_type_personne_morale_seq OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 44158)
-- Name: x_type_piece_identité; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."x_type_piece_identité" (
    x_type_piece_ident_id bigint NOT NULL,
    x_type_piece_ident_code character varying(255) NOT NULL,
    x_type_piece_ident_dsg character varying(255) NOT NULL,
    x_type_piece_ident_bool_pm_tun boolean NOT NULL,
    x_type_piece_ident_bool_pp_etr boolean NOT NULL,
    x_type_piece_ident_bool_pp_etr_non_res boolean NOT NULL,
    x_type_piece_ident_bool_pp_etr_res boolean NOT NULL,
    x_type_piece_ident_bool_pp_tun boolean NOT NULL,
    sys_adr_ip character varying(255),
    sys_date timestamp(6) without time zone,
    sys_user character varying(255),
    sys_user_id bigint,
    x_type_piece_ident_taille integer NOT NULL
);


ALTER TABLE public."x_type_piece_identité" OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 44191)
-- Name: x_type_piece_identité_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."x_type_piece_identité_seq"
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."x_type_piece_identité_seq" OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 44165)
-- Name: y_pm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.y_pm (
    id bigint NOT NULL,
    y_pm_adresse character varying(255) NOT NULL,
    y_pm_bool_assureur boolean,
    y_pm_bool_commerce boolean,
    y_pm_email character varying(255) NOT NULL,
    y_pm_bool_exempt_fatca boolean,
    y_pm_bool_exempt_rs character varying(255),
    y_pm_exempt_rs_date_deb timestamp(6) without time zone,
    y_pm_exempt_rs_date_fin timestamp(6) without time zone,
    y_pm_bool_exempt_tva boolean,
    y_pm_exempt_tva_date_deb timestamp(6) without time zone,
    y_pm_exempt_tva_date_fin timestamp(6) without time zone,
    y_pm_fin_activite_date timestamp(6) without time zone,
    y_pm_info_libre character varying(255),
    y_pm_matricule_fiscal character varying(255),
    y_pm_piece_ident_num character varying(255),
    y_pm_piece_ident_autorite character varying(255),
    y_pm_piece_ident_deliv_date timestamp(6) without time zone,
    y_pm_piece_ident_deliv_lieu character varying(255),
    y_pm_piece_ident_exripe_date timestamp(6) without time zone,
    y_pp_creation_date timestamp(6) without time zone,
    y_pp_creation_lieu character varying(255),
    y_pp_bool_resident boolean,
    y_pp_bool_tun boolean,
    y_pm_pub boolean,
    y_pm_raison_sociale character varying(255) NOT NULL,
    y_pm_sigle character varying(255) NOT NULL,
    y_pm_site_web character varying(255),
    sys_adr_ip character varying(255),
    sys_date timestamp(6) without time zone,
    sys_user character varying(255),
    sys_user_id bigint,
    y_pm_tel_no character varying(255) NOT NULL,
    y_pm_ville character varying(255) NOT NULL,
    x_type_piece_ident_id_fk bigint NOT NULL,
    x_activite_id_fk bigint,
    x_forme_juridique_id_fk bigint,
    x_groupe_id_fk bigint,
    x_nationalite_id_fk bigint,
    x_situation_judiciaire_id_fk bigint,
    x_type_pm_id_fk bigint,
    archiver boolean
);


ALTER TABLE public.y_pm OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 44192)
-- Name: y_pm_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.y_pm_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.y_pm_seq OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 44173)
-- Name: y_pp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.y_pp (
    id bigint NOT NULL,
    y_pp_email character varying(255),
    acheteur boolean,
    y_pp_adresse character varying(255) NOT NULL,
    y_pp_alias character varying(255),
    contact boolean,
    y_pp_deces_date boolean,
    y_pp_bool_exempt_fatca boolean,
    y_pp_bool_exempt_rs character varying(255),
    y_pp_exempt_rs_date_deb timestamp(6) without time zone,
    y_pp_exempt_rs_date_fin timestamp(6) without time zone,
    y_pp_bool_exempt_tva boolean,
    y_pp_exempt_tva_date_deb timestamp(6) without time zone,
    y_pp_exempt_tva_date_fin timestamp(6) without time zone,
    y_pp_genree character varying(255),
    y_pp_info_libre character varying(255),
    y_pp_naissance_date timestamp(6) without time zone,
    y_pp_naissance_lieu character varying(255),
    y_pp_nom character varying(255) NOT NULL,
    y_pp_piece_ident_num character varying(255),
    y_pp_piece_ident_autorite character varying(255),
    y_pp_piece_ident_deliv_date timestamp(6) without time zone,
    y_pp_piece_ident_deliv_lieue character varying(255),
    y_pp_piece_ident_exripe_date timestamp(6) without time zone,
    y_pp_prenom character varying(255) NOT NULL,
    y_pp_bool_resident boolean,
    sys_adr_ip character varying(255),
    sys_date timestamp(6) without time zone,
    sys_user character varying(255),
    sys_user_id bigint,
    y_pp_tel_mobile_no character varying(255),
    y_pp_bool_tun boolean,
    x_type_piece_ident_id_fk bigint NOT NULL,
    x_nationalite_id_fk bigint,
    x_profession_id_fk bigint,
    archiver boolean,
    CONSTRAINT y_pp_y_pp_genree_check CHECK (((y_pp_genree)::text = ANY ((ARRAY['HOMME'::character varying, 'FEMME'::character varying])::text[])))
);


ALTER TABLE public.y_pp OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 44172)
-- Name: y_pp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.y_pp ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.y_pp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 5632 (class 0 OID 44087)
-- Dependencies: 226
-- Data for Name: _adherent_acheteur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._adherent_acheteur (acheteur_morale_id, acheteur_physique_id, adherent_id) FROM stdin;
\.


--
-- TOC entry 5633 (class 0 OID 44092)
-- Dependencies: 227
-- Data for Name: _adherent_fournisseur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._adherent_fournisseur (fournisseur_morale_id, fournisseur_physique_id, adherent_id) FROM stdin;
\.


--
-- TOC entry 5666 (class 0 OID 49328)
-- Dependencies: 260
-- Data for Name: act_ge_bytearray; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_ge_bytearray (id_, rev_, name_, deployment_id_, bytes_, generated_, tenant_id_, type_, create_time_, root_proc_inst_id_, removal_time_) FROM stdin;
\.


--
-- TOC entry 5665 (class 0 OID 49323)
-- Dependencies: 259
-- Data for Name: act_ge_property; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_ge_property (name_, value_, rev_) FROM stdin;
schema.version	fox	1
schema.history	create(fox)	1
next.dbid	1	1
deployment.lock	0	1
history.cleanup.job.lock	0	1
startup.lock	0	1
installationId.lock	0	1
historyLevel	3	1
camunda.installation.id	13849d18-3f04-4469-81d8-e7d530caa9a7	1
\.


--
-- TOC entry 5667 (class 0 OID 49335)
-- Dependencies: 261
-- Data for Name: act_ge_schema_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_ge_schema_log (id_, timestamp_, version_) FROM stdin;
0	2025-03-06 17:47:05.245266	7.22.0
\.


--
-- TOC entry 5686 (class 0 OID 49686)
-- Dependencies: 280
-- Data for Name: act_hi_actinst; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_hi_actinst (id_, parent_act_inst_id_, proc_def_key_, proc_def_id_, root_proc_inst_id_, proc_inst_id_, execution_id_, act_id_, task_id_, call_proc_inst_id_, call_case_inst_id_, act_name_, act_type_, assignee_, start_time_, end_time_, duration_, act_inst_state_, sequence_counter_, tenant_id_, removal_time_) FROM stdin;
\.


--
-- TOC entry 5692 (class 0 OID 49728)
-- Dependencies: 286
-- Data for Name: act_hi_attachment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_hi_attachment (id_, rev_, user_id_, name_, description_, type_, task_id_, root_proc_inst_id_, proc_inst_id_, url_, content_id_, tenant_id_, create_time_, removal_time_) FROM stdin;
\.


--
-- TOC entry 5696 (class 0 OID 49757)
-- Dependencies: 290
-- Data for Name: act_hi_batch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_hi_batch (id_, type_, total_jobs_, jobs_per_seed_, invocations_per_job_, seed_job_def_id_, monitor_job_def_id_, batch_job_def_id_, tenant_id_, create_user_id_, start_time_, end_time_, removal_time_, exec_start_time_) FROM stdin;
\.


--
-- TOC entry 5708 (class 0 OID 50031)
-- Dependencies: 302
-- Data for Name: act_hi_caseactinst; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_hi_caseactinst (id_, parent_act_inst_id_, case_def_id_, case_inst_id_, case_act_id_, task_id_, call_proc_inst_id_, call_case_inst_id_, case_act_name_, case_act_type_, create_time_, end_time_, duration_, state_, required_, tenant_id_) FROM stdin;
\.


--
-- TOC entry 5707 (class 0 OID 50022)
-- Dependencies: 301
-- Data for Name: act_hi_caseinst; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_hi_caseinst (id_, case_inst_id_, business_key_, case_def_id_, create_time_, close_time_, duration_, state_, create_user_id_, super_case_instance_id_, super_process_instance_id_, tenant_id_) FROM stdin;
\.


--
-- TOC entry 5691 (class 0 OID 49721)
-- Dependencies: 285
-- Data for Name: act_hi_comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_hi_comment (id_, type_, time_, user_id_, task_id_, root_proc_inst_id_, proc_inst_id_, action_, message_, full_msg_, tenant_id_, removal_time_) FROM stdin;
\.


--
-- TOC entry 5712 (class 0 OID 50074)
-- Dependencies: 306
-- Data for Name: act_hi_dec_in; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_hi_dec_in (id_, dec_inst_id_, clause_id_, clause_name_, var_type_, bytearray_id_, double_, long_, text_, text2_, tenant_id_, create_time_, root_proc_inst_id_, removal_time_) FROM stdin;
\.


--
-- TOC entry 5713 (class 0 OID 50081)
-- Dependencies: 307
-- Data for Name: act_hi_dec_out; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_hi_dec_out (id_, dec_inst_id_, clause_id_, clause_name_, rule_id_, rule_order_, var_name_, var_type_, bytearray_id_, double_, long_, text_, text2_, tenant_id_, create_time_, root_proc_inst_id_, removal_time_) FROM stdin;
\.


--
-- TOC entry 5711 (class 0 OID 50067)
-- Dependencies: 305
-- Data for Name: act_hi_decinst; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_hi_decinst (id_, dec_def_id_, dec_def_key_, dec_def_name_, proc_def_key_, proc_def_id_, proc_inst_id_, case_def_key_, case_def_id_, case_inst_id_, act_inst_id_, act_id_, eval_time_, removal_time_, collect_value_, user_id_, root_dec_inst_id_, root_proc_inst_id_, dec_req_id_, dec_req_key_, tenant_id_) FROM stdin;
\.


--
-- TOC entry 5689 (class 0 OID 49707)
-- Dependencies: 283
-- Data for Name: act_hi_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_hi_detail (id_, type_, proc_def_key_, proc_def_id_, root_proc_inst_id_, proc_inst_id_, execution_id_, case_def_key_, case_def_id_, case_inst_id_, case_execution_id_, task_id_, act_inst_id_, var_inst_id_, name_, var_type_, rev_, time_, bytearray_id_, double_, long_, text_, text2_, sequence_counter_, tenant_id_, operation_id_, removal_time_, initial_) FROM stdin;
\.


--
-- TOC entry 5697 (class 0 OID 49764)
-- Dependencies: 291
-- Data for Name: act_hi_ext_task_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_hi_ext_task_log (id_, timestamp_, ext_task_id_, retries_, topic_name_, worker_id_, priority_, error_msg_, error_details_id_, act_id_, act_inst_id_, execution_id_, proc_inst_id_, root_proc_inst_id_, proc_def_id_, proc_def_key_, tenant_id_, state_, removal_time_) FROM stdin;
\.


--
-- TOC entry 5690 (class 0 OID 49714)
-- Dependencies: 284
-- Data for Name: act_hi_identitylink; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_hi_identitylink (id_, timestamp_, type_, user_id_, group_id_, task_id_, root_proc_inst_id_, proc_def_id_, operation_type_, assigner_id_, proc_def_key_, tenant_id_, removal_time_) FROM stdin;
\.


--
-- TOC entry 5694 (class 0 OID 49742)
-- Dependencies: 288
-- Data for Name: act_hi_incident; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_hi_incident (id_, proc_def_key_, proc_def_id_, root_proc_inst_id_, proc_inst_id_, execution_id_, create_time_, end_time_, incident_msg_, incident_type_, activity_id_, failed_activity_id_, cause_incident_id_, root_cause_incident_id_, configuration_, history_configuration_, incident_state_, tenant_id_, job_def_id_, annotation_, removal_time_) FROM stdin;
\.


--
-- TOC entry 5695 (class 0 OID 49749)
-- Dependencies: 289
-- Data for Name: act_hi_job_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_hi_job_log (id_, timestamp_, job_id_, job_duedate_, job_retries_, job_priority_, job_exception_msg_, job_exception_stack_id_, job_state_, job_def_id_, job_def_type_, job_def_configuration_, act_id_, failed_act_id_, execution_id_, root_proc_inst_id_, process_instance_id_, process_def_id_, process_def_key_, deployment_id_, sequence_counter_, tenant_id_, hostname_, removal_time_, batch_id_) FROM stdin;
\.


--
-- TOC entry 5693 (class 0 OID 49735)
-- Dependencies: 287
-- Data for Name: act_hi_op_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_hi_op_log (id_, deployment_id_, proc_def_id_, proc_def_key_, root_proc_inst_id_, proc_inst_id_, execution_id_, case_def_id_, case_inst_id_, case_execution_id_, task_id_, job_id_, job_def_id_, batch_id_, user_id_, timestamp_, operation_type_, operation_id_, entity_type_, property_, org_value_, new_value_, tenant_id_, removal_time_, category_, external_task_id_, annotation_) FROM stdin;
\.


--
-- TOC entry 5685 (class 0 OID 49677)
-- Dependencies: 279
-- Data for Name: act_hi_procinst; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_hi_procinst (id_, proc_inst_id_, business_key_, proc_def_key_, proc_def_id_, start_time_, end_time_, removal_time_, duration_, start_user_id_, start_act_id_, end_act_id_, super_process_instance_id_, root_proc_inst_id_, super_case_instance_id_, case_inst_id_, delete_reason_, tenant_id_, state_, restarted_proc_inst_id_) FROM stdin;
\.


--
-- TOC entry 5687 (class 0 OID 49693)
-- Dependencies: 281
-- Data for Name: act_hi_taskinst; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_hi_taskinst (id_, task_def_key_, proc_def_key_, proc_def_id_, root_proc_inst_id_, proc_inst_id_, execution_id_, case_def_key_, case_def_id_, case_inst_id_, case_execution_id_, act_inst_id_, name_, parent_task_id_, description_, owner_, assignee_, start_time_, end_time_, duration_, delete_reason_, priority_, due_date_, follow_up_date_, tenant_id_, removal_time_, task_state_) FROM stdin;
\.


--
-- TOC entry 5688 (class 0 OID 49700)
-- Dependencies: 282
-- Data for Name: act_hi_varinst; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_hi_varinst (id_, proc_def_key_, proc_def_id_, root_proc_inst_id_, proc_inst_id_, execution_id_, act_inst_id_, case_def_key_, case_def_id_, case_inst_id_, case_execution_id_, task_id_, name_, var_type_, create_time_, rev_, bytearray_id_, double_, long_, text_, text2_, tenant_id_, state_, removal_time_) FROM stdin;
\.


--
-- TOC entry 5698 (class 0 OID 49874)
-- Dependencies: 292
-- Data for Name: act_id_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_id_group (id_, rev_, name_, type_) FROM stdin;
\.


--
-- TOC entry 5701 (class 0 OID 49893)
-- Dependencies: 295
-- Data for Name: act_id_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_id_info (id_, rev_, user_id_, type_, key_, value_, password_, parent_id_) FROM stdin;
\.


--
-- TOC entry 5699 (class 0 OID 49881)
-- Dependencies: 293
-- Data for Name: act_id_membership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_id_membership (user_id_, group_id_) FROM stdin;
\.


--
-- TOC entry 5702 (class 0 OID 49900)
-- Dependencies: 296
-- Data for Name: act_id_tenant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_id_tenant (id_, rev_, name_) FROM stdin;
\.


--
-- TOC entry 5703 (class 0 OID 49905)
-- Dependencies: 297
-- Data for Name: act_id_tenant_member; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_id_tenant_member (id_, tenant_id_, user_id_, group_id_) FROM stdin;
\.


--
-- TOC entry 5700 (class 0 OID 49886)
-- Dependencies: 294
-- Data for Name: act_id_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_id_user (id_, rev_, first_, last_, email_, pwd_, salt_, lock_exp_time_, attempts_, picture_id_) FROM stdin;
\.


--
-- TOC entry 5673 (class 0 OID 49379)
-- Dependencies: 267
-- Data for Name: act_re_camformdef; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_re_camformdef (id_, rev_, key_, version_, deployment_id_, resource_name_, tenant_id_) FROM stdin;
\.


--
-- TOC entry 5704 (class 0 OID 49944)
-- Dependencies: 298
-- Data for Name: act_re_case_def; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_re_case_def (id_, rev_, category_, name_, key_, version_, deployment_id_, resource_name_, dgrm_resource_name_, tenant_id_, history_ttl_) FROM stdin;
\.


--
-- TOC entry 5709 (class 0 OID 50045)
-- Dependencies: 303
-- Data for Name: act_re_decision_def; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_re_decision_def (id_, rev_, category_, name_, key_, version_, deployment_id_, resource_name_, dgrm_resource_name_, dec_req_id_, dec_req_key_, tenant_id_, history_ttl_, version_tag_) FROM stdin;
\.


--
-- TOC entry 5710 (class 0 OID 50052)
-- Dependencies: 304
-- Data for Name: act_re_decision_req_def; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_re_decision_req_def (id_, rev_, category_, name_, key_, version_, deployment_id_, resource_name_, dgrm_resource_name_, tenant_id_) FROM stdin;
\.


--
-- TOC entry 5668 (class 0 OID 49340)
-- Dependencies: 262
-- Data for Name: act_re_deployment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_re_deployment (id_, name_, deploy_time_, source_, tenant_id_) FROM stdin;
\.


--
-- TOC entry 5672 (class 0 OID 49371)
-- Dependencies: 266
-- Data for Name: act_re_procdef; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_re_procdef (id_, rev_, category_, name_, key_, version_, deployment_id_, resource_name_, dgrm_resource_name_, has_start_form_key_, suspension_state_, tenant_id_, version_tag_, history_ttl_, startable_) FROM stdin;
\.


--
-- TOC entry 5679 (class 0 OID 49421)
-- Dependencies: 273
-- Data for Name: act_ru_authorization; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_ru_authorization (id_, rev_, type_, group_id_, user_id_, resource_type_, resource_id_, perms_, removal_time_, root_proc_inst_id_) FROM stdin;
\.


--
-- TOC entry 5684 (class 0 OID 49454)
-- Dependencies: 278
-- Data for Name: act_ru_batch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_ru_batch (id_, rev_, type_, total_jobs_, jobs_created_, jobs_per_seed_, invocations_per_job_, seed_job_def_id_, batch_job_def_id_, monitor_job_def_id_, suspension_state_, configuration_, tenant_id_, create_user_id_, start_time_, exec_start_time_) FROM stdin;
\.


--
-- TOC entry 5705 (class 0 OID 49951)
-- Dependencies: 299
-- Data for Name: act_ru_case_execution; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_ru_case_execution (id_, rev_, case_inst_id_, super_case_exec_, super_exec_, business_key_, parent_id_, case_def_id_, act_id_, prev_state_, current_state_, required_, tenant_id_) FROM stdin;
\.


--
-- TOC entry 5706 (class 0 OID 49958)
-- Dependencies: 300
-- Data for Name: act_ru_case_sentry_part; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_ru_case_sentry_part (id_, rev_, case_inst_id_, case_exec_id_, sentry_id_, type_, source_case_exec_id_, standard_event_, source_, variable_event_, variable_name_, satisfied_, tenant_id_) FROM stdin;
\.


--
-- TOC entry 5677 (class 0 OID 49407)
-- Dependencies: 271
-- Data for Name: act_ru_event_subscr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_ru_event_subscr (id_, rev_, event_type_, event_name_, execution_id_, proc_inst_id_, activity_id_, configuration_, created_, tenant_id_) FROM stdin;
\.


--
-- TOC entry 5669 (class 0 OID 49347)
-- Dependencies: 263
-- Data for Name: act_ru_execution; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_ru_execution (id_, rev_, root_proc_inst_id_, proc_inst_id_, business_key_, parent_id_, proc_def_id_, super_exec_, super_case_exec_, case_inst_id_, act_id_, act_inst_id_, is_active_, is_concurrent_, is_scope_, is_event_scope_, suspension_state_, cached_ent_state_, sequence_counter_, tenant_id_) FROM stdin;
\.


--
-- TOC entry 5683 (class 0 OID 49446)
-- Dependencies: 277
-- Data for Name: act_ru_ext_task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_ru_ext_task (id_, rev_, worker_id_, topic_name_, retries_, error_msg_, error_details_id_, lock_exp_time_, create_time_, suspension_state_, execution_id_, proc_inst_id_, proc_def_id_, proc_def_key_, act_id_, act_inst_id_, tenant_id_, priority_, last_failure_log_id_) FROM stdin;
\.


--
-- TOC entry 5680 (class 0 OID 49428)
-- Dependencies: 274
-- Data for Name: act_ru_filter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_ru_filter (id_, rev_, resource_type_, name_, owner_, query_, properties_) FROM stdin;
\.


--
-- TOC entry 5675 (class 0 OID 49393)
-- Dependencies: 269
-- Data for Name: act_ru_identitylink; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_ru_identitylink (id_, rev_, group_id_, type_, user_id_, task_id_, proc_def_id_, tenant_id_) FROM stdin;
\.


--
-- TOC entry 5678 (class 0 OID 49414)
-- Dependencies: 272
-- Data for Name: act_ru_incident; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_ru_incident (id_, rev_, incident_timestamp_, incident_msg_, incident_type_, execution_id_, activity_id_, failed_activity_id_, proc_inst_id_, proc_def_id_, cause_incident_id_, root_cause_incident_id_, configuration_, tenant_id_, job_def_id_, annotation_) FROM stdin;
\.


--
-- TOC entry 5670 (class 0 OID 49354)
-- Dependencies: 264
-- Data for Name: act_ru_job; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_ru_job (id_, rev_, type_, lock_exp_time_, lock_owner_, exclusive_, execution_id_, root_proc_inst_id_, process_instance_id_, process_def_id_, process_def_key_, retries_, exception_stack_id_, exception_msg_, failed_act_id_, duedate_, repeat_, repeat_offset_, handler_type_, handler_cfg_, deployment_id_, suspension_state_, job_def_id_, priority_, sequence_counter_, tenant_id_, create_time_, last_failure_log_id_, batch_id_) FROM stdin;
\.


--
-- TOC entry 5671 (class 0 OID 49364)
-- Dependencies: 265
-- Data for Name: act_ru_jobdef; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_ru_jobdef (id_, rev_, proc_def_id_, proc_def_key_, act_id_, job_type_, job_configuration_, suspension_state_, job_priority_, tenant_id_, deployment_id_) FROM stdin;
\.


--
-- TOC entry 5681 (class 0 OID 49435)
-- Dependencies: 275
-- Data for Name: act_ru_meter_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_ru_meter_log (id_, name_, reporter_, value_, timestamp_, milliseconds_) FROM stdin;
bf6f2ab2-faab-11ef-be6f-e89c254c532f	root-process-instance-start	192.168.1.15$default	0	2025-03-06 17:55:02.984	1741280102984
bf6f2ab3-faab-11ef-be6f-e89c254c532f	activity-instance-start	192.168.1.15$default	0	2025-03-06 17:55:02.984	1741280102984
bf6f2ab4-faab-11ef-be6f-e89c254c532f	job-acquired-failure	192.168.1.15$default	0	2025-03-06 17:55:02.984	1741280102984
bf6f2ab5-faab-11ef-be6f-e89c254c532f	job-locked-exclusive	192.168.1.15$default	0	2025-03-06 17:55:02.984	1741280102984
bf6f2ab6-faab-11ef-be6f-e89c254c532f	job-execution-rejected	192.168.1.15$default	0	2025-03-06 17:55:02.984	1741280102984
bf6f2ab7-faab-11ef-be6f-e89c254c532f	executed-decision-elements	192.168.1.15$default	0	2025-03-06 17:55:02.984	1741280102984
bf6f2ab8-faab-11ef-be6f-e89c254c532f	activity-instance-end	192.168.1.15$default	0	2025-03-06 17:55:02.984	1741280102984
bf6f2ab9-faab-11ef-be6f-e89c254c532f	job-successful	192.168.1.15$default	0	2025-03-06 17:55:02.984	1741280102984
bf6f2aba-faab-11ef-be6f-e89c254c532f	job-acquired-success	192.168.1.15$default	0	2025-03-06 17:55:02.984	1741280102984
bf6f2abb-faab-11ef-be6f-e89c254c532f	job-acquisition-attempt	192.168.1.15$default	11	2025-03-06 17:55:02.984	1741280102984
bf6f2abc-faab-11ef-be6f-e89c254c532f	executed-decision-instances	192.168.1.15$default	0	2025-03-06 17:55:02.984	1741280102984
bf6f2abd-faab-11ef-be6f-e89c254c532f	job-failed	192.168.1.15$default	0	2025-03-06 17:55:02.984	1741280102984
\.


--
-- TOC entry 5674 (class 0 OID 49386)
-- Dependencies: 268
-- Data for Name: act_ru_task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_ru_task (id_, rev_, execution_id_, proc_inst_id_, proc_def_id_, case_execution_id_, case_inst_id_, case_def_id_, name_, parent_task_id_, description_, task_def_key_, owner_, assignee_, delegation_, priority_, create_time_, last_updated_, due_date_, follow_up_date_, suspension_state_, tenant_id_, task_state_) FROM stdin;
\.


--
-- TOC entry 5682 (class 0 OID 49441)
-- Dependencies: 276
-- Data for Name: act_ru_task_meter_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_ru_task_meter_log (id_, assignee_hash_, timestamp_) FROM stdin;
\.


--
-- TOC entry 5676 (class 0 OID 49400)
-- Dependencies: 270
-- Data for Name: act_ru_variable; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_ru_variable (id_, rev_, type_, name_, execution_id_, proc_inst_id_, proc_def_id_, case_execution_id_, case_inst_id_, task_id_, batch_id_, bytearray_id_, double_, long_, text_, text2_, var_scope_, sequence_counter_, is_concurrent_local_, tenant_id_) FROM stdin;
\.


--
-- TOC entry 5658 (class 0 OID 44296)
-- Dependencies: 252
-- Data for Name: adher_pm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.adher_pm (id) FROM stdin;
\.


--
-- TOC entry 5634 (class 0 OID 44097)
-- Dependencies: 228
-- Data for Name: adherent_contact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.adherent_contact (adherent_id, contact_id) FROM stdin;
\.


--
-- TOC entry 5660 (class 0 OID 44310)
-- Dependencies: 254
-- Data for Name: contrat_etape4caution; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contrat_etape4caution (id, caution_amount, caution_type) FROM stdin;
\.


--
-- TOC entry 5662 (class 0 OID 44316)
-- Dependencies: 256
-- Data for Name: contrat_etape4caution_pm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contrat_etape4caution_pm (id, caution_pm_amount, caution_pm_type) FROM stdin;
\.


--
-- TOC entry 5664 (class 0 OID 44322)
-- Dependencies: 258
-- Data for Name: contrat_old_no; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contrat_old_no (id, contrat_old_no) FROM stdin;
\.


--
-- TOC entry 5635 (class 0 OID 44100)
-- Dependencies: 229
-- Data for Name: personne_morale_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personne_morale_roles (personne_morale_id, indvidu_roles) FROM stdin;
\.


--
-- TOC entry 5636 (class 0 OID 44104)
-- Dependencies: 230
-- Data for Name: personne_physique_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personne_physique_roles (personne_physique_id, indvidu_roles) FROM stdin;
\.


--
-- TOC entry 5637 (class 0 OID 44108)
-- Dependencies: 231
-- Data for Name: x_activite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.x_activite (x_activite_id, x_activite_code, x_activite_dsg, sys_adr_ip, sys_date, sys_user, sys_user_id) FROM stdin;
\.


--
-- TOC entry 5638 (class 0 OID 44115)
-- Dependencies: 232
-- Data for Name: x_forme_juridique; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.x_forme_juridique (x_forme_juridique_id, x_forme_juridique_code, x_forme_juridique_dsg, sys_adr_ip, sys_date, sys_user, sys_user_id) FROM stdin;
\.


--
-- TOC entry 5639 (class 0 OID 44122)
-- Dependencies: 233
-- Data for Name: x_groupe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.x_groupe (x_groupe_id, x_groupe_code_bct, x_groupe_code_interne, x_groupe_dsg, sys_adresse_ip, sys_date, sys_user, sys_user_id) FROM stdin;
\.


--
-- TOC entry 5640 (class 0 OID 44129)
-- Dependencies: 234
-- Data for Name: x_nationalite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.x_nationalite (x_nationalite_id, x_nationalite_code_alpha, x_nationalite_dsg, x_nationalite_code_num, sys_adr_ip, sys_date, sys_user, sys_user_id) FROM stdin;
\.


--
-- TOC entry 5642 (class 0 OID 44137)
-- Dependencies: 236
-- Data for Name: x_profession; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.x_profession (x_profession_id, x_profession_code, x_profession_dsg, sys_adr_ip, sys_date, sys_user, sys_user_id) FROM stdin;
\.


--
-- TOC entry 5643 (class 0 OID 44144)
-- Dependencies: 237
-- Data for Name: x_situation_judiciaire; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.x_situation_judiciaire (x_situation_judiciaire_id, x_situation_judiciaire_code, x_situation_judiciaire_dsg, sys_adr_ip, sys_date, sys_user, sys_user_id) FROM stdin;
\.


--
-- TOC entry 5644 (class 0 OID 44151)
-- Dependencies: 238
-- Data for Name: x_type_personne_morale; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.x_type_personne_morale (x_type_pm_id, x_type_pm_code, x_type_pm_dsg, sys_adr_ip, sys_date, sys_user, sys_user_id) FROM stdin;
\.


--
-- TOC entry 5645 (class 0 OID 44158)
-- Dependencies: 239
-- Data for Name: x_type_piece_identité; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."x_type_piece_identité" (x_type_piece_ident_id, x_type_piece_ident_code, x_type_piece_ident_dsg, x_type_piece_ident_bool_pm_tun, x_type_piece_ident_bool_pp_etr, x_type_piece_ident_bool_pp_etr_non_res, x_type_piece_ident_bool_pp_etr_res, x_type_piece_ident_bool_pp_tun, sys_adr_ip, sys_date, sys_user, sys_user_id, x_type_piece_ident_taille) FROM stdin;
102	CIN	CIN	t	f	f	t	t	127.0.0.1	2025-03-02 01:00:00	admin	1	8
103	RNE	RNE	t	t	t	f	f	127.0.0.1	2025-03-02 01:00:00	admin	1	12
104	SEJOUR	CARTE SEJOUR	t	t	f	t	f	127.0.0.1	2025-03-02 01:00:00	admin	1	10
\.


--
-- TOC entry 5646 (class 0 OID 44165)
-- Dependencies: 240
-- Data for Name: y_pm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.y_pm (id, y_pm_adresse, y_pm_bool_assureur, y_pm_bool_commerce, y_pm_email, y_pm_bool_exempt_fatca, y_pm_bool_exempt_rs, y_pm_exempt_rs_date_deb, y_pm_exempt_rs_date_fin, y_pm_bool_exempt_tva, y_pm_exempt_tva_date_deb, y_pm_exempt_tva_date_fin, y_pm_fin_activite_date, y_pm_info_libre, y_pm_matricule_fiscal, y_pm_piece_ident_num, y_pm_piece_ident_autorite, y_pm_piece_ident_deliv_date, y_pm_piece_ident_deliv_lieu, y_pm_piece_ident_exripe_date, y_pp_creation_date, y_pp_creation_lieu, y_pp_bool_resident, y_pp_bool_tun, y_pm_pub, y_pm_raison_sociale, y_pm_sigle, y_pm_site_web, sys_adr_ip, sys_date, sys_user, sys_user_id, y_pm_tel_no, y_pm_ville, x_type_piece_ident_id_fk, x_activite_id_fk, x_forme_juridique_id_fk, x_groupe_id_fk, x_nationalite_id_fk, x_situation_judiciaire_id_fk, x_type_pm_id_fk, archiver) FROM stdin;
52	123 Rue Centrale	f	f	contact@medfactor.com	f	\N	\N	\N	f	\N	\N	\N	\N	\N	123456789	\N	\N	\N	\N	\N	\N	f	f	f	MedFactor Corp	MFC	\N	0:0:0:0:0:0:0:1	2025-02-19 13:00:00	admin2@gmail.com	1	+21698765432	Tunis	103	\N	\N	\N	\N	\N	\N	f
153	123 Rue Centrale	f	f	contact@medfactor.com	f	\N	\N	\N	f	\N	\N	\N	\N	\N	234568889	\N	\N	\N	\N	\N	\N	f	f	f	MedFactor Corp	MFC	\N	0:0:0:0:0:0:0:1	2025-02-19 13:00:00	aa@gmail.com	404	+21698765432	Tunis	103	\N	\N	\N	\N	\N	\N	t
202	123 Rue Centrale	f	f	contact@medfactor.com	f	\N	\N	\N	f	\N	\N	\N	\N	\N	234D68889	\N	\N	\N	\N	\N	\N	f	f	f	MedFactor Corp	MFC	\N	0:0:0:0:0:0:0:1	2025-02-19 13:00:00	admin2@gmail.com	1	+21698765432	Tunis	103	\N	\N	\N	\N	\N	\N	t
256	e	f	f	a@gmail.com	f	\N	\N	\N	f	\N	\N	\N	\N	\N	eee2	\N	\N	\N	\N	\N	\N	f	f	f	edd	e	\N	0:0:0:0:0:0:0:1	2025-02-20 11:35:31.153	aa@gmail.com	404	212121222	e	103	\N	\N	\N	\N	\N	\N	t
102	123 Rue Centrale	f	f	contact@medfactor.com	f	\N	\N	\N	f	\N	\N	\N	\N	74	1234568889	\N	\N	\N	\N	\N	\N	f	f	f	MedFactor Corp	MFC	\N	0:0:0:0:0:0:0:1	2025-02-19 13:00:00	admin2@gmail.com	1	+21698765432	Tunis	103	\N	\N	\N	\N	\N	\N	f
152	123 Rue Centrale	f	f	contact@medfactor.com	f	\N	\N	\N	f	\N	\N	\N	\N	777	134568889	\N	\N	\N	\N	\N	\N	f	f	f	MedFactor Corp	MFC	\N	0:0:0:0:0:0:0:1	2025-02-19 13:00:00	admin2@gmail.com	1	+21698765432	Tunis	103	\N	\N	\N	\N	\N	\N	f
302	123 Rue Centrale	f	f	admin@gmail.com	f	\N	\N	\N	f	\N	\N	\N	\N	888ee	85247962	\N	\N	\N	\N	\N	\N	f	f	f	MedFactor Corp	MFC	\N	0:0:0:0:0:0:0:1	2025-03-02 17:41:03.879	admin2@gmail.com	1	21212121	NABEL	103	\N	\N	\N	\N	\N	\N	f
352	123 Rue Centrale	f	f	mghirbiah@gmail.com	f	\N	\N	\N	f	\N	\N	\N	\N	fffff	1112223S	\N	\N	\N	\N	\N	\N	f	f	f	MedFactor Corp	DD	\N	0:0:0:0:0:0:0:1	2025-03-04 15:42:00.301	admin2@gmail.com	1	21212121	Tunis	103	\N	\N	\N	\N	\N	\N	f
353	dd	f	f	mgj@gmail.com	f	\N	\N	\N	f	\N	\N	\N	\N	ddddd	1234567B	\N	\N	\N	\N	\N	\N	f	f	f	MedFactor Corp	5	\N	0:0:0:0:0:0:0:1	2025-03-04 15:43:55.623	admin2@gmail.com	1	11457987	ddd	103	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 5648 (class 0 OID 44173)
-- Dependencies: 242
-- Data for Name: y_pp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.y_pp (id, y_pp_email, acheteur, y_pp_adresse, y_pp_alias, contact, y_pp_deces_date, y_pp_bool_exempt_fatca, y_pp_bool_exempt_rs, y_pp_exempt_rs_date_deb, y_pp_exempt_rs_date_fin, y_pp_bool_exempt_tva, y_pp_exempt_tva_date_deb, y_pp_exempt_tva_date_fin, y_pp_genree, y_pp_info_libre, y_pp_naissance_date, y_pp_naissance_lieu, y_pp_nom, y_pp_piece_ident_num, y_pp_piece_ident_autorite, y_pp_piece_ident_deliv_date, y_pp_piece_ident_deliv_lieue, y_pp_piece_ident_exripe_date, y_pp_prenom, y_pp_bool_resident, sys_adr_ip, sys_date, sys_user, sys_user_id, y_pp_tel_mobile_no, y_pp_bool_tun, x_type_piece_ident_id_fk, x_nationalite_id_fk, x_profession_id_fk, archiver) FROM stdin;
1	\N	f	123 Main Street	\N	f	f	f	\N	\N	\N	f	\N	\N	\N	\N	2025-03-01 01:00:00	\N	Do	123456789	\N	\N	\N	\N	John	f	0:0:0:0:0:0:0:1	\N	admin2@gmail.com	1	\N	f	102	\N	\N	f
2	\N	f	123 Main Street	\N	f	f	f	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	Doe	12456789	\N	\N	\N	\N	John	f	0:0:0:0:0:0:0:1	2025-02-20 09:51:51.101	admin2@gmail.com	1	\N	f	102	\N	\N	t
3	\N	f	dar 	\N	f	f	f	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	dd	dd	\N	\N	\N	\N	dd	f	0:0:0:0:0:0:0:1	2025-02-20 11:19:35.565	aa@gmail.com	404	\N	f	102	\N	\N	t
4	\N	f	jooohjh	\N	f	f	f	\N	\N	\N	f	\N	\N	\N	\N	2025-02-07 01:00:00	\N	ahmed	12345678	\N	\N	\N	\N	mghirbi	f	0:0:0:0:0:0:0:1	2025-02-26 10:24:35.46	admin2@gmail.com	1	\N	f	102	\N	\N	f
5	\N	f	de	\N	f	f	f	\N	\N	\N	f	\N	\N	\N	\N	2025-02-01 01:00:00	\N	mghirbi	157849652	\N	\N	\N	\N	dalini	f	0:0:0:0:0:0:0:1	2025-02-27 23:27:49.299	i@gmail.com	452	\N	f	102	\N	\N	f
6	\N	f	123 Rue Centrale	\N	f	f	f	\N	\N	\N	f	\N	\N	\N	\N	2003-10-03 01:00:00	\N	ahmed	14437249	\N	\N	\N	\N	ben ali 	f	0:0:0:0:0:0:0:1	2025-03-04 16:09:40.821	admin2@gmail.com	1	\N	f	103	\N	\N	f
7	\N	f	123 Rue Centrale	\N	f	f	f	\N	\N	\N	f	\N	\N	\N	\N	0001-05-01 01:00:00	\N	ahmed	14437249	\N	\N	\N	\N	ahmed	f	0:0:0:0:0:0:0:1	2025-03-04 16:10:11.542	admin2@gmail.com	1	\N	f	102	\N	\N	t
13	\N	f	d	\N	f	f	f	\N	\N	\N	f	\N	\N	\N	\N	2005-05-05 02:00:00	\N	dd	12344455	\N	\N	\N	\N	mg	f	0:0:0:0:0:0:0:1	2025-03-04 16:28:46.549	admin2@gmail.com	1	\N	f	102	\N	\N	f
\.


--
-- TOC entry 5719 (class 0 OID 0)
-- Dependencies: 218
-- Name: activite_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activite_seq', 1, false);


--
-- TOC entry 5720 (class 0 OID 0)
-- Dependencies: 251
-- Name: adher_pm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.adher_pm_id_seq', 1, false);


--
-- TOC entry 5721 (class 0 OID 0)
-- Dependencies: 253
-- Name: contrat_etape4caution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contrat_etape4caution_id_seq', 1, false);


--
-- TOC entry 5722 (class 0 OID 0)
-- Dependencies: 255
-- Name: contrat_etape4caution_pm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contrat_etape4caution_pm_id_seq', 1, false);


--
-- TOC entry 5723 (class 0 OID 0)
-- Dependencies: 257
-- Name: contrat_old_no_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contrat_old_no_id_seq', 1, false);


--
-- TOC entry 5724 (class 0 OID 0)
-- Dependencies: 219
-- Name: forme_juridique_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forme_juridique_seq', 1, false);


--
-- TOC entry 5725 (class 0 OID 0)
-- Dependencies: 220
-- Name: groupe_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groupe_seq', 1, false);


--
-- TOC entry 5726 (class 0 OID 0)
-- Dependencies: 221
-- Name: nationalite_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nationalite_seq', 1, false);


--
-- TOC entry 5727 (class 0 OID 0)
-- Dependencies: 222
-- Name: personne_morale_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personne_morale_seq', 1, false);


--
-- TOC entry 5728 (class 0 OID 0)
-- Dependencies: 217
-- Name: personne_physique_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personne_physique_seq', 1, false);


--
-- TOC entry 5729 (class 0 OID 0)
-- Dependencies: 223
-- Name: situation_judiciaire_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.situation_judiciaire_seq', 1, false);


--
-- TOC entry 5730 (class 0 OID 0)
-- Dependencies: 224
-- Name: type_personne_morale_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_personne_morale_seq', 1, false);


--
-- TOC entry 5731 (class 0 OID 0)
-- Dependencies: 225
-- Name: type_piece_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_piece_id_seq', 1, false);


--
-- TOC entry 5732 (class 0 OID 0)
-- Dependencies: 243
-- Name: x_activite_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.x_activite_seq', 1, false);


--
-- TOC entry 5733 (class 0 OID 0)
-- Dependencies: 244
-- Name: x_forme_juridique_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.x_forme_juridique_seq', 1, false);


--
-- TOC entry 5734 (class 0 OID 0)
-- Dependencies: 245
-- Name: x_groupe_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.x_groupe_seq', 1, false);


--
-- TOC entry 5735 (class 0 OID 0)
-- Dependencies: 246
-- Name: x_nationalite_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.x_nationalite_seq', 1, false);


--
-- TOC entry 5736 (class 0 OID 0)
-- Dependencies: 235
-- Name: x_profession_x_profession_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.x_profession_x_profession_id_seq', 1, false);


--
-- TOC entry 5737 (class 0 OID 0)
-- Dependencies: 247
-- Name: x_situation_judiciaire_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.x_situation_judiciaire_seq', 1, false);


--
-- TOC entry 5738 (class 0 OID 0)
-- Dependencies: 248
-- Name: x_type_personne_morale_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.x_type_personne_morale_seq', 1, false);


--
-- TOC entry 5739 (class 0 OID 0)
-- Dependencies: 249
-- Name: x_type_piece_identité_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."x_type_piece_identité_seq"', 151, true);


--
-- TOC entry 5740 (class 0 OID 0)
-- Dependencies: 250
-- Name: y_pm_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.y_pm_seq', 401, true);


--
-- TOC entry 5741 (class 0 OID 0)
-- Dependencies: 241
-- Name: y_pp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.y_pp_id_seq', 14, true);


--
-- TOC entry 5044 (class 2606 OID 44091)
-- Name: _adherent_acheteur _adherent_acheteur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._adherent_acheteur
    ADD CONSTRAINT _adherent_acheteur_pkey PRIMARY KEY (acheteur_morale_id, acheteur_physique_id, adherent_id);


--
-- TOC entry 5046 (class 2606 OID 44096)
-- Name: _adherent_fournisseur _adherent_fournisseur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._adherent_fournisseur
    ADD CONSTRAINT _adherent_fournisseur_pkey PRIMARY KEY (fournisseur_morale_id, fournisseur_physique_id, adherent_id);


--
-- TOC entry 5082 (class 2606 OID 49334)
-- Name: act_ge_bytearray act_ge_bytearray_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ge_bytearray
    ADD CONSTRAINT act_ge_bytearray_pkey PRIMARY KEY (id_);


--
-- TOC entry 5080 (class 2606 OID 49327)
-- Name: act_ge_property act_ge_property_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ge_property
    ADD CONSTRAINT act_ge_property_pkey PRIMARY KEY (name_);


--
-- TOC entry 5088 (class 2606 OID 49339)
-- Name: act_ge_schema_log act_ge_schema_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ge_schema_log
    ADD CONSTRAINT act_ge_schema_log_pkey PRIMARY KEY (id_);


--
-- TOC entry 5218 (class 2606 OID 49692)
-- Name: act_hi_actinst act_hi_actinst_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_hi_actinst
    ADD CONSTRAINT act_hi_actinst_pkey PRIMARY KEY (id_);


--
-- TOC entry 5285 (class 2606 OID 49734)
-- Name: act_hi_attachment act_hi_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_hi_attachment
    ADD CONSTRAINT act_hi_attachment_pkey PRIMARY KEY (id_);


--
-- TOC entry 5324 (class 2606 OID 49763)
-- Name: act_hi_batch act_hi_batch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_hi_batch
    ADD CONSTRAINT act_hi_batch_pkey PRIMARY KEY (id_);


--
-- TOC entry 5377 (class 2606 OID 50037)
-- Name: act_hi_caseactinst act_hi_caseactinst_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_hi_caseactinst
    ADD CONSTRAINT act_hi_caseactinst_pkey PRIMARY KEY (id_);


--
-- TOC entry 5370 (class 2606 OID 50030)
-- Name: act_hi_caseinst act_hi_caseinst_case_inst_id__key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_hi_caseinst
    ADD CONSTRAINT act_hi_caseinst_case_inst_id__key UNIQUE (case_inst_id_);


--
-- TOC entry 5372 (class 2606 OID 50028)
-- Name: act_hi_caseinst act_hi_caseinst_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_hi_caseinst
    ADD CONSTRAINT act_hi_caseinst_pkey PRIMARY KEY (id_);


--
-- TOC entry 5279 (class 2606 OID 49727)
-- Name: act_hi_comment act_hi_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_hi_comment
    ADD CONSTRAINT act_hi_comment_pkey PRIMARY KEY (id_);


--
-- TOC entry 5405 (class 2606 OID 50080)
-- Name: act_hi_dec_in act_hi_dec_in_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_hi_dec_in
    ADD CONSTRAINT act_hi_dec_in_pkey PRIMARY KEY (id_);


--
-- TOC entry 5411 (class 2606 OID 50087)
-- Name: act_hi_dec_out act_hi_dec_out_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_hi_dec_out
    ADD CONSTRAINT act_hi_dec_out_pkey PRIMARY KEY (id_);


--
-- TOC entry 5390 (class 2606 OID 50073)
-- Name: act_hi_decinst act_hi_decinst_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_hi_decinst
    ADD CONSTRAINT act_hi_decinst_pkey PRIMARY KEY (id_);


--
-- TOC entry 5253 (class 2606 OID 49713)
-- Name: act_hi_detail act_hi_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_hi_detail
    ADD CONSTRAINT act_hi_detail_pkey PRIMARY KEY (id_);


--
-- TOC entry 5326 (class 2606 OID 49771)
-- Name: act_hi_ext_task_log act_hi_ext_task_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_hi_ext_task_log
    ADD CONSTRAINT act_hi_ext_task_log_pkey PRIMARY KEY (id_);


--
-- TOC entry 5269 (class 2606 OID 49720)
-- Name: act_hi_identitylink act_hi_identitylink_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_hi_identitylink
    ADD CONSTRAINT act_hi_identitylink_pkey PRIMARY KEY (id_);


--
-- TOC entry 5303 (class 2606 OID 49748)
-- Name: act_hi_incident act_hi_incident_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_hi_incident
    ADD CONSTRAINT act_hi_incident_pkey PRIMARY KEY (id_);


--
-- TOC entry 5312 (class 2606 OID 49756)
-- Name: act_hi_job_log act_hi_job_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_hi_job_log
    ADD CONSTRAINT act_hi_job_log_pkey PRIMARY KEY (id_);


--
-- TOC entry 5292 (class 2606 OID 49741)
-- Name: act_hi_op_log act_hi_op_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_hi_op_log
    ADD CONSTRAINT act_hi_op_log_pkey PRIMARY KEY (id_);


--
-- TOC entry 5205 (class 2606 OID 49683)
-- Name: act_hi_procinst act_hi_procinst_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_hi_procinst
    ADD CONSTRAINT act_hi_procinst_pkey PRIMARY KEY (id_);


--
-- TOC entry 5207 (class 2606 OID 49685)
-- Name: act_hi_procinst act_hi_procinst_proc_inst_id__key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_hi_procinst
    ADD CONSTRAINT act_hi_procinst_proc_inst_id__key UNIQUE (proc_inst_id_);


--
-- TOC entry 5230 (class 2606 OID 49699)
-- Name: act_hi_taskinst act_hi_taskinst_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_hi_taskinst
    ADD CONSTRAINT act_hi_taskinst_pkey PRIMARY KEY (id_);


--
-- TOC entry 5240 (class 2606 OID 49706)
-- Name: act_hi_varinst act_hi_varinst_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_hi_varinst
    ADD CONSTRAINT act_hi_varinst_pkey PRIMARY KEY (id_);


--
-- TOC entry 5335 (class 2606 OID 49880)
-- Name: act_id_group act_id_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_id_group
    ADD CONSTRAINT act_id_group_pkey PRIMARY KEY (id_);


--
-- TOC entry 5343 (class 2606 OID 49899)
-- Name: act_id_info act_id_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_id_info
    ADD CONSTRAINT act_id_info_pkey PRIMARY KEY (id_);


--
-- TOC entry 5337 (class 2606 OID 49885)
-- Name: act_id_membership act_id_membership_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_id_membership
    ADD CONSTRAINT act_id_membership_pkey PRIMARY KEY (user_id_, group_id_);


--
-- TOC entry 5347 (class 2606 OID 49909)
-- Name: act_id_tenant_member act_id_tenant_member_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_id_tenant_member
    ADD CONSTRAINT act_id_tenant_member_pkey PRIMARY KEY (id_);


--
-- TOC entry 5345 (class 2606 OID 49904)
-- Name: act_id_tenant act_id_tenant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_id_tenant
    ADD CONSTRAINT act_id_tenant_pkey PRIMARY KEY (id_);


--
-- TOC entry 5341 (class 2606 OID 49892)
-- Name: act_id_user act_id_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_id_user
    ADD CONSTRAINT act_id_user_pkey PRIMARY KEY (id_);


--
-- TOC entry 5122 (class 2606 OID 49385)
-- Name: act_re_camformdef act_re_camformdef_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_re_camformdef
    ADD CONSTRAINT act_re_camformdef_pkey PRIMARY KEY (id_);


--
-- TOC entry 5357 (class 2606 OID 49950)
-- Name: act_re_case_def act_re_case_def_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_re_case_def
    ADD CONSTRAINT act_re_case_def_pkey PRIMARY KEY (id_);


--
-- TOC entry 5385 (class 2606 OID 50051)
-- Name: act_re_decision_def act_re_decision_def_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_re_decision_def
    ADD CONSTRAINT act_re_decision_def_pkey PRIMARY KEY (id_);


--
-- TOC entry 5388 (class 2606 OID 50058)
-- Name: act_re_decision_req_def act_re_decision_req_def_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_re_decision_req_def
    ADD CONSTRAINT act_re_decision_req_def_pkey PRIMARY KEY (id_);


--
-- TOC entry 5092 (class 2606 OID 49346)
-- Name: act_re_deployment act_re_deployment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_re_deployment
    ADD CONSTRAINT act_re_deployment_pkey PRIMARY KEY (id_);


--
-- TOC entry 5120 (class 2606 OID 49378)
-- Name: act_re_procdef act_re_procdef_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_re_procdef
    ADD CONSTRAINT act_re_procdef_pkey PRIMARY KEY (id_);


--
-- TOC entry 5175 (class 2606 OID 49427)
-- Name: act_ru_authorization act_ru_authorization_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_authorization
    ADD CONSTRAINT act_ru_authorization_pkey PRIMARY KEY (id_);


--
-- TOC entry 5203 (class 2606 OID 49460)
-- Name: act_ru_batch act_ru_batch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_batch
    ADD CONSTRAINT act_ru_batch_pkey PRIMARY KEY (id_);


--
-- TOC entry 5364 (class 2606 OID 49957)
-- Name: act_ru_case_execution act_ru_case_execution_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_case_execution
    ADD CONSTRAINT act_ru_case_execution_pkey PRIMARY KEY (id_);


--
-- TOC entry 5368 (class 2606 OID 49964)
-- Name: act_ru_case_sentry_part act_ru_case_sentry_part_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_case_sentry_part
    ADD CONSTRAINT act_ru_case_sentry_part_pkey PRIMARY KEY (id_);


--
-- TOC entry 5159 (class 2606 OID 49413)
-- Name: act_ru_event_subscr act_ru_event_subscr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_event_subscr
    ADD CONSTRAINT act_ru_event_subscr_pkey PRIMARY KEY (id_);


--
-- TOC entry 5101 (class 2606 OID 49353)
-- Name: act_ru_execution act_ru_execution_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_execution
    ADD CONSTRAINT act_ru_execution_pkey PRIMARY KEY (id_);


--
-- TOC entry 5198 (class 2606 OID 49453)
-- Name: act_ru_ext_task act_ru_ext_task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_ext_task
    ADD CONSTRAINT act_ru_ext_task_pkey PRIMARY KEY (id_);


--
-- TOC entry 5181 (class 2606 OID 49434)
-- Name: act_ru_filter act_ru_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_filter
    ADD CONSTRAINT act_ru_filter_pkey PRIMARY KEY (id_);


--
-- TOC entry 5140 (class 2606 OID 49399)
-- Name: act_ru_identitylink act_ru_identitylink_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_identitylink
    ADD CONSTRAINT act_ru_identitylink_pkey PRIMARY KEY (id_);


--
-- TOC entry 5169 (class 2606 OID 49420)
-- Name: act_ru_incident act_ru_incident_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_incident
    ADD CONSTRAINT act_ru_incident_pkey PRIMARY KEY (id_);


--
-- TOC entry 5111 (class 2606 OID 49363)
-- Name: act_ru_job act_ru_job_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_job
    ADD CONSTRAINT act_ru_job_pkey PRIMARY KEY (id_);


--
-- TOC entry 5115 (class 2606 OID 49370)
-- Name: act_ru_jobdef act_ru_jobdef_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_jobdef
    ADD CONSTRAINT act_ru_jobdef_pkey PRIMARY KEY (id_);


--
-- TOC entry 5188 (class 2606 OID 49440)
-- Name: act_ru_meter_log act_ru_meter_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_meter_log
    ADD CONSTRAINT act_ru_meter_log_pkey PRIMARY KEY (id_);


--
-- TOC entry 5191 (class 2606 OID 49445)
-- Name: act_ru_task_meter_log act_ru_task_meter_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_task_meter_log
    ADD CONSTRAINT act_ru_task_meter_log_pkey PRIMARY KEY (id_);


--
-- TOC entry 5134 (class 2606 OID 49392)
-- Name: act_ru_task act_ru_task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_task
    ADD CONSTRAINT act_ru_task_pkey PRIMARY KEY (id_);


--
-- TOC entry 5151 (class 2606 OID 49406)
-- Name: act_ru_variable act_ru_variable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_variable
    ADD CONSTRAINT act_ru_variable_pkey PRIMARY KEY (id_);


--
-- TOC entry 5177 (class 2606 OID 49620)
-- Name: act_ru_authorization act_uniq_auth_group; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_authorization
    ADD CONSTRAINT act_uniq_auth_group UNIQUE (type_, group_id_, resource_type_, resource_id_);


--
-- TOC entry 5179 (class 2606 OID 49618)
-- Name: act_ru_authorization act_uniq_auth_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_authorization
    ADD CONSTRAINT act_uniq_auth_user UNIQUE (type_, user_id_, resource_type_, resource_id_);


--
-- TOC entry 5352 (class 2606 OID 49925)
-- Name: act_id_tenant_member act_uniq_tenant_memb_group; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_id_tenant_member
    ADD CONSTRAINT act_uniq_tenant_memb_group UNIQUE (tenant_id_, group_id_);


--
-- TOC entry 5354 (class 2606 OID 49923)
-- Name: act_id_tenant_member act_uniq_tenant_memb_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_id_tenant_member
    ADD CONSTRAINT act_uniq_tenant_memb_user UNIQUE (tenant_id_, user_id_);


--
-- TOC entry 5153 (class 2606 OID 49622)
-- Name: act_ru_variable act_uniq_variable; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_variable
    ADD CONSTRAINT act_uniq_variable UNIQUE (var_scope_, name_);


--
-- TOC entry 5072 (class 2606 OID 44300)
-- Name: adher_pm adher_pm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adher_pm
    ADD CONSTRAINT adher_pm_pkey PRIMARY KEY (id);


--
-- TOC entry 5074 (class 2606 OID 44314)
-- Name: contrat_etape4caution contrat_etape4caution_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contrat_etape4caution
    ADD CONSTRAINT contrat_etape4caution_pkey PRIMARY KEY (id);


--
-- TOC entry 5076 (class 2606 OID 44320)
-- Name: contrat_etape4caution_pm contrat_etape4caution_pm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contrat_etape4caution_pm
    ADD CONSTRAINT contrat_etape4caution_pm_pkey PRIMARY KEY (id);


--
-- TOC entry 5078 (class 2606 OID 44326)
-- Name: contrat_old_no contrat_old_no_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contrat_old_no
    ADD CONSTRAINT contrat_old_no_pkey PRIMARY KEY (id);


--
-- TOC entry 5068 (class 2606 OID 44184)
-- Name: y_pp ukgx5fvq4e3sh8h3e1fadkkmwan; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.y_pp
    ADD CONSTRAINT ukgx5fvq4e3sh8h3e1fadkkmwan UNIQUE (y_pp_piece_ident_num, x_type_piece_ident_id_fk);


--
-- TOC entry 5064 (class 2606 OID 44182)
-- Name: y_pm ukkk875m3s3bcxvitwqr7o6qdrw; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.y_pm
    ADD CONSTRAINT ukkk875m3s3bcxvitwqr7o6qdrw UNIQUE (y_pm_piece_ident_num, x_type_piece_ident_id_fk);


--
-- TOC entry 5048 (class 2606 OID 44114)
-- Name: x_activite x_activite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.x_activite
    ADD CONSTRAINT x_activite_pkey PRIMARY KEY (x_activite_id);


--
-- TOC entry 5050 (class 2606 OID 44121)
-- Name: x_forme_juridique x_forme_juridique_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.x_forme_juridique
    ADD CONSTRAINT x_forme_juridique_pkey PRIMARY KEY (x_forme_juridique_id);


--
-- TOC entry 5052 (class 2606 OID 44128)
-- Name: x_groupe x_groupe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.x_groupe
    ADD CONSTRAINT x_groupe_pkey PRIMARY KEY (x_groupe_id);


--
-- TOC entry 5054 (class 2606 OID 44135)
-- Name: x_nationalite x_nationalite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.x_nationalite
    ADD CONSTRAINT x_nationalite_pkey PRIMARY KEY (x_nationalite_id);


--
-- TOC entry 5056 (class 2606 OID 44143)
-- Name: x_profession x_profession_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.x_profession
    ADD CONSTRAINT x_profession_pkey PRIMARY KEY (x_profession_id);


--
-- TOC entry 5058 (class 2606 OID 44150)
-- Name: x_situation_judiciaire x_situation_judiciaire_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.x_situation_judiciaire
    ADD CONSTRAINT x_situation_judiciaire_pkey PRIMARY KEY (x_situation_judiciaire_id);


--
-- TOC entry 5060 (class 2606 OID 44157)
-- Name: x_type_personne_morale x_type_personne_morale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.x_type_personne_morale
    ADD CONSTRAINT x_type_personne_morale_pkey PRIMARY KEY (x_type_pm_id);


--
-- TOC entry 5062 (class 2606 OID 44164)
-- Name: x_type_piece_identité x_type_piece_identité_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."x_type_piece_identité"
    ADD CONSTRAINT "x_type_piece_identité_pkey" PRIMARY KEY (x_type_piece_ident_id);


--
-- TOC entry 5066 (class 2606 OID 44171)
-- Name: y_pm y_pm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.y_pm
    ADD CONSTRAINT y_pm_pkey PRIMARY KEY (id);


--
-- TOC entry 5070 (class 2606 OID 44180)
-- Name: y_pp y_pp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.y_pp
    ADD CONSTRAINT y_pp_pkey PRIMARY KEY (id);


--
-- TOC entry 5322 (class 1259 OID 49848)
-- Name: act_hi_bat_rm_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_hi_bat_rm_time ON public.act_hi_batch USING btree (removal_time_);


--
-- TOC entry 5327 (class 1259 OID 49852)
-- Name: act_hi_ext_task_log_proc_def_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_hi_ext_task_log_proc_def_key ON public.act_hi_ext_task_log USING btree (proc_def_key_);


--
-- TOC entry 5328 (class 1259 OID 49851)
-- Name: act_hi_ext_task_log_procdef; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_hi_ext_task_log_procdef ON public.act_hi_ext_task_log USING btree (proc_def_id_);


--
-- TOC entry 5329 (class 1259 OID 49850)
-- Name: act_hi_ext_task_log_procinst; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_hi_ext_task_log_procinst ON public.act_hi_ext_task_log USING btree (proc_inst_id_);


--
-- TOC entry 5330 (class 1259 OID 49855)
-- Name: act_hi_ext_task_log_rm_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_hi_ext_task_log_rm_time ON public.act_hi_ext_task_log USING btree (removal_time_);


--
-- TOC entry 5331 (class 1259 OID 49849)
-- Name: act_hi_ext_task_log_root_pi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_hi_ext_task_log_root_pi ON public.act_hi_ext_task_log USING btree (root_proc_inst_id_);


--
-- TOC entry 5332 (class 1259 OID 49853)
-- Name: act_hi_ext_task_log_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_hi_ext_task_log_tenant_id ON public.act_hi_ext_task_log USING btree (tenant_id_);


--
-- TOC entry 5135 (class 1259 OID 49532)
-- Name: act_idx_athrz_procedef; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_athrz_procedef ON public.act_ru_identitylink USING btree (proc_def_id_);


--
-- TOC entry 5170 (class 1259 OID 49494)
-- Name: act_idx_auth_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_auth_group_id ON public.act_ru_authorization USING btree (group_id_);


--
-- TOC entry 5171 (class 1259 OID 49662)
-- Name: act_idx_auth_resource_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_auth_resource_id ON public.act_ru_authorization USING btree (resource_id_);


--
-- TOC entry 5172 (class 1259 OID 49676)
-- Name: act_idx_auth_rm_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_auth_rm_time ON public.act_ru_authorization USING btree (removal_time_);


--
-- TOC entry 5173 (class 1259 OID 49675)
-- Name: act_idx_auth_root_pi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_auth_root_pi ON public.act_ru_authorization USING btree (root_proc_inst_id_);


--
-- TOC entry 5141 (class 1259 OID 49651)
-- Name: act_idx_batch_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_batch_id ON public.act_ru_variable USING btree (batch_id_);


--
-- TOC entry 5199 (class 1259 OID 49640)
-- Name: act_idx_batch_job_def; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_batch_job_def ON public.act_ru_batch USING btree (batch_job_def_id_);


--
-- TOC entry 5200 (class 1259 OID 49634)
-- Name: act_idx_batch_monitor_job_def; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_batch_monitor_job_def ON public.act_ru_batch USING btree (monitor_job_def_id_);


--
-- TOC entry 5201 (class 1259 OID 49628)
-- Name: act_idx_batch_seed_job_def; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_batch_seed_job_def ON public.act_ru_batch USING btree (seed_job_def_id_);


--
-- TOC entry 5083 (class 1259 OID 49496)
-- Name: act_idx_bytear_depl; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_bytear_depl ON public.act_ge_bytearray USING btree (deployment_id_);


--
-- TOC entry 5084 (class 1259 OID 49666)
-- Name: act_idx_bytearray_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_bytearray_name ON public.act_ge_bytearray USING btree (name_);


--
-- TOC entry 5085 (class 1259 OID 49665)
-- Name: act_idx_bytearray_rm_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_bytearray_rm_time ON public.act_ge_bytearray USING btree (removal_time_);


--
-- TOC entry 5086 (class 1259 OID 49664)
-- Name: act_idx_bytearray_root_pi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_bytearray_root_pi ON public.act_ge_bytearray USING btree (root_proc_inst_id_);


--
-- TOC entry 5355 (class 1259 OID 50020)
-- Name: act_idx_case_def_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_case_def_tenant_id ON public.act_re_case_def USING btree (tenant_id_);


--
-- TOC entry 5358 (class 1259 OID 49978)
-- Name: act_idx_case_exe_case_def; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_case_exe_case_def ON public.act_ru_case_execution USING btree (case_def_id_);


--
-- TOC entry 5359 (class 1259 OID 49966)
-- Name: act_idx_case_exe_case_inst; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_case_exe_case_inst ON public.act_ru_case_execution USING btree (case_inst_id_);


--
-- TOC entry 5360 (class 1259 OID 49972)
-- Name: act_idx_case_exe_parent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_case_exe_parent ON public.act_ru_case_execution USING btree (parent_id_);


--
-- TOC entry 5361 (class 1259 OID 49965)
-- Name: act_idx_case_exec_buskey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_case_exec_buskey ON public.act_ru_case_execution USING btree (business_key_);


--
-- TOC entry 5362 (class 1259 OID 50021)
-- Name: act_idx_case_exec_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_case_exec_tenant_id ON public.act_ru_case_execution USING btree (tenant_id_);


--
-- TOC entry 5365 (class 1259 OID 50014)
-- Name: act_idx_case_sentry_case_exec; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_case_sentry_case_exec ON public.act_ru_case_sentry_part USING btree (case_exec_id_);


--
-- TOC entry 5366 (class 1259 OID 50008)
-- Name: act_idx_case_sentry_case_inst; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_case_sentry_case_inst ON public.act_ru_case_sentry_part USING btree (case_inst_id_);


--
-- TOC entry 5382 (class 1259 OID 50065)
-- Name: act_idx_dec_def_req_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_dec_def_req_id ON public.act_re_decision_def USING btree (dec_req_id_);


--
-- TOC entry 5383 (class 1259 OID 50064)
-- Name: act_idx_dec_def_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_dec_def_tenant_id ON public.act_re_decision_def USING btree (tenant_id_);


--
-- TOC entry 5386 (class 1259 OID 50066)
-- Name: act_idx_dec_req_def_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_dec_req_def_tenant_id ON public.act_re_decision_req_def USING btree (tenant_id_);


--
-- TOC entry 5089 (class 1259 OID 49667)
-- Name: act_idx_deployment_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_deployment_name ON public.act_re_deployment USING btree (name_);


--
-- TOC entry 5090 (class 1259 OID 49668)
-- Name: act_idx_deployment_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_deployment_tenant_id ON public.act_re_deployment USING btree (tenant_id_);


--
-- TOC entry 5154 (class 1259 OID 49580)
-- Name: act_idx_event_subscr; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_event_subscr ON public.act_ru_event_subscr USING btree (execution_id_);


--
-- TOC entry 5155 (class 1259 OID 49471)
-- Name: act_idx_event_subscr_config_; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_event_subscr_config_ ON public.act_ru_event_subscr USING btree (configuration_);


--
-- TOC entry 5156 (class 1259 OID 49671)
-- Name: act_idx_event_subscr_evt_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_event_subscr_evt_name ON public.act_ru_event_subscr USING btree (event_name_);


--
-- TOC entry 5157 (class 1259 OID 49472)
-- Name: act_idx_event_subscr_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_event_subscr_tenant_id ON public.act_ru_event_subscr USING btree (tenant_id_);


--
-- TOC entry 5093 (class 1259 OID 49508)
-- Name: act_idx_exe_parent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_exe_parent ON public.act_ru_execution USING btree (parent_id_);


--
-- TOC entry 5094 (class 1259 OID 49520)
-- Name: act_idx_exe_procdef; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_exe_procdef ON public.act_ru_execution USING btree (proc_def_id_);


--
-- TOC entry 5095 (class 1259 OID 49502)
-- Name: act_idx_exe_procinst; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_exe_procinst ON public.act_ru_execution USING btree (proc_inst_id_);


--
-- TOC entry 5096 (class 1259 OID 49461)
-- Name: act_idx_exe_root_pi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_exe_root_pi ON public.act_ru_execution USING btree (root_proc_inst_id_);


--
-- TOC entry 5097 (class 1259 OID 49514)
-- Name: act_idx_exe_super; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_exe_super ON public.act_ru_execution USING btree (super_exec_);


--
-- TOC entry 5098 (class 1259 OID 49462)
-- Name: act_idx_exec_buskey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_exec_buskey ON public.act_ru_execution USING btree (business_key_);


--
-- TOC entry 5099 (class 1259 OID 49463)
-- Name: act_idx_exec_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_exec_tenant_id ON public.act_ru_execution USING btree (tenant_id_);


--
-- TOC entry 5192 (class 1259 OID 49493)
-- Name: act_idx_ext_task_err_details; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_ext_task_err_details ON public.act_ru_ext_task USING btree (error_details_id_);


--
-- TOC entry 5193 (class 1259 OID 49663)
-- Name: act_idx_ext_task_exec; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_ext_task_exec ON public.act_ru_ext_task USING btree (execution_id_);


--
-- TOC entry 5194 (class 1259 OID 49492)
-- Name: act_idx_ext_task_priority; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_ext_task_priority ON public.act_ru_ext_task USING btree (priority_);


--
-- TOC entry 5195 (class 1259 OID 49491)
-- Name: act_idx_ext_task_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_ext_task_tenant_id ON public.act_ru_ext_task USING btree (tenant_id_);


--
-- TOC entry 5196 (class 1259 OID 49490)
-- Name: act_idx_ext_task_topic; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_ext_task_topic ON public.act_ru_ext_task USING btree (topic_name_);


--
-- TOC entry 5219 (class 1259 OID 49785)
-- Name: act_idx_hi_act_inst_comp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_act_inst_comp ON public.act_hi_actinst USING btree (execution_id_, act_id_, end_time_, id_);


--
-- TOC entry 5220 (class 1259 OID 49783)
-- Name: act_idx_hi_act_inst_end; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_act_inst_end ON public.act_hi_actinst USING btree (end_time_);


--
-- TOC entry 5221 (class 1259 OID 49788)
-- Name: act_idx_hi_act_inst_proc_def_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_act_inst_proc_def_key ON public.act_hi_actinst USING btree (proc_def_key_);


--
-- TOC entry 5222 (class 1259 OID 49784)
-- Name: act_idx_hi_act_inst_procinst; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_act_inst_procinst ON public.act_hi_actinst USING btree (proc_inst_id_, act_id_);


--
-- TOC entry 5223 (class 1259 OID 49790)
-- Name: act_idx_hi_act_inst_rm_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_act_inst_rm_time ON public.act_hi_actinst USING btree (removal_time_);


--
-- TOC entry 5224 (class 1259 OID 49782)
-- Name: act_idx_hi_act_inst_start_end; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_act_inst_start_end ON public.act_hi_actinst USING btree (start_time_, end_time_);


--
-- TOC entry 5225 (class 1259 OID 49786)
-- Name: act_idx_hi_act_inst_stats; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_act_inst_stats ON public.act_hi_actinst USING btree (proc_def_id_, proc_inst_id_, act_id_, end_time_, act_inst_state_);


--
-- TOC entry 5226 (class 1259 OID 49787)
-- Name: act_idx_hi_act_inst_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_act_inst_tenant_id ON public.act_hi_actinst USING btree (tenant_id_);


--
-- TOC entry 5227 (class 1259 OID 49781)
-- Name: act_idx_hi_actinst_root_pi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_actinst_root_pi ON public.act_hi_actinst USING btree (root_proc_inst_id_);


--
-- TOC entry 5228 (class 1259 OID 49789)
-- Name: act_idx_hi_ai_pdefid_end_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_ai_pdefid_end_time ON public.act_hi_actinst USING btree (proc_def_id_, end_time_);


--
-- TOC entry 5286 (class 1259 OID 49865)
-- Name: act_idx_hi_attachment_content; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_attachment_content ON public.act_hi_attachment USING btree (content_id_);


--
-- TOC entry 5287 (class 1259 OID 49867)
-- Name: act_idx_hi_attachment_procinst; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_attachment_procinst ON public.act_hi_attachment USING btree (proc_inst_id_);


--
-- TOC entry 5288 (class 1259 OID 49869)
-- Name: act_idx_hi_attachment_rm_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_attachment_rm_time ON public.act_hi_attachment USING btree (removal_time_);


--
-- TOC entry 5289 (class 1259 OID 49866)
-- Name: act_idx_hi_attachment_root_pi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_attachment_root_pi ON public.act_hi_attachment USING btree (root_proc_inst_id_);


--
-- TOC entry 5290 (class 1259 OID 49868)
-- Name: act_idx_hi_attachment_task; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_attachment_task ON public.act_hi_attachment USING btree (task_id_);


--
-- TOC entry 5378 (class 1259 OID 50043)
-- Name: act_idx_hi_cas_a_i_comp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_cas_a_i_comp ON public.act_hi_caseactinst USING btree (case_act_id_, end_time_, id_);


--
-- TOC entry 5379 (class 1259 OID 50041)
-- Name: act_idx_hi_cas_a_i_create; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_cas_a_i_create ON public.act_hi_caseactinst USING btree (create_time_);


--
-- TOC entry 5380 (class 1259 OID 50042)
-- Name: act_idx_hi_cas_a_i_end; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_cas_a_i_end ON public.act_hi_caseactinst USING btree (end_time_);


--
-- TOC entry 5381 (class 1259 OID 50044)
-- Name: act_idx_hi_cas_a_i_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_cas_a_i_tenant_id ON public.act_hi_caseactinst USING btree (tenant_id_);


--
-- TOC entry 5373 (class 1259 OID 50039)
-- Name: act_idx_hi_cas_i_buskey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_cas_i_buskey ON public.act_hi_caseinst USING btree (business_key_);


--
-- TOC entry 5374 (class 1259 OID 50038)
-- Name: act_idx_hi_cas_i_close; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_cas_i_close ON public.act_hi_caseinst USING btree (close_time_);


--
-- TOC entry 5375 (class 1259 OID 50040)
-- Name: act_idx_hi_cas_i_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_cas_i_tenant_id ON public.act_hi_caseinst USING btree (tenant_id_);


--
-- TOC entry 5241 (class 1259 OID 49824)
-- Name: act_idx_hi_casevar_case_inst; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_casevar_case_inst ON public.act_hi_varinst USING btree (case_inst_id_);


--
-- TOC entry 5280 (class 1259 OID 49872)
-- Name: act_idx_hi_comment_procinst; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_comment_procinst ON public.act_hi_comment USING btree (proc_inst_id_);


--
-- TOC entry 5281 (class 1259 OID 49873)
-- Name: act_idx_hi_comment_rm_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_comment_rm_time ON public.act_hi_comment USING btree (removal_time_);


--
-- TOC entry 5282 (class 1259 OID 49871)
-- Name: act_idx_hi_comment_root_pi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_comment_root_pi ON public.act_hi_comment USING btree (root_proc_inst_id_);


--
-- TOC entry 5283 (class 1259 OID 49870)
-- Name: act_idx_hi_comment_task; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_comment_task ON public.act_hi_comment USING btree (task_id_);


--
-- TOC entry 5406 (class 1259 OID 50102)
-- Name: act_idx_hi_dec_in_clause; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_dec_in_clause ON public.act_hi_dec_in USING btree (dec_inst_id_, clause_id_);


--
-- TOC entry 5407 (class 1259 OID 50101)
-- Name: act_idx_hi_dec_in_inst; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_dec_in_inst ON public.act_hi_dec_in USING btree (dec_inst_id_);


--
-- TOC entry 5408 (class 1259 OID 50104)
-- Name: act_idx_hi_dec_in_rm_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_dec_in_rm_time ON public.act_hi_dec_in USING btree (removal_time_);


--
-- TOC entry 5409 (class 1259 OID 50103)
-- Name: act_idx_hi_dec_in_root_pi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_dec_in_root_pi ON public.act_hi_dec_in USING btree (root_proc_inst_id_);


--
-- TOC entry 5391 (class 1259 OID 50092)
-- Name: act_idx_hi_dec_inst_act; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_dec_inst_act ON public.act_hi_decinst USING btree (act_id_);


--
-- TOC entry 5392 (class 1259 OID 50093)
-- Name: act_idx_hi_dec_inst_act_inst; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_dec_inst_act_inst ON public.act_hi_decinst USING btree (act_inst_id_);


--
-- TOC entry 5393 (class 1259 OID 50091)
-- Name: act_idx_hi_dec_inst_ci; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_dec_inst_ci ON public.act_hi_decinst USING btree (case_inst_id_);


--
-- TOC entry 5394 (class 1259 OID 50088)
-- Name: act_idx_hi_dec_inst_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_dec_inst_id ON public.act_hi_decinst USING btree (dec_def_id_);


--
-- TOC entry 5395 (class 1259 OID 50089)
-- Name: act_idx_hi_dec_inst_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_dec_inst_key ON public.act_hi_decinst USING btree (dec_def_key_);


--
-- TOC entry 5396 (class 1259 OID 50090)
-- Name: act_idx_hi_dec_inst_pi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_dec_inst_pi ON public.act_hi_decinst USING btree (proc_inst_id_);


--
-- TOC entry 5397 (class 1259 OID 50097)
-- Name: act_idx_hi_dec_inst_req_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_dec_inst_req_id ON public.act_hi_decinst USING btree (dec_req_id_);


--
-- TOC entry 5398 (class 1259 OID 50098)
-- Name: act_idx_hi_dec_inst_req_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_dec_inst_req_key ON public.act_hi_decinst USING btree (dec_req_key_);


--
-- TOC entry 5399 (class 1259 OID 50100)
-- Name: act_idx_hi_dec_inst_rm_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_dec_inst_rm_time ON public.act_hi_decinst USING btree (removal_time_);


--
-- TOC entry 5400 (class 1259 OID 50096)
-- Name: act_idx_hi_dec_inst_root_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_dec_inst_root_id ON public.act_hi_decinst USING btree (root_dec_inst_id_);


--
-- TOC entry 5401 (class 1259 OID 50099)
-- Name: act_idx_hi_dec_inst_root_pi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_dec_inst_root_pi ON public.act_hi_decinst USING btree (root_proc_inst_id_);


--
-- TOC entry 5402 (class 1259 OID 50095)
-- Name: act_idx_hi_dec_inst_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_dec_inst_tenant_id ON public.act_hi_decinst USING btree (tenant_id_);


--
-- TOC entry 5403 (class 1259 OID 50094)
-- Name: act_idx_hi_dec_inst_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_dec_inst_time ON public.act_hi_decinst USING btree (eval_time_);


--
-- TOC entry 5412 (class 1259 OID 50105)
-- Name: act_idx_hi_dec_out_inst; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_dec_out_inst ON public.act_hi_dec_out USING btree (dec_inst_id_);


--
-- TOC entry 5413 (class 1259 OID 50108)
-- Name: act_idx_hi_dec_out_rm_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_dec_out_rm_time ON public.act_hi_dec_out USING btree (removal_time_);


--
-- TOC entry 5414 (class 1259 OID 50107)
-- Name: act_idx_hi_dec_out_root_pi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_dec_out_root_pi ON public.act_hi_dec_out USING btree (root_proc_inst_id_);


--
-- TOC entry 5415 (class 1259 OID 50106)
-- Name: act_idx_hi_dec_out_rule; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_dec_out_rule ON public.act_hi_dec_out USING btree (rule_order_, clause_id_);


--
-- TOC entry 5254 (class 1259 OID 49801)
-- Name: act_idx_hi_detail_act_inst; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_detail_act_inst ON public.act_hi_detail USING btree (act_inst_id_);


--
-- TOC entry 5255 (class 1259 OID 49809)
-- Name: act_idx_hi_detail_bytear; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_detail_bytear ON public.act_hi_detail USING btree (bytearray_id_);


--
-- TOC entry 5256 (class 1259 OID 49803)
-- Name: act_idx_hi_detail_case_exec; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_detail_case_exec ON public.act_hi_detail USING btree (case_execution_id_);


--
-- TOC entry 5257 (class 1259 OID 49802)
-- Name: act_idx_hi_detail_case_inst; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_detail_case_inst ON public.act_hi_detail USING btree (case_inst_id_);


--
-- TOC entry 5258 (class 1259 OID 49805)
-- Name: act_idx_hi_detail_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_detail_name ON public.act_hi_detail USING btree (name_);


--
-- TOC entry 5259 (class 1259 OID 49808)
-- Name: act_idx_hi_detail_proc_def_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_detail_proc_def_key ON public.act_hi_detail USING btree (proc_def_key_);


--
-- TOC entry 5260 (class 1259 OID 49800)
-- Name: act_idx_hi_detail_proc_inst; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_detail_proc_inst ON public.act_hi_detail USING btree (proc_inst_id_);


--
-- TOC entry 5261 (class 1259 OID 49810)
-- Name: act_idx_hi_detail_rm_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_detail_rm_time ON public.act_hi_detail USING btree (removal_time_);


--
-- TOC entry 5262 (class 1259 OID 49799)
-- Name: act_idx_hi_detail_root_pi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_detail_root_pi ON public.act_hi_detail USING btree (root_proc_inst_id_);


--
-- TOC entry 5263 (class 1259 OID 49811)
-- Name: act_idx_hi_detail_task_bytear; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_detail_task_bytear ON public.act_hi_detail USING btree (bytearray_id_, task_id_);


--
-- TOC entry 5264 (class 1259 OID 49806)
-- Name: act_idx_hi_detail_task_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_detail_task_id ON public.act_hi_detail USING btree (task_id_);


--
-- TOC entry 5265 (class 1259 OID 49807)
-- Name: act_idx_hi_detail_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_detail_tenant_id ON public.act_hi_detail USING btree (tenant_id_);


--
-- TOC entry 5266 (class 1259 OID 49804)
-- Name: act_idx_hi_detail_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_detail_time ON public.act_hi_detail USING btree (time_);


--
-- TOC entry 5267 (class 1259 OID 49812)
-- Name: act_idx_hi_detail_var_inst_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_detail_var_inst_id ON public.act_hi_detail USING btree (var_inst_id_);


--
-- TOC entry 5333 (class 1259 OID 49854)
-- Name: act_idx_hi_exttasklog_errordet; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_exttasklog_errordet ON public.act_hi_ext_task_log USING btree (error_details_id_);


--
-- TOC entry 5270 (class 1259 OID 49819)
-- Name: act_idx_hi_ident_link_rm_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_ident_link_rm_time ON public.act_hi_identitylink USING btree (removal_time_);


--
-- TOC entry 5271 (class 1259 OID 49818)
-- Name: act_idx_hi_ident_link_task; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_ident_link_task ON public.act_hi_identitylink USING btree (task_id_);


--
-- TOC entry 5272 (class 1259 OID 49815)
-- Name: act_idx_hi_ident_lnk_group; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_ident_lnk_group ON public.act_hi_identitylink USING btree (group_id_);


--
-- TOC entry 5273 (class 1259 OID 49817)
-- Name: act_idx_hi_ident_lnk_proc_def_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_ident_lnk_proc_def_key ON public.act_hi_identitylink USING btree (proc_def_key_);


--
-- TOC entry 5274 (class 1259 OID 49813)
-- Name: act_idx_hi_ident_lnk_root_pi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_ident_lnk_root_pi ON public.act_hi_identitylink USING btree (root_proc_inst_id_);


--
-- TOC entry 5275 (class 1259 OID 49816)
-- Name: act_idx_hi_ident_lnk_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_ident_lnk_tenant_id ON public.act_hi_identitylink USING btree (tenant_id_);


--
-- TOC entry 5276 (class 1259 OID 49820)
-- Name: act_idx_hi_ident_lnk_timestamp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_ident_lnk_timestamp ON public.act_hi_identitylink USING btree (timestamp_);


--
-- TOC entry 5277 (class 1259 OID 49814)
-- Name: act_idx_hi_ident_lnk_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_ident_lnk_user ON public.act_hi_identitylink USING btree (user_id_);


--
-- TOC entry 5304 (class 1259 OID 49837)
-- Name: act_idx_hi_incident_create_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_incident_create_time ON public.act_hi_incident USING btree (create_time_);


--
-- TOC entry 5305 (class 1259 OID 49838)
-- Name: act_idx_hi_incident_end_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_incident_end_time ON public.act_hi_incident USING btree (end_time_);


--
-- TOC entry 5306 (class 1259 OID 49833)
-- Name: act_idx_hi_incident_proc_def_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_incident_proc_def_key ON public.act_hi_incident USING btree (proc_def_key_);


--
-- TOC entry 5307 (class 1259 OID 49835)
-- Name: act_idx_hi_incident_procinst; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_incident_procinst ON public.act_hi_incident USING btree (proc_inst_id_);


--
-- TOC entry 5308 (class 1259 OID 49836)
-- Name: act_idx_hi_incident_rm_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_incident_rm_time ON public.act_hi_incident USING btree (removal_time_);


--
-- TOC entry 5309 (class 1259 OID 49834)
-- Name: act_idx_hi_incident_root_pi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_incident_root_pi ON public.act_hi_incident USING btree (root_proc_inst_id_);


--
-- TOC entry 5310 (class 1259 OID 49832)
-- Name: act_idx_hi_incident_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_incident_tenant_id ON public.act_hi_incident USING btree (tenant_id_);


--
-- TOC entry 5313 (class 1259 OID 49845)
-- Name: act_idx_hi_job_log_ex_stack; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_job_log_ex_stack ON public.act_hi_job_log USING btree (job_exception_stack_id_);


--
-- TOC entry 5314 (class 1259 OID 49847)
-- Name: act_idx_hi_job_log_job_conf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_job_log_job_conf ON public.act_hi_job_log USING btree (job_def_configuration_);


--
-- TOC entry 5315 (class 1259 OID 49843)
-- Name: act_idx_hi_job_log_job_def_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_job_log_job_def_id ON public.act_hi_job_log USING btree (job_def_id_);


--
-- TOC entry 5316 (class 1259 OID 49844)
-- Name: act_idx_hi_job_log_proc_def_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_job_log_proc_def_key ON public.act_hi_job_log USING btree (process_def_key_);


--
-- TOC entry 5317 (class 1259 OID 49841)
-- Name: act_idx_hi_job_log_procdef; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_job_log_procdef ON public.act_hi_job_log USING btree (process_def_id_);


--
-- TOC entry 5318 (class 1259 OID 49840)
-- Name: act_idx_hi_job_log_procinst; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_job_log_procinst ON public.act_hi_job_log USING btree (process_instance_id_);


--
-- TOC entry 5319 (class 1259 OID 49846)
-- Name: act_idx_hi_job_log_rm_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_job_log_rm_time ON public.act_hi_job_log USING btree (removal_time_);


--
-- TOC entry 5320 (class 1259 OID 49839)
-- Name: act_idx_hi_job_log_root_pi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_job_log_root_pi ON public.act_hi_job_log USING btree (root_proc_inst_id_);


--
-- TOC entry 5321 (class 1259 OID 49842)
-- Name: act_idx_hi_job_log_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_job_log_tenant_id ON public.act_hi_job_log USING btree (tenant_id_);


--
-- TOC entry 5293 (class 1259 OID 49864)
-- Name: act_idx_hi_op_log_entity_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_op_log_entity_type ON public.act_hi_op_log USING btree (entity_type_);


--
-- TOC entry 5294 (class 1259 OID 49863)
-- Name: act_idx_hi_op_log_op_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_op_log_op_type ON public.act_hi_op_log USING btree (operation_type_);


--
-- TOC entry 5295 (class 1259 OID 49858)
-- Name: act_idx_hi_op_log_procdef; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_op_log_procdef ON public.act_hi_op_log USING btree (proc_def_id_);


--
-- TOC entry 5296 (class 1259 OID 49857)
-- Name: act_idx_hi_op_log_procinst; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_op_log_procinst ON public.act_hi_op_log USING btree (proc_inst_id_);


--
-- TOC entry 5297 (class 1259 OID 49860)
-- Name: act_idx_hi_op_log_rm_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_op_log_rm_time ON public.act_hi_op_log USING btree (removal_time_);


--
-- TOC entry 5298 (class 1259 OID 49856)
-- Name: act_idx_hi_op_log_root_pi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_op_log_root_pi ON public.act_hi_op_log USING btree (root_proc_inst_id_);


--
-- TOC entry 5299 (class 1259 OID 49859)
-- Name: act_idx_hi_op_log_task; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_op_log_task ON public.act_hi_op_log USING btree (task_id_);


--
-- TOC entry 5300 (class 1259 OID 49861)
-- Name: act_idx_hi_op_log_timestamp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_op_log_timestamp ON public.act_hi_op_log USING btree (timestamp_);


--
-- TOC entry 5301 (class 1259 OID 49862)
-- Name: act_idx_hi_op_log_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_op_log_user_id ON public.act_hi_op_log USING btree (user_id_);


--
-- TOC entry 5208 (class 1259 OID 49777)
-- Name: act_idx_hi_pi_pdefid_end_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_pi_pdefid_end_time ON public.act_hi_procinst USING btree (proc_def_id_, end_time_);


--
-- TOC entry 5209 (class 1259 OID 49773)
-- Name: act_idx_hi_pro_i_buskey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_pro_i_buskey ON public.act_hi_procinst USING btree (business_key_);


--
-- TOC entry 5210 (class 1259 OID 49772)
-- Name: act_idx_hi_pro_inst_end; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_pro_inst_end ON public.act_hi_procinst USING btree (end_time_);


--
-- TOC entry 5211 (class 1259 OID 49775)
-- Name: act_idx_hi_pro_inst_proc_def_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_pro_inst_proc_def_key ON public.act_hi_procinst USING btree (proc_def_key_);


--
-- TOC entry 5212 (class 1259 OID 49776)
-- Name: act_idx_hi_pro_inst_proc_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_pro_inst_proc_time ON public.act_hi_procinst USING btree (start_time_, end_time_);


--
-- TOC entry 5213 (class 1259 OID 49779)
-- Name: act_idx_hi_pro_inst_rm_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_pro_inst_rm_time ON public.act_hi_procinst USING btree (removal_time_);


--
-- TOC entry 5214 (class 1259 OID 49778)
-- Name: act_idx_hi_pro_inst_root_pi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_pro_inst_root_pi ON public.act_hi_procinst USING btree (root_proc_inst_id_);


--
-- TOC entry 5215 (class 1259 OID 49774)
-- Name: act_idx_hi_pro_inst_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_pro_inst_tenant_id ON public.act_hi_procinst USING btree (tenant_id_);


--
-- TOC entry 5216 (class 1259 OID 49780)
-- Name: act_idx_hi_pro_rst_pro_inst_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_pro_rst_pro_inst_id ON public.act_hi_procinst USING btree (restarted_proc_inst_id_);


--
-- TOC entry 5242 (class 1259 OID 49823)
-- Name: act_idx_hi_procvar_name_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_procvar_name_type ON public.act_hi_varinst USING btree (name_, var_type_);


--
-- TOC entry 5243 (class 1259 OID 49822)
-- Name: act_idx_hi_procvar_proc_inst; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_procvar_proc_inst ON public.act_hi_varinst USING btree (proc_inst_id_);


--
-- TOC entry 5231 (class 1259 OID 49798)
-- Name: act_idx_hi_task_inst_end; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_task_inst_end ON public.act_hi_taskinst USING btree (end_time_);


--
-- TOC entry 5232 (class 1259 OID 49793)
-- Name: act_idx_hi_task_inst_proc_def_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_task_inst_proc_def_key ON public.act_hi_taskinst USING btree (proc_def_key_);


--
-- TOC entry 5233 (class 1259 OID 49796)
-- Name: act_idx_hi_task_inst_rm_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_task_inst_rm_time ON public.act_hi_taskinst USING btree (removal_time_);


--
-- TOC entry 5234 (class 1259 OID 49797)
-- Name: act_idx_hi_task_inst_start; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_task_inst_start ON public.act_hi_taskinst USING btree (start_time_);


--
-- TOC entry 5235 (class 1259 OID 49792)
-- Name: act_idx_hi_task_inst_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_task_inst_tenant_id ON public.act_hi_taskinst USING btree (tenant_id_);


--
-- TOC entry 5236 (class 1259 OID 49794)
-- Name: act_idx_hi_taskinst_procinst; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_taskinst_procinst ON public.act_hi_taskinst USING btree (proc_inst_id_);


--
-- TOC entry 5237 (class 1259 OID 49791)
-- Name: act_idx_hi_taskinst_root_pi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_taskinst_root_pi ON public.act_hi_taskinst USING btree (root_proc_inst_id_);


--
-- TOC entry 5238 (class 1259 OID 49795)
-- Name: act_idx_hi_taskinstid_procinst; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_taskinstid_procinst ON public.act_hi_taskinst USING btree (id_, proc_inst_id_);


--
-- TOC entry 5244 (class 1259 OID 49826)
-- Name: act_idx_hi_var_inst_proc_def_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_var_inst_proc_def_key ON public.act_hi_varinst USING btree (proc_def_key_);


--
-- TOC entry 5245 (class 1259 OID 49825)
-- Name: act_idx_hi_var_inst_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_var_inst_tenant_id ON public.act_hi_varinst USING btree (tenant_id_);


--
-- TOC entry 5246 (class 1259 OID 49829)
-- Name: act_idx_hi_var_pi_name_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_var_pi_name_type ON public.act_hi_varinst USING btree (proc_inst_id_, name_, var_type_);


--
-- TOC entry 5247 (class 1259 OID 49831)
-- Name: act_idx_hi_varinst_act_inst_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_varinst_act_inst_id ON public.act_hi_varinst USING btree (act_inst_id_);


--
-- TOC entry 5248 (class 1259 OID 49827)
-- Name: act_idx_hi_varinst_bytear; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_varinst_bytear ON public.act_hi_varinst USING btree (bytearray_id_);


--
-- TOC entry 5249 (class 1259 OID 49830)
-- Name: act_idx_hi_varinst_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_varinst_name ON public.act_hi_varinst USING btree (name_);


--
-- TOC entry 5250 (class 1259 OID 49828)
-- Name: act_idx_hi_varinst_rm_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_varinst_rm_time ON public.act_hi_varinst USING btree (removal_time_);


--
-- TOC entry 5251 (class 1259 OID 49821)
-- Name: act_idx_hi_varinst_root_pi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_hi_varinst_root_pi ON public.act_hi_varinst USING btree (root_proc_inst_id_);


--
-- TOC entry 5136 (class 1259 OID 49470)
-- Name: act_idx_ident_lnk_group; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_ident_lnk_group ON public.act_ru_identitylink USING btree (group_id_);


--
-- TOC entry 5137 (class 1259 OID 49469)
-- Name: act_idx_ident_lnk_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_ident_lnk_user ON public.act_ru_identitylink USING btree (user_id_);


--
-- TOC entry 5160 (class 1259 OID 49657)
-- Name: act_idx_inc_causeincid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_inc_causeincid ON public.act_ru_incident USING btree (cause_incident_id_);


--
-- TOC entry 5161 (class 1259 OID 49476)
-- Name: act_idx_inc_configuration; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_inc_configuration ON public.act_ru_incident USING btree (configuration_);


--
-- TOC entry 5162 (class 1259 OID 49658)
-- Name: act_idx_inc_exid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_inc_exid ON public.act_ru_incident USING btree (execution_id_);


--
-- TOC entry 5163 (class 1259 OID 49611)
-- Name: act_idx_inc_job_def; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_inc_job_def ON public.act_ru_incident USING btree (job_def_id_);


--
-- TOC entry 5164 (class 1259 OID 49659)
-- Name: act_idx_inc_procdefid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_inc_procdefid ON public.act_ru_incident USING btree (proc_def_id_);


--
-- TOC entry 5165 (class 1259 OID 49660)
-- Name: act_idx_inc_procinstid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_inc_procinstid ON public.act_ru_incident USING btree (proc_inst_id_);


--
-- TOC entry 5166 (class 1259 OID 49661)
-- Name: act_idx_inc_rootcauseincid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_inc_rootcauseincid ON public.act_ru_incident USING btree (root_cause_incident_id_);


--
-- TOC entry 5167 (class 1259 OID 49477)
-- Name: act_idx_inc_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_inc_tenant_id ON public.act_ru_incident USING btree (tenant_id_);


--
-- TOC entry 5102 (class 1259 OID 49574)
-- Name: act_idx_job_exception; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_job_exception ON public.act_ru_job USING btree (exception_stack_id_);


--
-- TOC entry 5103 (class 1259 OID 49478)
-- Name: act_idx_job_execution_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_job_execution_id ON public.act_ru_job USING btree (execution_id_);


--
-- TOC entry 5104 (class 1259 OID 49479)
-- Name: act_idx_job_handler; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_job_handler ON public.act_ru_job USING btree (handler_type_, handler_cfg_);


--
-- TOC entry 5105 (class 1259 OID 49670)
-- Name: act_idx_job_handler_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_job_handler_type ON public.act_ru_job USING btree (handler_type_);


--
-- TOC entry 5106 (class 1259 OID 49495)
-- Name: act_idx_job_job_def_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_job_job_def_id ON public.act_ru_job USING btree (job_def_id_);


--
-- TOC entry 5107 (class 1259 OID 49480)
-- Name: act_idx_job_procinst; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_job_procinst ON public.act_ru_job USING btree (process_instance_id_);


--
-- TOC entry 5108 (class 1259 OID 49481)
-- Name: act_idx_job_root_procinst; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_job_root_procinst ON public.act_ru_job USING btree (root_proc_inst_id_);


--
-- TOC entry 5109 (class 1259 OID 49482)
-- Name: act_idx_job_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_job_tenant_id ON public.act_ru_job USING btree (tenant_id_);


--
-- TOC entry 5112 (class 1259 OID 49669)
-- Name: act_idx_jobdef_proc_def_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_jobdef_proc_def_id ON public.act_ru_jobdef USING btree (proc_def_id_);


--
-- TOC entry 5113 (class 1259 OID 49483)
-- Name: act_idx_jobdef_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_jobdef_tenant_id ON public.act_ru_jobdef USING btree (tenant_id_);


--
-- TOC entry 5338 (class 1259 OID 49910)
-- Name: act_idx_memb_group; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_memb_group ON public.act_id_membership USING btree (group_id_);


--
-- TOC entry 5339 (class 1259 OID 49916)
-- Name: act_idx_memb_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_memb_user ON public.act_id_membership USING btree (user_id_);


--
-- TOC entry 5182 (class 1259 OID 49488)
-- Name: act_idx_meter_log; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_meter_log ON public.act_ru_meter_log USING btree (name_, timestamp_);


--
-- TOC entry 5183 (class 1259 OID 49484)
-- Name: act_idx_meter_log_ms; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_meter_log_ms ON public.act_ru_meter_log USING btree (milliseconds_);


--
-- TOC entry 5184 (class 1259 OID 49485)
-- Name: act_idx_meter_log_name_ms; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_meter_log_name_ms ON public.act_ru_meter_log USING btree (name_, milliseconds_);


--
-- TOC entry 5185 (class 1259 OID 49486)
-- Name: act_idx_meter_log_report; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_meter_log_report ON public.act_ru_meter_log USING btree (name_, reporter_, milliseconds_);


--
-- TOC entry 5186 (class 1259 OID 49487)
-- Name: act_idx_meter_log_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_meter_log_time ON public.act_ru_meter_log USING btree (timestamp_);


--
-- TOC entry 5116 (class 1259 OID 49672)
-- Name: act_idx_procdef_deployment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_procdef_deployment_id ON public.act_re_procdef USING btree (deployment_id_);


--
-- TOC entry 5117 (class 1259 OID 49673)
-- Name: act_idx_procdef_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_procdef_tenant_id ON public.act_re_procdef USING btree (tenant_id_);


--
-- TOC entry 5118 (class 1259 OID 49674)
-- Name: act_idx_procdef_ver_tag; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_procdef_ver_tag ON public.act_re_procdef USING btree (version_tag_);


--
-- TOC entry 5123 (class 1259 OID 49466)
-- Name: act_idx_task_assignee; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_task_assignee ON public.act_ru_task USING btree (assignee_);


--
-- TOC entry 5124 (class 1259 OID 50002)
-- Name: act_idx_task_case_def_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_task_case_def_id ON public.act_ru_task USING btree (case_def_id_);


--
-- TOC entry 5125 (class 1259 OID 49996)
-- Name: act_idx_task_case_exec; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_task_case_exec ON public.act_ru_task USING btree (case_execution_id_);


--
-- TOC entry 5126 (class 1259 OID 49464)
-- Name: act_idx_task_create; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_task_create ON public.act_ru_task USING btree (create_time_);


--
-- TOC entry 5127 (class 1259 OID 49538)
-- Name: act_idx_task_exec; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_task_exec ON public.act_ru_task USING btree (execution_id_);


--
-- TOC entry 5128 (class 1259 OID 49465)
-- Name: act_idx_task_last_updated; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_task_last_updated ON public.act_ru_task USING btree (last_updated_);


--
-- TOC entry 5189 (class 1259 OID 49489)
-- Name: act_idx_task_meter_log_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_task_meter_log_time ON public.act_ru_task_meter_log USING btree (timestamp_);


--
-- TOC entry 5129 (class 1259 OID 49467)
-- Name: act_idx_task_owner; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_task_owner ON public.act_ru_task USING btree (owner_);


--
-- TOC entry 5130 (class 1259 OID 49550)
-- Name: act_idx_task_procdef; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_task_procdef ON public.act_ru_task USING btree (proc_def_id_);


--
-- TOC entry 5131 (class 1259 OID 49544)
-- Name: act_idx_task_procinst; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_task_procinst ON public.act_ru_task USING btree (proc_inst_id_);


--
-- TOC entry 5132 (class 1259 OID 49468)
-- Name: act_idx_task_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_task_tenant_id ON public.act_ru_task USING btree (tenant_id_);


--
-- TOC entry 5348 (class 1259 OID 49926)
-- Name: act_idx_tenant_memb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_tenant_memb ON public.act_id_tenant_member USING btree (tenant_id_);


--
-- TOC entry 5349 (class 1259 OID 49938)
-- Name: act_idx_tenant_memb_group; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_tenant_memb_group ON public.act_id_tenant_member USING btree (group_id_);


--
-- TOC entry 5350 (class 1259 OID 49932)
-- Name: act_idx_tenant_memb_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_tenant_memb_user ON public.act_id_tenant_member USING btree (user_id_);


--
-- TOC entry 5138 (class 1259 OID 49526)
-- Name: act_idx_tskass_task; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_tskass_task ON public.act_ru_identitylink USING btree (task_id_);


--
-- TOC entry 5142 (class 1259 OID 49568)
-- Name: act_idx_var_bytearray; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_var_bytearray ON public.act_ru_variable USING btree (bytearray_id_);


--
-- TOC entry 5143 (class 1259 OID 49984)
-- Name: act_idx_var_case_exe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_var_case_exe ON public.act_ru_variable USING btree (case_execution_id_);


--
-- TOC entry 5144 (class 1259 OID 49990)
-- Name: act_idx_var_case_inst_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_var_case_inst_id ON public.act_ru_variable USING btree (case_inst_id_);


--
-- TOC entry 5145 (class 1259 OID 49556)
-- Name: act_idx_var_exe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_var_exe ON public.act_ru_variable USING btree (execution_id_);


--
-- TOC entry 5146 (class 1259 OID 49562)
-- Name: act_idx_var_procinst; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_var_procinst ON public.act_ru_variable USING btree (proc_inst_id_);


--
-- TOC entry 5147 (class 1259 OID 49473)
-- Name: act_idx_variable_task_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_variable_task_id ON public.act_ru_variable USING btree (task_id_);


--
-- TOC entry 5148 (class 1259 OID 49475)
-- Name: act_idx_variable_task_name_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_variable_task_name_type ON public.act_ru_variable USING btree (task_id_, name_, type_);


--
-- TOC entry 5149 (class 1259 OID 49474)
-- Name: act_idx_variable_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX act_idx_variable_tenant_id ON public.act_ru_variable USING btree (tenant_id_);


--
-- TOC entry 5447 (class 2606 OID 49533)
-- Name: act_ru_identitylink act_fk_athrz_procedef; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_identitylink
    ADD CONSTRAINT act_fk_athrz_procedef FOREIGN KEY (proc_def_id_) REFERENCES public.act_re_procdef(id_);


--
-- TOC entry 5464 (class 2606 OID 49641)
-- Name: act_ru_batch act_fk_batch_job_def; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_batch
    ADD CONSTRAINT act_fk_batch_job_def FOREIGN KEY (batch_job_def_id_) REFERENCES public.act_ru_jobdef(id_);


--
-- TOC entry 5465 (class 2606 OID 49635)
-- Name: act_ru_batch act_fk_batch_monitor_job_def; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_batch
    ADD CONSTRAINT act_fk_batch_monitor_job_def FOREIGN KEY (monitor_job_def_id_) REFERENCES public.act_ru_jobdef(id_);


--
-- TOC entry 5466 (class 2606 OID 49629)
-- Name: act_ru_batch act_fk_batch_seed_job_def; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_batch
    ADD CONSTRAINT act_fk_batch_seed_job_def FOREIGN KEY (seed_job_def_id_) REFERENCES public.act_ru_jobdef(id_);


--
-- TOC entry 5436 (class 2606 OID 49497)
-- Name: act_ge_bytearray act_fk_bytearr_depl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ge_bytearray
    ADD CONSTRAINT act_fk_bytearr_depl FOREIGN KEY (deployment_id_) REFERENCES public.act_re_deployment(id_);


--
-- TOC entry 5472 (class 2606 OID 49979)
-- Name: act_ru_case_execution act_fk_case_exe_case_def; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_case_execution
    ADD CONSTRAINT act_fk_case_exe_case_def FOREIGN KEY (case_def_id_) REFERENCES public.act_re_case_def(id_);


--
-- TOC entry 5473 (class 2606 OID 49967)
-- Name: act_ru_case_execution act_fk_case_exe_case_inst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_case_execution
    ADD CONSTRAINT act_fk_case_exe_case_inst FOREIGN KEY (case_inst_id_) REFERENCES public.act_ru_case_execution(id_);


--
-- TOC entry 5474 (class 2606 OID 49973)
-- Name: act_ru_case_execution act_fk_case_exe_parent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_case_execution
    ADD CONSTRAINT act_fk_case_exe_parent FOREIGN KEY (parent_id_) REFERENCES public.act_ru_case_execution(id_);


--
-- TOC entry 5475 (class 2606 OID 50015)
-- Name: act_ru_case_sentry_part act_fk_case_sentry_case_exec; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_case_sentry_part
    ADD CONSTRAINT act_fk_case_sentry_case_exec FOREIGN KEY (case_exec_id_) REFERENCES public.act_ru_case_execution(id_);


--
-- TOC entry 5476 (class 2606 OID 50009)
-- Name: act_ru_case_sentry_part act_fk_case_sentry_case_inst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_case_sentry_part
    ADD CONSTRAINT act_fk_case_sentry_case_inst FOREIGN KEY (case_inst_id_) REFERENCES public.act_ru_case_execution(id_);


--
-- TOC entry 5477 (class 2606 OID 50059)
-- Name: act_re_decision_def act_fk_dec_req; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_re_decision_def
    ADD CONSTRAINT act_fk_dec_req FOREIGN KEY (dec_req_id_) REFERENCES public.act_re_decision_req_def(id_);


--
-- TOC entry 5455 (class 2606 OID 49581)
-- Name: act_ru_event_subscr act_fk_event_exec; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_event_subscr
    ADD CONSTRAINT act_fk_event_exec FOREIGN KEY (execution_id_) REFERENCES public.act_ru_execution(id_);


--
-- TOC entry 5437 (class 2606 OID 49509)
-- Name: act_ru_execution act_fk_exe_parent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_execution
    ADD CONSTRAINT act_fk_exe_parent FOREIGN KEY (parent_id_) REFERENCES public.act_ru_execution(id_);


--
-- TOC entry 5438 (class 2606 OID 49521)
-- Name: act_ru_execution act_fk_exe_procdef; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_execution
    ADD CONSTRAINT act_fk_exe_procdef FOREIGN KEY (proc_def_id_) REFERENCES public.act_re_procdef(id_);


--
-- TOC entry 5439 (class 2606 OID 49503)
-- Name: act_ru_execution act_fk_exe_procinst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_execution
    ADD CONSTRAINT act_fk_exe_procinst FOREIGN KEY (proc_inst_id_) REFERENCES public.act_ru_execution(id_);


--
-- TOC entry 5440 (class 2606 OID 49515)
-- Name: act_ru_execution act_fk_exe_super; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_execution
    ADD CONSTRAINT act_fk_exe_super FOREIGN KEY (super_exec_) REFERENCES public.act_ru_execution(id_);


--
-- TOC entry 5462 (class 2606 OID 49646)
-- Name: act_ru_ext_task act_fk_ext_task_error_details; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_ext_task
    ADD CONSTRAINT act_fk_ext_task_error_details FOREIGN KEY (error_details_id_) REFERENCES public.act_ge_bytearray(id_);


--
-- TOC entry 5463 (class 2606 OID 49623)
-- Name: act_ru_ext_task act_fk_ext_task_exe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_ext_task
    ADD CONSTRAINT act_fk_ext_task_exe FOREIGN KEY (execution_id_) REFERENCES public.act_ru_execution(id_);


--
-- TOC entry 5456 (class 2606 OID 49601)
-- Name: act_ru_incident act_fk_inc_cause; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_incident
    ADD CONSTRAINT act_fk_inc_cause FOREIGN KEY (cause_incident_id_) REFERENCES public.act_ru_incident(id_);


--
-- TOC entry 5457 (class 2606 OID 49586)
-- Name: act_ru_incident act_fk_inc_exe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_incident
    ADD CONSTRAINT act_fk_inc_exe FOREIGN KEY (execution_id_) REFERENCES public.act_ru_execution(id_);


--
-- TOC entry 5458 (class 2606 OID 49612)
-- Name: act_ru_incident act_fk_inc_job_def; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_incident
    ADD CONSTRAINT act_fk_inc_job_def FOREIGN KEY (job_def_id_) REFERENCES public.act_ru_jobdef(id_);


--
-- TOC entry 5459 (class 2606 OID 49596)
-- Name: act_ru_incident act_fk_inc_procdef; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_incident
    ADD CONSTRAINT act_fk_inc_procdef FOREIGN KEY (proc_def_id_) REFERENCES public.act_re_procdef(id_);


--
-- TOC entry 5460 (class 2606 OID 49591)
-- Name: act_ru_incident act_fk_inc_procinst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_incident
    ADD CONSTRAINT act_fk_inc_procinst FOREIGN KEY (proc_inst_id_) REFERENCES public.act_ru_execution(id_);


--
-- TOC entry 5461 (class 2606 OID 49606)
-- Name: act_ru_incident act_fk_inc_rcause; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_incident
    ADD CONSTRAINT act_fk_inc_rcause FOREIGN KEY (root_cause_incident_id_) REFERENCES public.act_ru_incident(id_);


--
-- TOC entry 5441 (class 2606 OID 49575)
-- Name: act_ru_job act_fk_job_exception; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_job
    ADD CONSTRAINT act_fk_job_exception FOREIGN KEY (exception_stack_id_) REFERENCES public.act_ge_bytearray(id_);


--
-- TOC entry 5467 (class 2606 OID 49911)
-- Name: act_id_membership act_fk_memb_group; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_id_membership
    ADD CONSTRAINT act_fk_memb_group FOREIGN KEY (group_id_) REFERENCES public.act_id_group(id_);


--
-- TOC entry 5468 (class 2606 OID 49917)
-- Name: act_id_membership act_fk_memb_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_id_membership
    ADD CONSTRAINT act_fk_memb_user FOREIGN KEY (user_id_) REFERENCES public.act_id_user(id_);


--
-- TOC entry 5442 (class 2606 OID 50003)
-- Name: act_ru_task act_fk_task_case_def; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_task
    ADD CONSTRAINT act_fk_task_case_def FOREIGN KEY (case_def_id_) REFERENCES public.act_re_case_def(id_);


--
-- TOC entry 5443 (class 2606 OID 49997)
-- Name: act_ru_task act_fk_task_case_exe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_task
    ADD CONSTRAINT act_fk_task_case_exe FOREIGN KEY (case_execution_id_) REFERENCES public.act_ru_case_execution(id_);


--
-- TOC entry 5444 (class 2606 OID 49539)
-- Name: act_ru_task act_fk_task_exe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_task
    ADD CONSTRAINT act_fk_task_exe FOREIGN KEY (execution_id_) REFERENCES public.act_ru_execution(id_);


--
-- TOC entry 5445 (class 2606 OID 49551)
-- Name: act_ru_task act_fk_task_procdef; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_task
    ADD CONSTRAINT act_fk_task_procdef FOREIGN KEY (proc_def_id_) REFERENCES public.act_re_procdef(id_);


--
-- TOC entry 5446 (class 2606 OID 49545)
-- Name: act_ru_task act_fk_task_procinst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_task
    ADD CONSTRAINT act_fk_task_procinst FOREIGN KEY (proc_inst_id_) REFERENCES public.act_ru_execution(id_);


--
-- TOC entry 5469 (class 2606 OID 49927)
-- Name: act_id_tenant_member act_fk_tenant_memb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_id_tenant_member
    ADD CONSTRAINT act_fk_tenant_memb FOREIGN KEY (tenant_id_) REFERENCES public.act_id_tenant(id_);


--
-- TOC entry 5470 (class 2606 OID 49939)
-- Name: act_id_tenant_member act_fk_tenant_memb_group; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_id_tenant_member
    ADD CONSTRAINT act_fk_tenant_memb_group FOREIGN KEY (group_id_) REFERENCES public.act_id_group(id_);


--
-- TOC entry 5471 (class 2606 OID 49933)
-- Name: act_id_tenant_member act_fk_tenant_memb_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_id_tenant_member
    ADD CONSTRAINT act_fk_tenant_memb_user FOREIGN KEY (user_id_) REFERENCES public.act_id_user(id_);


--
-- TOC entry 5448 (class 2606 OID 49527)
-- Name: act_ru_identitylink act_fk_tskass_task; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_identitylink
    ADD CONSTRAINT act_fk_tskass_task FOREIGN KEY (task_id_) REFERENCES public.act_ru_task(id_);


--
-- TOC entry 5449 (class 2606 OID 49652)
-- Name: act_ru_variable act_fk_var_batch; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_variable
    ADD CONSTRAINT act_fk_var_batch FOREIGN KEY (batch_id_) REFERENCES public.act_ru_batch(id_);


--
-- TOC entry 5450 (class 2606 OID 49569)
-- Name: act_ru_variable act_fk_var_bytearray; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_variable
    ADD CONSTRAINT act_fk_var_bytearray FOREIGN KEY (bytearray_id_) REFERENCES public.act_ge_bytearray(id_);


--
-- TOC entry 5451 (class 2606 OID 49985)
-- Name: act_ru_variable act_fk_var_case_exe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_variable
    ADD CONSTRAINT act_fk_var_case_exe FOREIGN KEY (case_execution_id_) REFERENCES public.act_ru_case_execution(id_);


--
-- TOC entry 5452 (class 2606 OID 49991)
-- Name: act_ru_variable act_fk_var_case_inst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_variable
    ADD CONSTRAINT act_fk_var_case_inst FOREIGN KEY (case_inst_id_) REFERENCES public.act_ru_case_execution(id_);


--
-- TOC entry 5453 (class 2606 OID 49557)
-- Name: act_ru_variable act_fk_var_exe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_variable
    ADD CONSTRAINT act_fk_var_exe FOREIGN KEY (execution_id_) REFERENCES public.act_ru_execution(id_);


--
-- TOC entry 5454 (class 2606 OID 49563)
-- Name: act_ru_variable act_fk_var_procinst; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_ru_variable
    ADD CONSTRAINT act_fk_var_procinst FOREIGN KEY (proc_inst_id_) REFERENCES public.act_ru_execution(id_);


--
-- TOC entry 5416 (class 2606 OID 44203)
-- Name: _adherent_acheteur fk1j0168w3vyle009g5kv58dhea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._adherent_acheteur
    ADD CONSTRAINT fk1j0168w3vyle009g5kv58dhea FOREIGN KEY (adherent_id) REFERENCES public.y_pm(id);


--
-- TOC entry 5419 (class 2606 OID 44218)
-- Name: _adherent_fournisseur fk1qysb7e1k8f4nosbjd506ebs5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._adherent_fournisseur
    ADD CONSTRAINT fk1qysb7e1k8f4nosbjd506ebs5 FOREIGN KEY (adherent_id) REFERENCES public.y_pm(id);


--
-- TOC entry 5426 (class 2606 OID 44273)
-- Name: y_pm fk3e8m8rjvx2s9toaw91h95gf48; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.y_pm
    ADD CONSTRAINT fk3e8m8rjvx2s9toaw91h95gf48 FOREIGN KEY (x_type_pm_id_fk) REFERENCES public.x_type_personne_morale(x_type_pm_id);


--
-- TOC entry 5427 (class 2606 OID 44268)
-- Name: y_pm fk7d7mlg04aahuhbvvumkle1cl6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.y_pm
    ADD CONSTRAINT fk7d7mlg04aahuhbvvumkle1cl6 FOREIGN KEY (x_situation_judiciaire_id_fk) REFERENCES public.x_situation_judiciaire(x_situation_judiciaire_id);


--
-- TOC entry 5417 (class 2606 OID 44193)
-- Name: _adherent_acheteur fk7dhgi2c4gphyn02mgav03edw2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._adherent_acheteur
    ADD CONSTRAINT fk7dhgi2c4gphyn02mgav03edw2 FOREIGN KEY (acheteur_morale_id) REFERENCES public.y_pm(id);


--
-- TOC entry 5428 (class 2606 OID 44248)
-- Name: y_pm fk8bv0xpa117e1oywb320l3vq2r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.y_pm
    ADD CONSTRAINT fk8bv0xpa117e1oywb320l3vq2r FOREIGN KEY (x_activite_id_fk) REFERENCES public.x_activite(x_activite_id);


--
-- TOC entry 5424 (class 2606 OID 44233)
-- Name: personne_morale_roles fk9oa81trxxat1yfl7aapttyuxx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personne_morale_roles
    ADD CONSTRAINT fk9oa81trxxat1yfl7aapttyuxx FOREIGN KEY (personne_morale_id) REFERENCES public.y_pm(id);


--
-- TOC entry 5420 (class 2606 OID 44213)
-- Name: _adherent_fournisseur fkc2rb3rqbvt0ulxdebigo32iak; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._adherent_fournisseur
    ADD CONSTRAINT fkc2rb3rqbvt0ulxdebigo32iak FOREIGN KEY (fournisseur_physique_id) REFERENCES public.y_pp(id);


--
-- TOC entry 5425 (class 2606 OID 44238)
-- Name: personne_physique_roles fkemfcoumam1lbw7i6d861mgvy0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personne_physique_roles
    ADD CONSTRAINT fkemfcoumam1lbw7i6d861mgvy0 FOREIGN KEY (personne_physique_id) REFERENCES public.y_pp(id);


--
-- TOC entry 5433 (class 2606 OID 44278)
-- Name: y_pp fkeqsd22foyabrso9xdai28d80q; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.y_pp
    ADD CONSTRAINT fkeqsd22foyabrso9xdai28d80q FOREIGN KEY (x_type_piece_ident_id_fk) REFERENCES public."x_type_piece_identité"(x_type_piece_ident_id);


--
-- TOC entry 5422 (class 2606 OID 44223)
-- Name: adherent_contact fkgp6qvt1k79vavmbgof3k3nwwx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adherent_contact
    ADD CONSTRAINT fkgp6qvt1k79vavmbgof3k3nwwx FOREIGN KEY (contact_id) REFERENCES public.y_pp(id);


--
-- TOC entry 5423 (class 2606 OID 44228)
-- Name: adherent_contact fkh7sbwhsd44s6jonqteqan7s6n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adherent_contact
    ADD CONSTRAINT fkh7sbwhsd44s6jonqteqan7s6n FOREIGN KEY (adherent_id) REFERENCES public.y_pm(id);


--
-- TOC entry 5434 (class 2606 OID 44288)
-- Name: y_pp fkjgqjyim2ctp2kt3i0mro72w09; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.y_pp
    ADD CONSTRAINT fkjgqjyim2ctp2kt3i0mro72w09 FOREIGN KEY (x_profession_id_fk) REFERENCES public.x_profession(x_profession_id);


--
-- TOC entry 5429 (class 2606 OID 44258)
-- Name: y_pm fkjjw9afqn7dekera1f133at21; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.y_pm
    ADD CONSTRAINT fkjjw9afqn7dekera1f133at21 FOREIGN KEY (x_groupe_id_fk) REFERENCES public.x_groupe(x_groupe_id);


--
-- TOC entry 5435 (class 2606 OID 44283)
-- Name: y_pp fkkbelm26i9jq4w0u3w5c392r57; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.y_pp
    ADD CONSTRAINT fkkbelm26i9jq4w0u3w5c392r57 FOREIGN KEY (x_nationalite_id_fk) REFERENCES public.x_nationalite(x_nationalite_id);


--
-- TOC entry 5430 (class 2606 OID 44243)
-- Name: y_pm fkleo4t75c8wil0dgb2ucstavnq; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.y_pm
    ADD CONSTRAINT fkleo4t75c8wil0dgb2ucstavnq FOREIGN KEY (x_type_piece_ident_id_fk) REFERENCES public."x_type_piece_identité"(x_type_piece_ident_id);


--
-- TOC entry 5431 (class 2606 OID 44253)
-- Name: y_pm fknj2wvhv8b3aymr3ukgkn2lbd7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.y_pm
    ADD CONSTRAINT fknj2wvhv8b3aymr3ukgkn2lbd7 FOREIGN KEY (x_forme_juridique_id_fk) REFERENCES public.x_forme_juridique(x_forme_juridique_id);


--
-- TOC entry 5432 (class 2606 OID 44263)
-- Name: y_pm fkpeu0r56ijqdhobue2p7qexdkd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.y_pm
    ADD CONSTRAINT fkpeu0r56ijqdhobue2p7qexdkd FOREIGN KEY (x_nationalite_id_fk) REFERENCES public.x_nationalite(x_nationalite_id);


--
-- TOC entry 5418 (class 2606 OID 44198)
-- Name: _adherent_acheteur fksmj4acxywnknogin23fd5i328; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._adherent_acheteur
    ADD CONSTRAINT fksmj4acxywnknogin23fd5i328 FOREIGN KEY (acheteur_physique_id) REFERENCES public.y_pp(id);


--
-- TOC entry 5421 (class 2606 OID 44208)
-- Name: _adherent_fournisseur fksput0k4li19bv153p6l97d1fe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._adherent_fournisseur
    ADD CONSTRAINT fksput0k4li19bv153p6l97d1fe FOREIGN KEY (fournisseur_morale_id) REFERENCES public.y_pm(id);


-- Completed on 2025-03-15 03:09:14

--
-- PostgreSQL database dump complete
--

