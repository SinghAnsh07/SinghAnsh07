#!/bin/bash

# GSSoC'26 Issue Comment Script
# This script adds a comment to open issues across three repositories

# Define repositories and their issues
declare -A repos=(
    ["AakashRathore136/FinSight-AI"]="1676 1669 1661 1660 1659 1658 1657 1656 1655"
    ["SAPTARSHI-coder/EaseMotion-css"]="89081 89069 89064 88940 88582 88574 88573 88571 88570 88569 88568 88566 88565 88564 88563"
    ["mohdmaazgani/symptom-scribe-clean"]="1313 1263 1157 1154 1153 1152 1151 1125 1120 1092 1055"
)

# Function to get issue creator
get_issue_creator() {
    local repo=$1
    local issue=$2
    gh issue view $issue -R "$repo" --json author --jq '.author.login'
}

# Process each repository
for repo in "${!repos[@]}"; do
    echo "Processing repository: $repo"
    issues=(${repos[$repo]})
    
    # Limit to first 15 issues
    for i in "${!issues[@]}"; do
        if [ $i -ge 15 ]; then
            break
        fi
        
        issue=${issues[$i]}
        creator=$(get_issue_creator "$repo" "$issue")
        
        echo "Adding comment to issue #$issue (creator: @$creator)..."
        
        gh issue comment "$issue" \
            -R "$repo" \
            -b "@$creator I would like to work on this. Can you please assign it to me under GSSoC'26 contributor!?"
        
        echo "✓ Comment added to #$issue"
        
        # Add a small delay to avoid rate limiting
        sleep 1
    done
    
    echo "---"
done

echo "All comments have been added successfully!"
