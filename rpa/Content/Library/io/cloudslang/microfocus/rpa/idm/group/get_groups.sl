########################################################################################################################
#!!
#! @description: Gets all groups belonging to the organization.
#!
#! @input org_id: Organization ID the groups belong to.
#!!#
########################################################################################################################
namespace: io.cloudslang.microfocus.rpa.idm.group
flow:
  name: get_groups
  inputs:
    - token
    - org_id
  workflow:
    - idm_http_action:
        do:
          io.cloudslang.microfocus.rpa.idm._operations.idm_http_action:
            - url: "${'/api/scim/organizations/%s/groups' % org_id}"
            - token: '${token}'
            - method: GET
        publish:
          - groups_json: '${return_result}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
  outputs:
    - groups_json: '${groups_json}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      idm_http_action:
        x: 82
        'y': 110
        navigate:
          88b3973e-dd1f-caec-68af-69c6e62eb0fd:
            targetId: 23abcc90-f29e-69b6-9dd3-c3e49052f211
            port: SUCCESS
    results:
      SUCCESS:
        23abcc90-f29e-69b6-9dd3-c3e49052f211:
          x: 263
          'y': 113
