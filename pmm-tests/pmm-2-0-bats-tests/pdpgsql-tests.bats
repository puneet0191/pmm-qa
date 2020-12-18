#!/usr/bin/env bats

## Verify all flags for pmm-admin add postgresql --help

PGSQL_USER='postgres'
PGSQL_HOST='localhost'

@test "PMM-T442 run pmm-admin add postgreSQL with pgstatmonitor" {
        COUNTER=0
        IFS=$'\n'
        for i in $(pmm-admin list | grep "PostgreSQL" | awk -F" " '{print $3}') ; do
            let COUNTER=COUNTER+1
            echo "$i"
            PGSQL_IP_PORT=${i}
            run pmm-admin add postgresql --query-source=pgstatmonitor --username=${PGSQL_USER} --password=${PGSQL_PASSWORD} pgstatmonitor_$COUNTER ${PGSQL_IP_PORT}
            echo "$output"
                [ "$status" -eq 0 ]
                echo "${lines[0]}" | grep "PostgreSQL Service added."
                echo "${lines[2]}" | grep "Service name: pgstatmonitor_$COUNTER"
        done
}

@test "PMM-T442 run pmm-admin inventory list agents for check agent postgresql_pgstatmonitor_agent" {
    run pmm-admin inventory list agents
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "postgres_exporter           Running "
    echo "${output}" | grep "postgresql_pgstatmonitor_agent Running "
}

@test "PMM-T442 run pmm-admin add postgreSQL with default query source" {
        COUNTER=0
        IFS=$'\n'
        for i in $(pmm-admin list | grep "PostgreSQL" | awk -F" " '{print $3}') ; do
            let COUNTER=COUNTER+1
            echo "$i"
            PGSQL_IP_PORT=${i}
            run pmm-admin add postgresql --username=${PGSQL_USER} --password=${PGSQL_PASSWORD} pgdefault_$COUNTER ${PGSQL_IP_PORT}
            echo "$output"
                [ "$status" -eq 0 ]
                echo "${lines[0]}" | grep "PostgreSQL Service added."
                echo "${lines[2]}" | grep "Service name: pgdefault_$COUNTER"
        done
}

@test "run pmm-admin add postgreSQL with default query source and metrics mode push" {
        COUNTER=0
        IFS=$'\n'
        for i in $(pmm-admin list | grep "PostgreSQL" | awk -F" " '{print $3}') ; do
            let COUNTER=COUNTER+1
            echo "$i"
            PGSQL_IP_PORT=${i}
            run pmm-admin add postgresql --username=${PGSQL_USER} --password=${PGSQL_PASSWORD} --metrics-mode=push pgsqlpush_$COUNTER ${PGSQL_IP_PORT}
            echo "$output"
                [ "$status" -eq 0 ]
                echo "${lines[0]}" | grep "PostgreSQL Service added."
                echo "${lines[2]}" | grep "Service name: pgsqlpush_$COUNTER"
        done
}

@test "run pmm-admin add postgreSQL with default query source and metrics mode pull" {
        COUNTER=0
        IFS=$'\n'
        for i in $(pmm-admin list | grep "PostgreSQL" | awk -F" " '{print $3}') ; do
            let COUNTER=COUNTER+1
            echo "$i"
            PGSQL_IP_PORT=${i}
            run pmm-admin add postgresql --username=${PGSQL_USER} --password=${PGSQL_PASSWORD} --metrics-mode=pull pgsqlpull_$COUNTER ${PGSQL_IP_PORT}
            echo "$output"
                [ "$status" -eq 0 ]
                echo "${lines[0]}" | grep "PostgreSQL Service added."
                echo "${lines[2]}" | grep "Service name: pgsqlpull_$COUNTER"
        done
}

@test "run pmm-admin remove postgresql with metrics-mode push" {
        COUNTER=0
        IFS=$'\n'
        for i in $(pmm-admin list | grep "PostgreSQL" | grep "pgsqlpush_") ; do
            let COUNTER=COUNTER+1
            run pmm-admin remove postgresql pgsqlpush_$COUNTER
            echo "$output"
            [ "$status" -eq 0 ]
            echo "${output}" | grep "Service removed."
        done
}

@test "run pmm-admin remove postgresql with metrics-mode pull" {
        COUNTER=0
        IFS=$'\n'
        for i in $(pmm-admin list | grep "PostgreSQL" | grep "pgsqlpull_") ; do
            let COUNTER=COUNTER+1
            run pmm-admin remove postgresql pgsqlpull_$COUNTER
            echo "$output"
            [ "$status" -eq 0 ]
            echo "${output}" | grep "Service removed."
        done
}


@test "PMM-T442 run pmm-admin inventory list agents for check agent postgresql_pgstatements_agent" {
    run pmm-admin inventory list agents
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "postgres_exporter           Running "
    echo "${output}" | grep "postgresql_pgstatements_agent Running "
}

@test "PMM-T443 run pmm-admin add postgresql --help to check version" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "version"
}

@test "run pmm-admin add postgresql --help to check metrics-mode=auto" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "metrics-mode=auto"
}

@test "PMM-T443 run pmm-admin add postgresql --help to check server-url" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "server-url=SERVER-URL"
}

@test "PMM-T443 run pmm-admin add postgresql --help to check server-insecure-tls" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "server-insecure-tls"
}

@test "PMM-T443 run pmm-admin add postgresql --help to check debug" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "debug"
}

@test "PMM-T443 run pmm-admin add postgresql --help to check trace" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "trace"
}

@test "PMM-T443 run pmm-admin add postgresql --help to check json" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "json"
}

@test "PMM-T443 run pmm-admin add postgresql --help to check socket" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "socket=SOCKET"
}

@test "PMM-T443 run pmm-admin add postgresql --help to check node-id" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "node-id=NODE-ID"
}

@test "PMM-T443 run pmm-admin add postgresql --help to check pmm-agent-id" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "pmm-agent-id=PMM-AGENT-ID"
}

@test "PMM-T443 run pmm-admin add postgresql --help to check username" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep 'username="postgres"'
}

@test "PMM-T443 run pmm-admin add postgresql --help to check password" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "password=PASSWORD"
}

@test "PMM-T443 run pmm-admin add postgresql --help to check query-source" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "query-source=pgstatements"
}

@test "PMM-T443 run pmm-admin add postgresql --help to check evironment" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "environment=ENVIRONMENT"
}

@test "PMM-T443 run pmm-admin add postgresql --help to check cluster" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "cluster=CLUSTER"
}

@test "PMM-T443 run pmm-admin add postgresql --help to check replication-set" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "replication-set=REPLICATION-SET"
}

@test "PMM-T443 run pmm-admin add postgresql --help to check custom-labels" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "custom-labels=CUSTOM-LABELS"
}

@test "PMM-T443 run pmm-admin add postgresql --help to check skip-connection-check" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "skip-connection-check"
}

@test "PMM-T443 run pmm-admin add postgresql --help to check tls" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "tls"
}

@test "PMM-T443 run pmm-admin add postgresql --help to check tls-skip-verify" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "tls-skip-verify"
}

@test "PMM-T443 run pmm-admin add postgresql --help to check disable-queryexamples" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "disable-queryexamples"
}


@test "run pmm-admin remove postgresql with pgstatmonitor" {
        COUNTER=0
        IFS=$'\n'
        for i in $(pmm-admin list | grep "PostgreSQL" | grep "pgstatmonitor_") ; do
            let COUNTER=COUNTER+1
            run pmm-admin remove postgresql pgstatmonitor_$COUNTER
            echo "$output"
            [ "$status" -eq 0 ]
            echo "${output}" | grep "Service removed."
        done
}

@test "run pmm-admin remove postgresql with default query source" {
        COUNTER=0
        IFS=$'\n'
        for i in $(pmm-admin list | grep "PostgreSQL" | grep "pgdefault_") ; do
            let COUNTER=COUNTER+1
            run pmm-admin remove postgresql pgdefault_$COUNTER
            echo "$output"
            [ "$status" -eq 0 ]
            echo "${output}" | grep "Service removed."
        done
}

function teardown() {
        echo "$output"
}
