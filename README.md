# Resume Automation

This repository contains a GitHub Actions workflow that compiles `main.tex` into `resume.pdf` whenever changes are pushed.

## How to test the workflow

### 1. Trigger it manually on GitHub
1. Commit and push your changes.
2. Open the **Actions** tab in your GitHub repository.
3. Select **Compile Resume** in the left sidebar.
4. Click **Run workflow**, pick the branch you want to test, and click the green button again. The run will fetch the latest commit, compile `main.tex`, and attach `resume.pdf` as an artifact. On pushes to `main`, it will also update the `resume.pdf` file in the repository if the content changed.

### 2. Run it locally with [`act`](https://github.com/nektos/act)
1. Install `act` (macOS example: `brew install act`).
2. From the root of this repository, run:
   ```bash
   act push -j build
   ```
   This simulates the push event locally, using the same steps defined in the workflow. When it finishes you will find the compiled PDF in the `resume.pdf` file.

If you only want to check that the LaTeX build succeeds without touching GitHub, you can run the `latexmk` command directly:

```bash
latexmk -pdf main.tex
```

This command mirrors what the workflow does in the `Compile LaTeX` step.
