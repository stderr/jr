# Jr
Jr is a gem to assist in reporting from JIRA on ticket counts,
availability of engineers, and current work. It is mostly specific
to Instructure's usage of JIRA.

It relies on two things: a `.jrrc` file in your `$HOME` directory,
and `$JIRA_USERNAME` and `$JIRA_PASSWORD` environment variables.

In your `.jrrc` file, you define a JSON object, whose root keys are
the names of your projects. Each project relies on two keys: a `site`
attribute, which specifies the root url of your JIRA instance, and a `jql`
attribute, which is a JQL string that will specify the issues that will
be pulled for reporting of that particular project.

## Tasks
Tasks are the reporting commands you can supply to Jr on the command
line. There are currently three tasks:

- `all` Reports all tickets that match the project's specified JQL.
- `current` Reports the current tickets from the project that are
being worked on, with the ticket id, assignee, summary, and time
since creation.
- `points` Reports the total, active, and closed story
points in the specified project.

## Example Usage
```
$ JIRA_USERNAME=jsmith JIRA_PASSWORD=hunter12 jr my_project points
```
