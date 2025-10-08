# GitHub Actions Quick Start

Quick guide to get your GitHub Actions up and running.

## Prerequisites

- GitHub repository with admin access
- Vercel account (for deployments)
- API keys for AI services (see `.env.example`)

## Step 1: Add GitHub Secrets

1. Go to your repository on GitHub
2. Click **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret**
4. Add the following secret:

### Required Secret

| Secret Name | Description | How to Get It |
|------------|-------------|---------------|
| `VERCEL_TOKEN` | Vercel deployment token | 1. Go to [Vercel Tokens](https://vercel.com/account/tokens)<br>2. Create new token<br>3. Copy and paste as secret |

## Step 2: Configure Vercel Environment Variables

1. Go to [Vercel Dashboard](https://vercel.com/dashboard)
2. Select your project (or import from GitHub)
3. Go to **Settings** → **Environment Variables**
4. Add these variables (at minimum one AI provider):

### Required Variables

```
FIRECRAWL_API_KEY          # From https://firecrawl.dev
```

### AI Provider (choose at least one)

```
ANTHROPIC_API_KEY          # From https://console.anthropic.com
OPENAI_API_KEY             # From https://platform.openai.com
GEMINI_API_KEY             # From https://aistudio.google.com/app/apikey
GROQ_API_KEY               # From https://console.groq.com
```

### Sandbox Provider (choose one)

**Option A: Vercel Sandbox (Recommended)**
```
SANDBOX_PROVIDER=vercel
VERCEL_OIDC_TOKEN          # Auto-generated via vercel link
```

**Option B: E2B Sandbox**
```
SANDBOX_PROVIDER=e2b
E2B_API_KEY                # From https://e2b.dev
```

Make sure to add variables for all environments: **Production**, **Preview**, and **Development**.

## Step 3: Enable Workflow Permissions

1. Go to repository **Settings** → **Actions** → **General**
2. Scroll to **Workflow permissions**
3. Select **Read and write permissions**
4. Check **Allow GitHub Actions to create and approve pull requests**
5. Click **Save**

## Step 4: Push to GitHub

```bash
# Make sure you're in the project directory
cd /Users/mama/Desktop/open-lovable

# Add all files
git add .

# Commit changes
git commit -m "Add GitHub Actions workflows"

# Push to main branch
git push origin main
```

## Step 5: Verify Workflows

1. Go to your repository's **Actions** tab
2. You should see workflows running
3. Check for any errors (usually related to missing secrets)

## Step 6: Test with a Pull Request

```bash
# Create a new branch
git checkout -b test-actions

# Make a small change
echo "# Test" >> TEST.md

# Commit and push
git add TEST.md
git commit -m "Test GitHub Actions"
git push origin test-actions
```

1. Go to GitHub and create a pull request
2. Wait for CI to run
3. Check for preview deployment comment on the PR

## Troubleshooting

### ❌ "No token found" error
→ Add `VERCEL_TOKEN` to GitHub secrets

### ❌ Build fails
→ Check that all required environment variables are in Vercel
→ Try building locally: `npm run build`

### ❌ No preview URL comment
→ Enable "Read and write permissions" in Actions settings

### ❌ Type errors
→ Run `npx tsc --noEmit` locally to see errors
→ Fix type errors before pushing

## What Gets Deployed

- **Main branch** → Production deployment (automatic)
- **Pull requests** → Preview deployment (automatic)
- **Other branches** → No deployment (only CI runs)

## Next Steps

✅ Your GitHub Actions are now configured!

- Monitor the Actions tab for workflow runs
- Check Vercel dashboard for deployments
- See [GITHUB_ACTIONS_SETUP.md](./GITHUB_ACTIONS_SETUP.md) for detailed documentation

## Need Help?

- [GitHub Actions Logs](https://github.com/firecrawl/open-lovable/actions) - Check workflow execution details
- [Vercel Dashboard](https://vercel.com/dashboard) - Monitor deployments
- [Detailed Setup Guide](./GITHUB_ACTIONS_SETUP.md) - Full documentation
