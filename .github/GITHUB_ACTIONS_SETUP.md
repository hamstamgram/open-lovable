# GitHub Actions Setup Guide

This guide explains how to configure GitHub Actions workflows for the open-lovable project.

## Overview

The project includes three main workflows:

1. **CI Workflow** (`ci.yml`) - Runs on push and pull requests
2. **Production Deployment** (`deploy.yml`) - Deploys to production on main branch
3. **Preview Deployment** (`preview.yml`) - Creates preview deployments for pull requests

## Required GitHub Secrets

To enable the workflows, you need to configure the following secrets in your GitHub repository.

### How to Add Secrets

1. Go to your GitHub repository
2. Navigate to **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret**
4. Add each secret listed below

### Required Secrets

#### `VERCEL_TOKEN`
- **Description**: Vercel authentication token for deployments
- **How to get it**:
  1. Go to [Vercel Account Settings](https://vercel.com/account/tokens)
  2. Create a new token with the name "GitHub Actions"
  3. Copy the token value
  4. Add it as `VERCEL_TOKEN` in GitHub secrets

#### `VERCEL_ORG_ID` (Optional but recommended)
- **Description**: Your Vercel organization/team ID
- **How to get it**:
  1. Run `vercel link` in your project directory
  2. Open `.vercel/project.json`
  3. Copy the `orgId` value
  4. Add it as `VERCEL_ORG_ID` in GitHub secrets

#### `VERCEL_PROJECT_ID` (Optional but recommended)
- **Description**: Your Vercel project ID
- **How to get it**:
  1. Run `vercel link` in your project directory
  2. Open `.vercel/project.json`
  3. Copy the `projectId` value
  4. Add it as `VERCEL_PROJECT_ID` in GitHub secrets

### Environment Variables for AI Services

Your application uses multiple AI services. You may need to add these as **Environment Variables** in Vercel:

#### Anthropic (Claude)
- `ANTHROPIC_API_KEY` - Your Anthropic API key from [console.anthropic.com](https://console.anthropic.com/)

#### OpenAI
- `OPENAI_API_KEY` - Your OpenAI API key from [platform.openai.com](https://platform.openai.com/)

#### Google AI
- `GOOGLE_GENERATIVE_AI_API_KEY` - Your Google AI API key from [ai.google.dev](https://ai.google.dev/)

#### Groq
- `GROQ_API_KEY` - Your Groq API key from [console.groq.com](https://console.groq.com/)

#### Firecrawl
- `FIRECRAWL_API_KEY` - Your Firecrawl API key from [firecrawl.dev](https://firecrawl.dev/)

#### E2B Code Interpreter
- `E2B_API_KEY` - Your E2B API key from [e2b.dev](https://e2b.dev/)

### Adding Environment Variables to Vercel

1. Go to your [Vercel Dashboard](https://vercel.com/dashboard)
2. Select your project
3. Go to **Settings** → **Environment Variables**
4. Add each variable for:
   - Production
   - Preview
   - Development (optional)

## Workflow Details

### CI Workflow (`ci.yml`)

**Triggers:**
- Push to `main` or `develop` branches
- Pull requests to `main` or `develop` branches

**Jobs:**
1. **Lint and Type Check**
   - Runs ESLint
   - Runs TypeScript type checking

2. **Build**
   - Builds the Next.js application
   - Uploads build artifacts

### Production Deployment (`deploy.yml`)

**Triggers:**
- Push to `main` branch
- Manual trigger via workflow_dispatch

**Jobs:**
- Deploys to Vercel production environment
- Uses production environment variables

### Preview Deployment (`preview.yml`)

**Triggers:**
- Pull requests to `main` or `develop` branches

**Jobs:**
- Creates a preview deployment on Vercel
- Posts preview URL as a comment on the PR

## Verifying Setup

1. **Push code to GitHub:**
   ```bash
   git add .
   git commit -m "Add GitHub Actions workflows"
   git push origin main
   ```

2. **Check Actions tab:**
   - Go to your repository's **Actions** tab
   - Verify that workflows are running
   - Check for any errors

3. **Test with a Pull Request:**
   - Create a new branch: `git checkout -b test-workflows`
   - Make a small change
   - Push and create a PR
   - Verify that CI and preview deployment run successfully

## Troubleshooting

### Workflow fails with "Error: No token found"
- Make sure `VERCEL_TOKEN` is added to GitHub secrets
- Verify the token is valid and not expired

### Deployment fails with build errors
- Check that all required environment variables are set in Vercel
- Verify the build works locally with `npm run build`

### Type check fails
- Run `npx tsc --noEmit` locally to see TypeScript errors
- Fix any type errors before pushing

### Preview deployment doesn't comment on PR
- Verify that GitHub Actions has permission to comment on PRs
- Check repository settings → Actions → General → Workflow permissions
- Enable "Read and write permissions"

## Next Steps

1. ✅ Add all required secrets to GitHub
2. ✅ Configure environment variables in Vercel
3. ✅ Push code to trigger workflows
4. ✅ Create a test PR to verify preview deployments
5. ✅ Monitor the Actions tab for any issues

## Additional Resources

- [Vercel GitHub Actions Documentation](https://vercel.com/docs/deployments/git/vercel-for-github)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Next.js Deployment Documentation](https://nextjs.org/docs/deployment)
