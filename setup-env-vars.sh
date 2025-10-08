#!/bin/bash

# Setup Environment Variables for open-lovable
# This script helps you add API keys to Vercel

echo "🔐 Environment Variables Setup for open-lovable"
echo "================================================"
echo ""
echo "This script will help you add API keys to Vercel for all environments."
echo ""

# Function to add environment variable to all environments
add_env_var() {
    local var_name=$1
    local var_value=$2

    echo "Adding $var_name..."
    echo "$var_value" | vercel env add "$var_name" production
    echo "$var_value" | vercel env add "$var_name" preview
    echo "$var_value" | vercel env add "$var_name" development
    echo "✅ Added $var_name to all environments"
    echo ""
}

# Required: Firecrawl API Key
echo "📌 REQUIRED: Firecrawl API Key"
echo "Get yours at: https://firecrawl.dev"
read -p "Enter FIRECRAWL_API_KEY (or press Enter to skip): " FIRECRAWL_KEY
if [ ! -z "$FIRECRAWL_KEY" ]; then
    add_env_var "FIRECRAWL_API_KEY" "$FIRECRAWL_KEY"
fi

# AI Provider Keys (need at least one)
echo "🤖 AI PROVIDER KEYS (need at least one)"
echo "========================================"

echo ""
echo "1. Anthropic (Claude)"
echo "   Get from: https://console.anthropic.com"
read -p "Enter ANTHROPIC_API_KEY (or press Enter to skip): " ANTHROPIC_KEY
if [ ! -z "$ANTHROPIC_KEY" ]; then
    add_env_var "ANTHROPIC_API_KEY" "$ANTHROPIC_KEY"
fi

echo ""
echo "2. OpenAI (GPT)"
echo "   Get from: https://platform.openai.com"
read -p "Enter OPENAI_API_KEY (or press Enter to skip): " OPENAI_KEY
if [ ! -z "$OPENAI_KEY" ]; then
    add_env_var "OPENAI_API_KEY" "$OPENAI_KEY"
fi

echo ""
echo "3. Google (Gemini)"
echo "   Get from: https://aistudio.google.com/app/apikey"
read -p "Enter GEMINI_API_KEY (or press Enter to skip): " GEMINI_KEY
if [ ! -z "$GEMINI_KEY" ]; then
    add_env_var "GEMINI_API_KEY" "$GEMINI_KEY"
fi

echo ""
echo "4. Groq (Fast inference)"
echo "   Get from: https://console.groq.com"
read -p "Enter GROQ_API_KEY (or press Enter to skip): " GROQ_KEY
if [ ! -z "$GROQ_KEY" ]; then
    add_env_var "GROQ_API_KEY" "$GROQ_KEY"
fi

# Optional: E2B
echo ""
echo "🛠️  OPTIONAL: E2B Code Interpreter"
echo "=================================="
echo "Get from: https://e2b.dev"
read -p "Enter E2B_API_KEY (or press Enter to skip): " E2B_KEY
if [ ! -z "$E2B_KEY" ]; then
    add_env_var "E2B_API_KEY" "$E2B_KEY"
    echo "Setting SANDBOX_PROVIDER to e2b..."
    add_env_var "SANDBOX_PROVIDER" "e2b"
fi

echo ""
echo "✅ Environment variables setup complete!"
echo ""
echo "📋 Next steps:"
echo "1. Verify at: https://vercel.com/hamstamgrams-projects/open-lovable/settings/environment-variables"
echo "2. Deploy: vercel --prod"
echo "3. Check GitHub Actions: https://github.com/hamstamgram/open-lovable/actions"
