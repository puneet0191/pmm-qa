#!/usr/bin/env bats

## Verify all flags for pmm-admin add postgresql --help


PGSQL_USER='postgres'
PGSQL_HOST='localhost'

@test "run pmm-admin add postgresql --help to check version" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "version"
}

@test "run pmm-admin add postgresql --help to check server-url" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "server-url=SERVER-URL"
}

@test "run pmm-admin add postgresql --help to check server-insecure-tls" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "server-insecure-tls"
}

@test "run pmm-admin add postgresql --help to check debug" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "debug"
}

@test "run pmm-admin add postgresql --help to check trace" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "trace"
}

@test "run pmm-admin add postgresql --help to check json" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "json"
}

@test "run pmm-admin add postgresql --help to check socket" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "socket=SOCKET"
}

@test "run pmm-admin add postgresql --help to check node-id" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "node-id=NODE-ID"
}

@test "run pmm-admin add postgresql --help to check pmm-agent-id" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "pmm-agent-id=PMM-AGENT-ID"
}

@test "run pmm-admin add postgresql --help to check username" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep 'username="postgres"'
}

@test "run pmm-admin add postgresql --help to check password" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "password=PASSWORD"
}

@test "run pmm-admin add postgresql --help to check query-source" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "query-source=pgstatements"
}

@test "run pmm-admin add postgresql --help to check evironment" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "environment=ENVIRONMENT"
}

@test "run pmm-admin add postgresql --help to check cluster" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "cluster=CLUSTER"
}

@test "run pmm-admin add postgresql --help to check replication-set" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "replication-set=REPLICATION-SET"
}

@test "run pmm-admin add postgresql --help to check custom-labels" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "custom-labels=CUSTOM-LABELS"
}

@test "run pmm-admin add postgresql --help to check skip-connection-check" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "skip-connection-check"
}

@test "run pmm-admin add postgresql --help to check tls" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "tls"
}

@test "run pmm-admin add postgresql --help to check tls-skip-verify" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "tls-skip-verify"
}

@test "run pmm-admin add postgresql --help to check disable-queryexamples" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "disable-queryexamples"
}

@test "run pmm-admin add postgresql --help to check service-name" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "service-name=NAME"
}

@test "run pmm-admin add postgresql --help to check host" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "host=HOST"
}

@test "run pmm-admin add postgresql --help to check port" {
    run pmm-admin add postgresql --help
    echo "$output"
    [ "$status" -eq 0 ]
    echo "${output}" | grep "port=PORT"
}

function teardown() {
        echo "$output"
}