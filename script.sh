#!/bin/bash

# Root directory for narratives
narratives_dir="narratives"

# Create the root narratives directory if it doesn't exist
if [ ! -d "$narratives_dir" ]; then
  mkdir "$narratives_dir"
fi

# Get today's date in YYYY-MM-DD format
today=$(date +%Y-%m-%d)

# Loop through user numbers 1 to 12
for i in {1..12}; do
  user="user$i"

  # Determine tier based on user number
  if (( i <= 3 )); then
    tier="1"
  elif (( i > 3 && i <= 5 )); then
    tier="2"
  else
    tier="3"
  fi

  # Create user directory if it doesn't exist
  user_dir="$narratives_dir/$user"
  if [ ! -d "$user_dir" ]; then
    mkdir "$user_dir"
  fi

  # Create a date-stamped directory for today's publication
  publication_dir="$user_dir/$today"
  if [ ! -d "$publication_dir" ]; then
    mkdir "$publication_dir"
  fi

  # Touch the story.md file in the publication directory
  touch "$publication_dir/story.md"

  # Create the meta.json file in the publication directory
  cat << EOF > "$publication_dir/meta.json"
{
    "characterId": "$i",
    "tier": "$tier",
    "publishedDate": "$today",
    "interactions": []
}
EOF

done

echo "Directory structure created for users user1 through user12 with tier assignments."