# TSC Structure

The IronCore project is organized into topic areas. Each
topic area owns a set of repositories and its technical decisions, and elects
representatives who form the Technical Steering Committee. This page defines
the areas, the ownership roles, and the election process.

Every TSC seat is tied to a topic area, so each member brings the technical
context of the code they steer and is accountable to the people maintaining it.

## Topic Areas

IronCore has six topic areas.

| Area | Scope | Repositories |
| ---- | ----- | ------------ |
| **IaaS Core** | Core IronCore API, API machinery, orchestration | [ironcore](https://github.com/ironcore-dev/ironcore), [ironcore-in-a-box](https://github.com/ironcore-dev/ironcore-in-a-box), [kubectl-ironcore](https://github.com/ironcore-dev/kubectl-ironcore), [cloud-provider-ironcore](https://github.com/ironcore-dev/cloud-provider-ironcore), [gardener-extension-provider-ironcore](https://github.com/ironcore-dev/gardener-extension-provider-ironcore), [pool-lifecycle-controller](https://github.com/ironcore-dev/pool-lifecycle-controller) |
| **Compute** | Machine/virtualization providers | [libvirt-provider](https://github.com/ironcore-dev/libvirt-provider), [cloud-hypervisor-provider](https://github.com/ironcore-dev/cloud-hypervisor-provider), [FeOS](https://github.com/ironcore-dev/FeOS), [machine-controller-manager-provider-ironcore](https://github.com/ironcore-dev/machine-controller-manager-provider-ironcore) |
| **Storage** | Volume and bucket providers, CSI integration | [ceph-provider](https://github.com/ironcore-dev/ceph-provider), [ironcore-csi-driver](https://github.com/ironcore-dev/ironcore-csi-driver) |
| **Networking** | Virtual networking: dataplane, CNI, peering | [dpservice](https://github.com/ironcore-dev/dpservice), [metalnet](https://github.com/ironcore-dev/metalnet), [metalbond](https://github.com/ironcore-dev/metalbond), [ironcore-net](https://github.com/ironcore-dev/ironcore-net), [ebpf-nat64](https://github.com/ironcore-dev/ebpf-nat64) |
| **Network Automation** | Physical fabric and switch automation (SONiC) | [sonic-operator](https://github.com/ironcore-dev/sonic-operator) |
| **Bare Metal Automation** | Bare metal lifecycle: provisioning, boot, maintenance, DHCP, metal platform integration | [metal-operator](https://github.com/ironcore-dev/metal-operator), [boot-operator](https://github.com/ironcore-dev/boot-operator), [metal-maintenance-operator](https://github.com/ironcore-dev/metal-maintenance-operator), [metal-token-rotate](https://github.com/ironcore-dev/metal-token-rotate), [metaldata](https://github.com/ironcore-dev/metaldata), [FeDHCP](https://github.com/ironcore-dev/FeDHCP), [cluster-api-provider-ironcore-metal](https://github.com/ironcore-dev/cluster-api-provider-ironcore-metal), [metal-load-balancer-controller](https://github.com/ironcore-dev/metal-load-balancer-controller), [cloud-provider-metal](https://github.com/ironcore-dev/cloud-provider-metal), [gardener-extension-provider-ironcore-metal](https://github.com/ironcore-dev/gardener-extension-provider-ironcore-metal), [machine-controller-manager-provider-ironcore-metal](https://github.com/ironcore-dev/machine-controller-manager-provider-ironcore-metal) |

Cross-cutting repositories ([controller-utils](https://github.com/ironcore-dev/controller-utils), [provider-utils](https://github.com/ironcore-dev/provider-utils), [kbake](https://github.com/ironcore-dev/kbake), [os-images](https://github.com/ironcore-dev/os-images)) are owned jointly. Their maintainers are drawn from the affected areas. [ironcore-image](https://github.com/ironcore-dev/ironcore-image) is owned jointly by the Compute and Bare Metal Automation areas. Governance repositories ([community](https://github.com/ironcore-dev/community), [steering](https://github.com/ironcore-dev/steering), [roadmap](https://github.com/ironcore-dev/roadmap), [enhancements](https://github.com/ironcore-dev/enhancements), [documentation](https://github.com/ironcore-dev/ironcore-dev.github.io)) are owned by the TSC as a whole, where enhancements holds the project-wide enhancement proposals.

New repositories are assigned to one topic area at creation. Areas may be
split, merged or created by a two-thirds vote of the TSC.

## Roles

The area structure builds on the roles defined in [Membership](/membership)
(Contributor, Maintainer) and the `*-maintainers` / `*-contributors` teams in
[teams.yaml](https://github.com/ironcore-dev/community/blob/main/teams.yaml).
One additional role exists:

### TSC Representative (Area Lead)

Each topic area elects **two TSC representatives**. The representatives of all
six areas together form the TSC. One person may hold at most one
representative seat, and the two representatives of an area should come from
different employers where possible.

Responsibilities:

- Represent the area in the TSC and vote on cross-area and project-wide matters
- Own the area roadmap and drive it through the TSC
- Chair the area's technical meetings and ensure decisions are documented
- Coordinate releases and cross-cutting work affecting their repositories
- Report area status at TSC meetings

Requirements:

- Be an active maintainer of at least one repository in the area
- Sustained contributions to the area over the last 12 months

### Area Maintainer

As defined in [Membership](/membership). Area maintainers (the
`*-maintainers` teams) are the code owners of the area's repositories: they
review and merge, nominate representative candidates, and run the area
election.

### Contributor

As defined in [Membership](/membership).

## Decision Making

- **Within an area:** decisions are made by the area's maintainers, seeking
  consensus. If consensus fails, the area's two representatives decide (and
  must agree).
- **Cross-area or project-wide:** decisions are made by the TSC per the
  voting rules in the [Charter](charter). Examples: breaking API changes,
  new shared dependencies, architecture changes touching multiple areas,
  repository creation/archival, charter amendments.
- **Escalation:** any maintainer may escalate an area-local decision to the
  TSC if it affects other areas or project-wide policy.

## Elections

- **Size:** 12 voting TSC members, 2 representatives per area.
- **Term:** 12 months. All seats are up for election at the same time, each
  area electing its two representatives.
- **Electorate:** anyone with a merged contribution (code, docs, reviews) in
  the area's repositories during the 12 months before the election.
- **Candidacy:** self-nomination or nomination by an area maintainer.
  Candidates must meet the representative requirements above.
- **Vote:** public vote using a TSC-approved election tool, simple majority
  of the area's electorate. Election officers are
  appointed by the TSC and may not run in the election they administer.
- **Chair:** the TSC elects its Chair among the twelve representatives. The
  Chair keeps their area seat.
- **Vacancy:** a special election is held within 30 days. The remaining
  representative holds the area's votes in the interim.
- **Removal:** a representative may be removed by a two-thirds vote of the
  other representatives, or automatically after 6 months without contributions
  to their area.

### Initial Round

The initial election for all twelve seats is held within 4 weeks of adopting
this structure, following the election process above. The sitting TSC remains
in office until the election concludes and is then dissolved. The elected
representatives take over all twelve seats.

## Area Representatives

The representatives currently elected for each topic area.

### IaaS Core

| Name | GitHub | Employer |
| ---- | ------ | -------- |
|           |        |          |
|           |        |          |

### Compute

| Name | GitHub | Employer |
| ---- | ------ | -------- |
|           |        |          |
|           |        |          |

### Storage

| Name | GitHub | Employer |
| ---- | ------ | -------- |
|           |        |          |
|           |        |          |

### Networking

| Name | GitHub | Employer |
| ---- | ------ | -------- |
|           |        |          |
|           |        |          |

### Network Automation

| Name | GitHub | Employer |
| ---- | ------ | -------- |
|           |        |          |
|           |        |          |

### Bare Metal Automation

| Name | GitHub | Employer |
| ---- | ------ | -------- |
|           |        |          |
|           |        |          |
