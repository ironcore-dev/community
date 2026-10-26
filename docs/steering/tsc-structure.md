# TSC Structure

The IronCore project is organized into topic areas. Each
topic area owns a set of repositories and its technical decisions, and elects
representatives who form the Technical Steering Committee. This page defines
the areas, the ownership roles, and the election process.

Every TSC seat is tied to a topic area, so each member brings the technical
context of the code they steer and is accountable to the people maintaining it.

## Topic Areas

IronCore has three topic areas, aligned with the `*-maintainers` teams in
[teams.yaml](https://github.com/ironcore-dev/community/blob/main/teams.yaml):

| Area | Maintainers team |
| ---- | ---------------- |
| **IaaS** | `iaas-maintainers` |
| **Metal** | `metal-maintainers` |
| **Network** | `network-maintainers` |

Each maintainers team owns the area's repositories (via code ownership in the
repositories themselves).
Governance repositories (community, steering, roadmap, enhancements,
documentation) are owned by the TSC as a whole.

New repositories are assigned to one topic area at creation. Areas may be
split, merged or created by a two-thirds vote of the TSC, with the
corresponding change to `teams.yaml`.

## Roles

The area structure builds on the roles defined in [Membership](/membership)
(Contributor, Maintainer) and the `*-maintainers` / `*-contributors` teams in
[teams.yaml](https://github.com/ironcore-dev/community/blob/main/teams.yaml).
One additional role exists:

### TSC Representative (Area Lead)

Each topic area elects **two TSC representatives** from its maintainers team.
The representatives of all three areas together form the TSC. One person may
hold at most one representative seat, and the two representatives of an area
should come from different employers where possible.

Responsibilities:

- Represent the area in the TSC and vote on cross-area and project-wide matters
- Own the area roadmap and drive it through the TSC
- Chair the area's technical meetings and ensure decisions are documented
- Coordinate releases and cross-cutting work affecting their repositories
- Report area status at TSC meetings

Requirements:

- Be a member of the area's `*-maintainers` team

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

- **Size:** 6 voting TSC members, 2 representatives per area.
- **Term:** 12 months. All seats are up for election at the same time, each
  area electing its two representatives.
- **Electorate:** anyone who is a contributor of the area at the time when the vote is started.
- **Candidacy:** self-nomination or nomination by an area maintainer.
  Candidates must meet the representative requirements above. Each person
  may stand as a candidate for at most one position per election cycle:
  either one area representative seat or the Chair.
- **Vote:** public vote through a TSC-approved election tool, using the single non-transferable vote (SNTV): each voter casts one vote, and the candidates with the most votes win the seats.
- **Chair:** the TSC Chair is elected by vote of all project maintainers
  (any member of a `*-maintainers` team is eligible to vote and to run). The
  Chair must not hold an area representative seat.
- **Stand-in:** if a representative is temporarily unavailable, the area's
  remaining representative may call a stand-in from the other maintainers in
  the area's group. The stand-in votes on the area's behalf until the
  representative returns or a special election concludes.
- **Vacancy:** a special election is held within 30 days. The remaining
  representative holds the area's votes in the interim (a stand-in may be
  called as above).
- **Removal:** a representative may be removed by a two-thirds vote of the
  other representatives, or automatically after 6 months without contributions
  to their area. This automatically triggers a special election to elect their replacement.

### Initial Round

The initial election for all six seats is held within 4 weeks of adopting
this structure, following the election process above. The sitting TSC remains
in office until the election concludes and is then dissolved. The elected
representatives take over all six seats.

## Area Representatives

The representatives currently elected for each topic area.

### IaaS

| Name | GitHub | Employer |
| ---- | ------ | -------- |
|           |        |          |
|           |        |          |

### Metal

| Name | GitHub | Employer |
| ---- | ------ | -------- |
|           |        |          |
|           |        |          |

### Network

| Name | GitHub | Employer |
| ---- | ------ | -------- |
|           |        |          |
|           |        |          |
