const { Octokit } = require('@octokit/rest');

(async () => {
    try {
        const octokit = new Octokit({
            auth: process.env.GITHUB_TOKEN
        });

        const { owner, repo, number } = context.issue;

        const { data: comments } = await octokit.issues.listComments({
            owner,
            repo,
            issue_number: number
        });

        const commentsCount = comments.length;
        console.log(`Total comments: ${commentsCount}`);
        process.stdout.write(`::set-output name=commentsCount::${commentsCount}`);
    } catch (error) {
        console.error(error);
        process.exit(1);
    }
})();
