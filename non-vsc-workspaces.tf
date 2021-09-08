resource "tfe_workspace" "an-api-driven-workspace" {
    allow_destroy_plan            = true
    auto_apply                    = false
    description                   = "an-api-driven-workspace"
    execution_mode                = "remote"
    file_triggers_enabled         = false
    global_remote_state           = false
    name                          = "an-api-driven-workspace"
    organization                  = "yulei"
    queue_all_runs                = false
    remote_state_consumer_ids     = []
    speculative_enabled           = false
    structured_run_output_enabled = true
    tag_names                     = []
    terraform_version             = "1.0.6"
    trigger_prefixes              = []
}

