
function Get-BBServerPullRequest
{
    <#
    .SYNOPSIS
    Gets the pull requests in a repository.

    .DESCRIPTION
    The `Get-BBServerPullRequest` function gets the open pull requests in a repository. The server to connect to is represented by a connection object (returned by the `New-BBServerConnection` function) and passed to the `Connection` parameter. Pass the repository's key to the `RepositoryKey`. Pass the repository's project key to the `ProjectKey` parameter. 

    To get a specific pull request, pass its ID to the `ID` parameter.

    Pull request objects look like this:

        id           : 432
        version      : 1
        title        : A pull request
        state        : OPEN
        open         : True
        closed       : False
        createdDate  : 1499808891000
        updatedDate  : 1499808891000
        fromRef      : @{id=refs/heads/feature/pull-requests; displayId=feature/pull-requests; latestCommit=44ca1a493008d2fe8228bb3224d2a220215e5983; repository=}
        toRef        : @{id=refs/heads/master; displayId=master; latestCommit=8da9e38f8cae52a072ec78ba9d1d327eebbdacdb; repository=}
        locked       : False
        author       : @{user=; role=AUTHOR; approved=False; status=UNAPPROVED}
        reviewers    : {}
        participants : {}
        properties   : @{commentCount=3; openTaskCount=0; resolvedTaskCount=0; mergeResult=}
        links        : @{self=System.Object[]}

    See https://developer.atlassian.com/static/rest/bitbucket-server/latest/bitbucket-rest.html#idm45866556520608 for docs.

    .EXAMPLE
    Get-BBServerPullRequest -Connection $connection -ProjectKey 'BBS' -RepositoryKey 'BitbucketServerAutomation'

    Demonstrates how to gets all the open pull requests in the `BBS/BitbucketServerAutomation` repository.

    .EXAMPLE
    Get-BBServerPullRequest -Connection $connection -ProjectKey 'BBS' -RepositoryKey 'BitbucketServerAutomation' -ID 432

    Demonstrates how to gets a specific pull request. In this case, pull request `432` will be returned.
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [object]
        # The connection to Bitbucket Server. Use `New-BBServerConnection` to create a connection object.
        $Connection,

        [Parameter(Mandatory=$true)]
        [string]
        # The project key of the repositroy whose pull requests to get.
        $ProjectKey,

        [Parameter(Mandatory=$true)]
        [object]
        # The repository key of the repository whose pull requests to get.
        $RepositoryKey,

        [int]
        # The ID of a specific pull request to get. The default is to get all open pull requests.
        $ID
    )

    Set-StrictMode -Version 'Latest'
}