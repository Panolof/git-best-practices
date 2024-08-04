# Git Best Practices

### Author
**Name**: Pano Pouroullis <br/>
**Date**: 4th August 2024

# Overview
This document outlines best practices for using Git to ensure privacy and efficiency.

# Best Practices

1. **Configuring Git Identity**:
   - Use a non-personal email for commits to protect privacy.
   ```bash
   git config --global user.name "Your Preferred Name"
   git config --global user.email "your-email@domain.com"
   ```

2. **Commit Messages**:
   - Write clear and concise commit messages.
   ```bash
   git commit -m "Describe the changes made in this commit"
   ```

3. **Ignoring Sensitive Files**:
   - Use a `.gitignore` file to exclude sensitive or unnecessary files.
   ```bash
    cat <<EOL >> .gitignore
    # Ignore data files
    *.csv
    *.json
    *.xml

    # Ignore images
    *.png
    *.jpg
    *.jpeg
    *.gif

    # Ignore LLM context file
    LLM_helper_file_context.txt

    # Ignore OS files
    .DS_Store

    # Ignore IDE files
    .idea/
    .vscode/

    # Ignore log files
    *.log
    EOL
   ```

4. **Rewriting History**:
   - Use `git filter-repo` to clean up sensitive information from commit history.
   ```bash
   git filter-repo --commit-callback '
   if commit.author_email == b"your-email@domain.com":
       commit.author_email = b"noreply-email@domain.com"
       commit.committer_email = b"noreply-email@domain.com"
   ' --force
   ```

5. **Pushing Changes**:
   - Use `git push` to push changes to the remote repository securely.
   ```bash
   git push --force --tags origin 'refs/heads/*'
   ```

# Folder Structure
```
~/repos/
└── git_best_practices/
    ├── README.md
    └── .gitignore
```

# Additional Resources
- [Git Documentation](https://git-scm.com/doc)
- [GitHub Best Practices](https://docs.github.com/en/github)

# Contributing
Feel free to submit issues or pull requests to improve this document. Ensure your contributions adhere to these best practices.

# License
This project is licensed under the MIT License.

